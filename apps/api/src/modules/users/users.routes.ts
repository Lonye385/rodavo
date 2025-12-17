import type { FastifyPluginAsync } from 'fastify';

import { prisma } from '../../db/prisma.js';

export const usersRoutes: FastifyPluginAsync = async (app) => {
  app.get('/me', { preHandler: app.requireUser }, async (req: any) => {
    const user = req.userContext!;
    return { user: { id: user.id, email: user.email, username: user.username, role: user.role } };
  });
};
