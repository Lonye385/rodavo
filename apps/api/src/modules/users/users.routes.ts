import type { FastifyPluginAsync } from 'fastify';

import { prisma } from '../../db/prisma.js';

export const usersRoutes: FastifyPluginAsync = async (app) => {
  app.get('/me', { preHandler: app.requireUser }, async (req: any) => {
    const userId = req.user.sub as string;
    const user = await prisma.user.findUnique({
      where: { id: userId },
      select: { id: true, email: true, username: true, createdAt: true },
    });
    return { user };
  });
};
