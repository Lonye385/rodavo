import type { FastifyPluginAsync } from 'fastify';
import { z } from 'zod';
import { nanoid } from 'nanoid';

import { prisma } from '../../db/prisma.js';

export const postsRoutes: FastifyPluginAsync = async (app) => {
  app.get('/feed', { preHandler: app.requireUser }, async () => {
    const posts = await prisma.post.findMany({
      take: 50,
      orderBy: { createdAt: 'desc' },
      include: { user: { select: { id: true, username: true } } },
    });
    return { posts };
  });

  app.post('/posts', { preHandler: app.requireUser }, async (req: any, reply) => {
    const body = z.object({ text: z.string().min(1).max(2000) }).parse(req.body);
    const userId = req.user.sub as string;

    const post = await prisma.post.create({
      data: { id: nanoid(), userId, text: body.text },
      include: { user: { select: { id: true, username: true } } },
    });

    return reply.code(201).send({ post });
  });
};
