import 'dotenv/config';
import fs from 'node:fs';
import path from 'node:path';
import { nanoid } from 'nanoid';
import { parse as parseCsv } from 'csv-parse/sync';

import { prisma } from '../db/prisma.js';

type HazardType = 'fixedRadar' | 'mobileRadar' | 'police' | 'accident' | 'works' | 'danger';

function asType(v: string): HazardType {
  const x = v.trim();
  if (['fixedRadar', 'mobileRadar', 'police', 'accident', 'works', 'danger'].includes(x)) return x as HazardType;
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

async function main() {
  const file = process.env.HAZARDS_IMPORT_FILE;
  const source = process.env.HAZARDS_SOURCE ?? 'dataset:import';
  const isStatic = (process.env.HAZARDS_STATIC ?? 'true') === 'true';

  if (!file) throw new Error('Set HAZARDS_IMPORT_FILE=/path/to/file.(csv|json)');

  const abs = path.isAbsolute(file) ? file : path.join(process.cwd(), file);
  const ext = path.extname(abs).toLowerCase();
  const raw = fs.readFileSync(abs, 'utf-8');

  let rows: any[] = [];

  if (ext === '.json') {
    const parsed = JSON.parse(raw);
    rows = Array.isArray(parsed) ? parsed : parsed.items ?? [];
  } else if (ext === '.csv') {
    rows = parseCsv(raw, { columns: true, skip_empty_lines: true, relax_column_count: true });
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

  for (const r of rows) {
    const lat = toNum(r.lat ?? r.latitude ?? r.Lat ?? r.LAT);
    const lng = toNum(r.lng ?? r.lon ?? r.longitude ?? r.Lng ?? r.LON);
    const type = asType(String(r.type ?? r.kind ?? r.category ?? 'fixedRadar'));
    const title = (r.title ?? r.name ?? r.desc ?? '').toString().slice(0, 120) || null;
    const countryCode = (r.countryCode ?? r.cc ?? r.country ?? '').toString().slice(0, 2) || null;

    // Grid key to dedupe (rough): ~10m
    const glat = Math.round(lat * 10000);
    const glng = Math.round(lng * 10000);
    const dedupeKey = `${type}:${glat}:${glng}`;

    const existing = await prisma.hazardEvent.findFirst({
      where: { source, type: type as any, isStatic, title, countryCode, lat: { gte: lat - 0.0001, lte: lat + 0.0001 }, lng: { gte: lng - 0.0001, lte: lng + 0.0001 } },
      select: { id: true },
    });

    if (existing) {
      await prisma.hazardEvent.update({
        where: { id: existing.id },
        data: { isActive: true, lastSeenAt: now, title, countryCode },
      });
      updated += 1;
      continue;
    }

    await prisma.hazardEvent.create({
      data: {
        id: nanoid(),
        type: type as any,
        lat,
        lng,
        title,
        countryCode,
        isActive: true,
        isStatic,
        source,
        expiresAt: null,
        lastSeenAt: now,
      },
    });
    created += 1;

    if ((created + updated) % 500 === 0) {
      console.log(`Progress: ${created + updated} (created ${created}, updated ${updated})`);
    }

    void dedupeKey; // reserved for future advanced dedupe
  }

  console.log('Done.', { total: created + updated, created, updated });
}

main()
  .catch((e) => {
    console.error(e);
    process.exitCode = 1;
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
