import type { FastifyPluginAsync } from 'fastify';
import { z } from 'zod';
import { nanoid } from 'nanoid';

import { prisma } from '../../db/prisma.js';

export const guildsRoutes: FastifyPluginAsync = async (app) => {
  app.get('/guilds', { preHandler: app.requireUser }, async () => {
    const guilds = await prisma.guild.findMany({ take: 50, orderBy: { createdAt: 'desc' } });
    return { guilds };
  });

  app.post('/guilds', { preHandler: app.requireUser }, async (req: any, reply) => {
    const body = z.object({ name: z.string().min(3).max(40) }).parse(req.body);
    const userId = req.user.sub as string;

    const guild = await prisma.guild.create({ data: { id: nanoid(), name: body.name } });
    await prisma.guildMember.create({ data: { id: nanoid(), guildId: guild.id, userId, role: 'owner' } });

    return reply.code(201).send({ guild });
  });

  app.get('/guilds/:guildId/messages', { preHandler: app.requireUser }, async (req: any) => {
    const params = z.object({ guildId: z.string().min(1) }).parse(req.params);
    const messages = await prisma.guildMessage.findMany({
      where: { guildId: params.guildId },
      take: 100,
      orderBy: { createdAt: 'desc' },
      include: { user: { select: { id: true, username: true } } },
    });
    return { messages };
  });

  app.post('/guilds/:guildId/messages', { preHandler: app.requireUser }, async (req: any, reply) => {
    const params = z.object({ guildId: z.string().min(1) }).parse(req.params);
    const body = z.object({ text: z.string().min(1).max(2000) }).parse(req.body);
    const userId = req.user.sub as string;

    const msg = await prisma.guildMessage.create({
      data: { id: nanoid(), guildId: params.guildId, userId, text: body.text },
      include: { user: { select: { id: true, username: true } } },
    });

    return reply.code(201).send({ message: msg });
  });
};
