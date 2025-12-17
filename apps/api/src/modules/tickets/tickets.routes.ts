import type { FastifyPluginAsync } from 'fastify';
import { z } from 'zod';
import { nanoid } from 'nanoid';

import { prisma } from '../../db/prisma.js';

export const ticketsRoutes: FastifyPluginAsync = async (app) => {
  app.get('/tickets', { preHandler: app.requireUser }, async (req: any) => {
    const userId = req.userContext!.id;
    const tickets = await prisma.ticket.findMany({
      where: { userId },
      take: 50,
      orderBy: { updatedAt: 'desc' },
    });
    return { tickets };
  });

  app.post('/tickets', { preHandler: app.requireUser }, async (req: any, reply) => {
    const userId = req.userContext!.id;
    const body = z.object({ subject: z.string().min(3).max(120), text: z.string().min(1).max(4000) }).parse(req.body);

    const ticket = await prisma.ticket.create({
      data: { id: nanoid(), userId, subject: body.subject },
    });

    await prisma.ticketMessage.create({
      data: { id: nanoid(), ticketId: ticket.id, userId, author: 'user', text: body.text },
    });

    await app.audit({ actorId: userId, action: 'ticket.create', target: ticket.id });

    return reply.code(201).send({ ticket });
  });

  app.get('/tickets/:ticketId', { preHandler: app.requireUser }, async (req: any, reply) => {
    const userId = req.userContext!.id;
    const params = z.object({ ticketId: z.string().min(1) }).parse(req.params);

    const ticket = await prisma.ticket.findUnique({
      where: { id: params.ticketId },
      include: { messages: { orderBy: { createdAt: 'asc' } } },
    });

    if (!ticket || ticket.userId !== userId) return reply.code(404).send({ error: 'not_found' });
    return { ticket };
  });

  app.post('/tickets/:ticketId/message', { preHandler: app.requireUser }, async (req: any, reply) => {
    const userId = req.userContext!.id;
    const params = z.object({ ticketId: z.string().min(1) }).parse(req.params);
    const body = z.object({ text: z.string().min(1).max(4000) }).parse(req.body);

    const ticket = await prisma.ticket.findUnique({ where: { id: params.ticketId } });
    if (!ticket || ticket.userId !== userId) return reply.code(404).send({ error: 'not_found' });

    const msg = await prisma.ticketMessage.create({
      data: { id: nanoid(), ticketId: params.ticketId, userId, author: 'user', text: body.text },
    });

    await prisma.ticket.update({ where: { id: params.ticketId }, data: { status: 'open' } });
    await app.audit({ actorId: userId, action: 'ticket.message', target: params.ticketId });

    return reply.code(201).send({ message: msg });
  });
};
