import 'dotenv/config';
import fs from 'node:fs';
import path from 'node:path';
import crypto from 'node:crypto';
import { parse as parseCsv } from 'csv-parse/sync';
import AdmZip from 'adm-zip';

import { prisma } from '../db/prisma.js';

type HazardType =
  | 'fixedRadar'
  | 'mobileRadar'
  | 'police'
  | 'accident'
  | 'works'
  | 'danger'
  | 'redLight'
  | 'sectionControl';

function asType(v: string): HazardType {
  const x = v.trim();
  if (['fixedRadar', 'mobileRadar', 'police', 'accident', 'works', 'danger', 'redLight', 'sectionControl'].includes(x)) {
    return x as HazardType;
  }
  // fallback mapping
  const lower = x.toLowerCase();
  if (lower.includes('fix')) return 'fixedRadar';
  if (lower.includes('mob')) return 'mobileRadar';
  if (lower.includes('pol')) return 'police';
  if (lower.includes('acc')) return 'accident';
  if (lower.includes('work') || lower.includes('obra')) return 'works';
  return 'danger';
}

function toNum(v: any) {
  const n = typeof v === 'number' ? v : Number(String(v).replace(',', '.'));
  if (!Number.isFinite(n)) throw new Error(`Invalid number: ${v}`);
  return n;
}

function toIntOrNull(v: any): number | null {
  const s = String(v ?? '').trim();
  if (!s) return null;
  const n = Number(s);
  if (!Number.isFinite(n)) return null;
  return Math.trunc(n);
}

function stableId(input: string) {
  return crypto.createHash('sha1').update(input).digest('base64url').slice(0, 22);
}

function extractDocxText(docxPath: string): string {
  const zip = new AdmZip(docxPath);
  const xml = zip.readAsText('word/document.xml');
  const matches = xml.matchAll(/<w:t[^>]*>(.*?)<\/w:t>/g);
  const parts: string[] = [];
  for (const m of matches) {
    parts.push(m[1] ?? '');
  }
  return parts.join('\n');
}

function mapSpeedCamType(typeNum: number): HazardType {
  // Common SpeedCamText mapping:
  // 1 fixed, 2 mobile, 3 redLight, 4 sectionControl/avg
  if (typeNum === 1) return 'fixedRadar';
  if (typeNum === 2) return 'mobileRadar';
  if (typeNum === 3) return 'redLight';
  if (typeNum === 4) return 'sectionControl';
  return 'danger';
}

async function main() {
  const file = process.env.HAZARDS_IMPORT_FILE;
  const source = process.env.HAZARDS_SOURCE ?? 'dataset:import';
  const isStatic = (process.env.HAZARDS_STATIC ?? 'true') === 'true';
  const replace = (process.env.HAZARDS_REPLACE ?? 'true') === 'true';

  if (!file) throw new Error('Set HAZARDS_IMPORT_FILE=/path/to/file.(csv|json)');

  const abs = path.isAbsolute(file) ? file : path.join(process.cwd(), file);
  const ext = path.extname(abs).toLowerCase();
  const raw = fs.readFileSync(abs);

  let rows: any[] = [];

  if (ext === '.json') {
    const parsed = JSON.parse(raw.toString('utf-8'));
    rows = Array.isArray(parsed) ? parsed : parsed.items ?? [];
  } else if (ext === '.csv') {
    rows = parseCsv(raw.toString('utf-8'), { columns: true, skip_empty_lines: true, relax_column_count: true });
  } else if (ext === '.txt') {
    // SpeedCamText: X,Y,TYPE,SPEED,DIRTYPE,DIRECTION (lon,lat,...)
    rows = parseCsv(raw.toString('utf-8'), { columns: true, skip_empty_lines: true, relax_column_count: true });
  } else if (ext === '.docx') {
    // SpeedCamText exported into a Word doc: extract actual text from docx XML.
    const text = extractDocxText(abs);
    // Heuristic: find header
    const idx = text.indexOf('X,Y,TYPE');
    const slice = idx >= 0 ? text.slice(idx) : text;
    rows = parseCsv(slice, { columns: true, skip_empty_lines: true, relax_column_count: true });
  } else {
    throw new Error('Unsupported file type. Use CSV or JSON.');
  }

  if (!rows.length) {
    console.log('No rows found.');
    return;
  }

  // Expected headers (flexible): lat/lng OR latitude/longitude; type; title; countryCode
  const now = new Date();

  let created = 0;
  let updated = 0;
  let inputRows = 0;
  let skippedInvalid = 0;
  let deduped = 0;

  // in-memory dedupe by type + ~11m grid to keep import fast
  const seen = new Set<string>();
  const buffer: any[] = [];

  if (replace) {
    const del = await prisma.hazardEvent.deleteMany({ where: { source, isStatic } });
    console.log('Deleted existing hazards for source', { source, isStatic, deleted: del.count });
  }

  const flush = async () => {
    if (buffer.length === 0) return;
    const res = await prisma.hazardEvent.createMany({ data: buffer });
    created += res.count;
    buffer.length = 0;
  };

  for (const r of rows) {
    inputRows += 1;
    try {
      // Support both generic schemas and SpeedCamText (X/Y)
      let lat: number;
      let lng: number;
      let type: HazardType;
      let speedKph: number | null = null;
      let directionDeg: number | null = null;

      if (r.X != null && r.Y != null && r.TYPE != null) {
        // SpeedCamText: X=lon, Y=lat
        lng = toNum(r.X);
        lat = toNum(r.Y);
        const t = toIntOrNull(r.TYPE) ?? 1;
        type = mapSpeedCamType(t);
        speedKph = toIntOrNull(r.SPEED);
        directionDeg = toIntOrNull(r.DIRECTION);
      } else {
        lat = toNum(r.lat ?? r.latitude ?? r.Lat ?? r.LAT);
        lng = toNum(r.lng ?? r.lon ?? r.longitude ?? r.Lng ?? r.LON);
        type = asType(String(r.type ?? r.kind ?? r.category ?? 'fixedRadar'));
      }

      const title = (r.title ?? r.name ?? r.desc ?? '').toString().slice(0, 120) || null;
      const countryCode = (r.countryCode ?? r.cc ?? r.country ?? '').toString().slice(0, 2) || null;

      const glat = Math.round(lat * 10000);
      const glng = Math.round(lng * 10000);
      const key = `${type}:${glat}:${glng}`;
      if (seen.has(key)) {
        deduped += 1;
        continue;
      }
      seen.add(key);

      const id = stableId(`${source}:${key}`);
      buffer.push({
        id,
        type,
        lat,
        lng,
        title,
        countryCode,
        isActive: true,
        isStatic,
        source,
        expiresAt: null,
        lastSeenAt: now,
        speedKph,
        directionDeg,
      });

      if (buffer.length >= 1000) {
        await flush();
        if ((created + updated) % 5000 === 0) {
          console.log(`Progress: inserted ~${created} (deduped ${deduped}, scanned ${inputRows})`);
        }
      }
    } catch {
      skippedInvalid += 1;
    }
  }

  await flush();

  console.log('Done.', { scanned: inputRows, inserted: created, updated, deduped, skippedInvalid });
}

main()
  .catch((e) => {
    console.error(e);
    process.exitCode = 1;
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
