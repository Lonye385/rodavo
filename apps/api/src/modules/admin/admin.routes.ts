import type { FastifyPluginAsync } from 'fastify';
import { z } from 'zod';
import { nanoid } from 'nanoid';

import { prisma } from '../../db/prisma.js';

export const adminRoutes: FastifyPluginAsync = async (app) => {
  const requireAdmin = app.requireRole(['owner', 'admin', 'support', 'moderator', 'finance']);
  const requireOwnerAdmin = app.requireRole(['owner', 'admin']);
  const requireSupport = app.requireRole(['owner', 'admin', 'support']);
  const requireModerator = app.requireRole(['owner', 'admin', 'moderator']);
  const requireFinance = app.requireRole(['owner', 'admin', 'finance']);

  app.get('/admin/stats', { preHandler: requireAdmin }, async () => {
    const [users, openTickets, hazards] = await Promise.all([
      prisma.user.count(),
      prisma.ticket.count({ where: { status: { in: ['open', 'pending'] } } }),
      prisma.hazardEvent.count({ where: { isActive: true } }),
    ]);

    return { users, openTickets, activeHazards: hazards };
  });

  app.get('/admin/users', { preHandler: requireAdmin }, async (req) => {
    const q = z
      .object({
        q: z.string().optional(),
        take: z.coerce.number().default(50),
      })
      .parse(req.query);

    const where = q.q
      ? {
          OR: [
            { email: { contains: q.q } },
            { username: { contains: q.q } },
            { id: { contains: q.q } },
          ],
        }
      : {};

    const users = await prisma.user.findMany({
      where,
      take: Math.min(200, q.take),
      orderBy: { createdAt: 'desc' },
      select: { id: true, email: true, username: true, role: true, isBanned: true, createdAt: true },
    });
    return { users };
  });

  app.patch('/admin/users/:userId', { preHandler: app.requireRole(['owner', 'admin']) }, async (req: any) => {
    const params = z.object({ userId: z.string().min(1) }).parse(req.params);
    const body = z
      .object({
        role: z.enum(['user', 'support', 'moderator', 'finance', 'admin', 'owner']).optional(),
        isBanned: z.boolean().optional(),
      })
      .parse(req.body);

    const updated = await prisma.user.update({
      where: { id: params.userId },
      data: { role: body.role as any, isBanned: body.isBanned },
      select: { id: true, email: true, username: true, role: true, isBanned: true },
    });

    await app.audit({
      actorId: req.userContext?.id,
      action: 'admin.user.update',
      target: updated.id,
      meta: body,
    });

    return { user: updated };
  });

  app.post('/admin/invites', { preHandler: app.requireRole(['owner', 'admin']) }, async (req: any, reply) => {
    const body = z
      .object({
        email: z.string().email(),
        role: z.enum(['support', 'moderator', 'finance', 'admin']),
        ttlDays: z.number().min(1).max(30).default(7),
      })
      .parse(req.body);

    const token = nanoid(32);
    const invite = await prisma.adminInvite.create({
      data: {
        id: nanoid(),
        email: body.email,
        role: body.role as any,
        token,
        invitedBy: req.userContext?.id,
        expiresAt: new Date(Date.now() + body.ttlDays * 86400000),
      },
    });

    await app.audit({ actorId: req.userContext?.id, action: 'admin.invite.create', target: invite.email, meta: { role: invite.role } });

    return reply.code(201).send({ invite: { ...invite, token } });
  });

  app.get('/admin/invites', { preHandler: app.requireRole(['owner', 'admin']) }, async () => {
    const invites = await prisma.adminInvite.findMany({ orderBy: { createdAt: 'desc' }, take: 100 });
    return { invites };
  });

  // Tickets (support)
  app.get('/admin/tickets', { preHandler: requireSupport }, async () => {
    const tickets = await prisma.ticket.findMany({
      take: 100,
      orderBy: { updatedAt: 'desc' },
      include: { user: { select: { id: true, username: true, email: true } } },
    });
    return { tickets };
  });

  app.get('/admin/tickets/:ticketId', { preHandler: requireSupport }, async (req) => {
    const params = z.object({ ticketId: z.string().min(1) }).parse(req.params);
    const ticket = await prisma.ticket.findUnique({
      where: { id: params.ticketId },
      include: { user: { select: { id: true, username: true, email: true } }, messages: { orderBy: { createdAt: 'asc' } } },
    });
    return { ticket };
  });

  app.post('/admin/tickets/:ticketId/reply', { preHandler: requireSupport }, async (req: any, reply) => {
    const params = z.object({ ticketId: z.string().min(1) }).parse(req.params);
    const body = z.object({ text: z.string().min(1).max(4000) }).parse(req.body);

    const msg = await prisma.ticketMessage.create({
      data: {
        id: nanoid(),
        ticketId: params.ticketId,
        userId: req.userContext?.id,
        author: 'support',
        text: body.text,
      },
    });

    await prisma.ticket.update({ where: { id: params.ticketId }, data: { status: 'pending' } });

    await app.audit({ actorId: req.userContext?.id, action: 'admin.ticket.reply', target: params.ticketId });

    return reply.code(201).send({ message: msg });
  });

  // Catalog
  app.get('/admin/vehicles', { preHandler: requireOwnerAdmin }, async () => {
    const items = await prisma.vehicleCatalogItem.findMany({ orderBy: { updatedAt: 'desc' }, take: 200 });
    return { items };
  });

  app.post('/admin/vehicles', { preHandler: requireOwnerAdmin }, async (req: any, reply) => {
    const body = z
      .object({
        category: z.enum(['car', 'moto', 'bicycle', 'truck', 'bus', 'rv', 'tvde']),
        make: z.string().min(1).max(40),
        model: z.string().min(1).max(60),
        year: z.number().int().min(1950).max(2100).optional(),
        heightM: z.number().optional(),
        widthM: z.number().optional(),
        lengthM: z.number().optional(),
        weightT: z.number().optional(),
      })
      .parse(req.body);

    const item = await prisma.vehicleCatalogItem.create({ data: { id: nanoid(), ...body } as any });
    await app.audit({ actorId: req.userContext?.id, action: 'admin.vehicle.create', target: item.id, meta: body });
    return reply.code(201).send({ item });
  });

  app.patch('/admin/vehicles/:id', { preHandler: requireOwnerAdmin }, async (req: any) => {
    const params = z.object({ id: z.string().min(1) }).parse(req.params);
    const body = z
      .object({
        make: z.string().min(1).max(40).optional(),
        model: z.string().min(1).max(60).optional(),
        year: z.number().int().min(1950).max(2100).optional(),
        heightM: z.number().optional(),
        widthM: z.number().optional(),
        lengthM: z.number().optional(),
        weightT: z.number().optional(),
        isActive: z.boolean().optional(),
      })
      .parse(req.body);

    const item = await prisma.vehicleCatalogItem.update({ where: { id: params.id }, data: body as any });
    await app.audit({ actorId: req.userContext?.id, action: 'admin.vehicle.update', target: item.id, meta: body });
    return { item };
  });

  // Shop packages
  app.get('/admin/shop/packages', { preHandler: requireOwnerAdmin }, async () => {
    const items = await prisma.shopPackage.findMany({ orderBy: { updatedAt: 'desc' }, take: 200 });
    return { items };
  });

  app.post('/admin/shop/packages', { preHandler: requireOwnerAdmin }, async (req: any, reply) => {
    const body = z
      .object({
        sku: z.string().min(3).max(64),
        title: z.string().min(1).max(80),
        description: z.string().max(300).optional(),
        priceEur: z.number().min(0),
        isActive: z.boolean().optional(),
      })
      .parse(req.body);
    const item = await prisma.shopPackage.create({ data: { id: nanoid(), ...body } as any });
    await app.audit({ actorId: req.userContext?.id, action: 'admin.shopPackage.create', target: item.id, meta: body });
    return reply.code(201).send({ item });
  });

  app.patch('/admin/shop/packages/:id', { preHandler: requireOwnerAdmin }, async (req: any) => {
    const params = z.object({ id: z.string().min(1) }).parse(req.params);
    const body = z
      .object({
        title: z.string().min(1).max(80).optional(),
        description: z.string().max(300).optional().nullable(),
        priceEur: z.number().min(0).optional(),
        isActive: z.boolean().optional(),
      })
      .parse(req.body);
    const item = await prisma.shopPackage.update({ where: { id: params.id }, data: body as any });
    await app.audit({ actorId: req.userContext?.id, action: 'admin.shopPackage.update', target: item.id, meta: body });
    return { item };
  });

  // Promotions
  app.get('/admin/promotions', { preHandler: requireOwnerAdmin }, async () => {
    const items = await prisma.promotion.findMany({ orderBy: { createdAt: 'desc' }, take: 200 });
    return { items };
  });

  app.post('/admin/promotions', { preHandler: requireOwnerAdmin }, async (req: any, reply) => {
    const body = z
      .object({
        code: z.string().min(3).max(32),
        percentOff: z.number().int().min(0).max(90),
        active: z.boolean().optional(),
        startsAt: z.string().datetime().optional(),
        endsAt: z.string().datetime().optional(),
      })
      .parse(req.body);
    const item = await prisma.promotion.create({
      data: {
        id: nanoid(),
        code: body.code,
        percentOff: body.percentOff,
        active: body.active ?? true,
        startsAt: body.startsAt ? new Date(body.startsAt) : null,
        endsAt: body.endsAt ? new Date(body.endsAt) : null,
      } as any,
    });
    await app.audit({ actorId: req.userContext?.id, action: 'admin.promotion.create', target: item.id, meta: body });
    return reply.code(201).send({ item });
  });

  app.patch('/admin/promotions/:id', { preHandler: requireOwnerAdmin }, async (req: any) => {
    const params = z.object({ id: z.string().min(1) }).parse(req.params);
    const body = z
      .object({
        percentOff: z.number().int().min(0).max(90).optional(),
        active: z.boolean().optional(),
        startsAt: z.string().datetime().optional().nullable(),
        endsAt: z.string().datetime().optional().nullable(),
      })
      .parse(req.body);
    const item = await prisma.promotion.update({
      where: { id: params.id },
      data: {
        percentOff: body.percentOff,
        active: body.active,
        startsAt: body.startsAt ? new Date(body.startsAt) : body.startsAt === null ? null : undefined,
        endsAt: body.endsAt ? new Date(body.endsAt) : body.endsAt === null ? null : undefined,
      } as any,
    });
    await app.audit({ actorId: req.userContext?.id, action: 'admin.promotion.update', target: item.id, meta: body });
    return { item };
  });

  // Hazards moderation
  app.get('/admin/hazards', { preHandler: requireModerator }, async (req) => {
    const q = z
      .object({
        active: z.enum(['true', 'false']).optional(),
        take: z.coerce.number().default(200),
      })
      .parse(req.query);
    const where = q.active ? { isActive: q.active === 'true' } : {};
    const events = await prisma.hazardEvent.findMany({
      where,
      take: Math.min(500, q.take),
      orderBy: { updatedAt: 'desc' },
      include: { _count: { select: { reports: true } } },
    });
    return { events };
  });

  app.patch('/admin/hazards/:id', { preHandler: requireModerator }, async (req: any) => {
    const params = z.object({ id: z.string().min(1) }).parse(req.params);
    const body = z
      .object({
        isActive: z.boolean().optional(),
        title: z.string().max(120).optional().nullable(),
        type: z.enum(['fixedRadar', 'mobileRadar', 'police', 'accident', 'works', 'danger']).optional(),
      })
      .parse(req.body);

    const event = await prisma.hazardEvent.update({ where: { id: params.id }, data: body as any });
    await app.audit({ actorId: req.userContext?.id, action: 'admin.hazard.update', target: event.id, meta: body });
    return { event };
  });

  // Finance (ledger)
  app.get('/admin/ledger', { preHandler: requireFinance }, async (req) => {
    const q = z
      .object({
        userId: z.string().optional(),
        take: z.coerce.number().default(100),
      })
      .parse(req.query);
    const entries = await prisma.ledgerEntry.findMany({
      where: q.userId ? { userId: q.userId } : {},
      take: Math.min(500, q.take),
      orderBy: { createdAt: 'desc' },
      include: { user: { select: { id: true, email: true, username: true } } },
    });
    return { entries };
  });

  // Audit log
  app.get('/admin/audit', { preHandler: requireOwnerAdmin }, async (req) => {
    const q = z
      .object({
        action: z.string().optional(),
        actorId: z.string().optional(),
        take: z.coerce.number().default(200),
      })
      .parse(req.query);
    const logs = await prisma.auditLog.findMany({
      where: {
        action: q.action ? { contains: q.action } : undefined,
        actorId: q.actorId,
      },
      take: Math.min(500, q.take),
      orderBy: { createdAt: 'desc' },
    });
    return { logs };
  });

  // Economy: manual adjustments (owner/admin only)
  app.post('/admin/wallet/:userId/adjust', { preHandler: requireOwnerAdmin }, async (req: any, reply) => {
    const params = z.object({ userId: z.string().min(1) }).parse(req.params);
    const body = z
      .object({
        currency: z.enum(['cash', 'rCoins']),
        delta: z.number().int().min(-1000000).max(1000000),
        reason: z.string().min(3).max(200),
      })
      .parse(req.body);

    await prisma.wallet.upsert({
      where: { userId: params.userId },
      create: { userId: params.userId, cash: 0, rCoins: 0 },
      update: {},
    });

    const updated = await prisma.wallet.update({
      where: { userId: params.userId },
      data: body.currency === 'cash' ? { cash: { increment: body.delta } } : { rCoins: { increment: body.delta } },
    });

    await prisma.ledgerEntry.create({
      data: {
        id: nanoid(),
        userId: params.userId,
        currency: body.currency as any,
        delta: body.delta,
        reason: body.reason,
        metaJson: JSON.stringify({ actor: req.userContext?.id }),
      },
    });

    await app.audit({ actorId: req.userContext?.id, action: 'admin.wallet.adjust', target: params.userId, meta: body });

    return reply.code(201).send({ wallet: updated });
  });
};
