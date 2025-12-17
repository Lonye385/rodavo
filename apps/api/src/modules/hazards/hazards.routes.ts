import type { FastifyPluginAsync } from 'fastify';
import { z } from 'zod';
import { nanoid } from 'nanoid';

import { prisma } from '../../db/prisma.js';

const ReportSchema = z.object({
  type: z.enum(['fixedRadar', 'mobileRadar', 'police', 'accident', 'works', 'danger']),
  lat: z.number().min(-90).max(90),
  lng: z.number().min(-180).max(180),
  countryCode: z.string().min(2).max(2).optional(),
  title: z.string().max(120).optional(),
});

export const hazardsRoutes: FastifyPluginAsync = async (app) => {
  app.get('/hazards/nearby', async (req) => {
    const q = z
      .object({
        lat: z.coerce.number(),
        lng: z.coerce.number(),
        radiusMeters: z.coerce.number().default(1000),
      })
      .parse(req.query);

    // Simple bounding box filter (fast); exact distance can be done client-side.
    const dLat = q.radiusMeters / 111_000;
    const dLng = q.radiusMeters / (111_000 * Math.cos((q.lat * Math.PI) / 180));

    const now = new Date();
    const events = await prisma.hazardEvent.findMany({
      where: {
        isActive: true,
        OR: [{ expiresAt: null }, { expiresAt: { gt: now } }],
        lat: { gte: q.lat - dLat, lte: q.lat + dLat },
        lng: { gte: q.lng - dLng, lte: q.lng + dLng },
      },
      take: 200,
      orderBy: { updatedAt: 'desc' },
    });

    return { events };
  });

  app.post('/hazards/report', { preHandler: app.requireUser }, async (req: any, reply) => {
    const userId = req.user.sub as string;
    const body = ReportSchema.parse(req.body);

    // naive de-dup: same type within ~80m & last 30 minutes
    const windowMs = 30 * 60 * 1000;
    const since = new Date(Date.now() - windowMs);

    const approx = 0.0008; // ~80m

    let event = await prisma.hazardEvent.findFirst({
      where: {
        type: body.type as any,
        isActive: true,
        createdAt: { gte: since },
        lat: { gte: body.lat - approx, lte: body.lat + approx },
        lng: { gte: body.lng - approx, lte: body.lng + approx },
      },
    });

    const now = new Date();

    const ttlHoursByType: Record<string, number> = {
      mobileRadar: 3,
      police: 3,
      accident: 4,
      works: 12,
      danger: 12,
    };

    if (!event) {
      event = await prisma.hazardEvent.create({
        data: {
          id: nanoid(),
          type: body.type as any,
          lat: body.lat,
          lng: body.lng,
          countryCode: body.countryCode,
          title: body.title,
          isStatic: body.type === 'fixedRadar',
          source: 'community',
          expiresAt: body.type === 'fixedRadar' ? null : new Date(now.getTime() + (ttlHoursByType[body.type] ?? 6) * 3600_000),
          lastSeenAt: now,
        },
      });
    } else {
      // refresh TTL for dynamic events
      await prisma.hazardEvent.update({
        where: { id: event.id },
        data: {
          lastSeenAt: now,
          expiresAt: event.type === 'fixedRadar' ? null : new Date(now.getTime() + (ttlHoursByType[event.type] ?? 6) * 3600_000),
        },
      });
    }

    await prisma.hazardReport.create({
      data: { id: nanoid(), userId, eventId: event.id },
    });

    return reply.code(201).send({ event });
  });
};
