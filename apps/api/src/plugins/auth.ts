import fp from 'fastify-plugin';
import jwt from '@fastify/jwt';
import type { FastifyPluginAsync } from 'fastify';

import { env } from '../config/env.js';
import { prisma } from '../db/prisma.js';

export const authPlugin: FastifyPluginAsync = fp(async (app) => {
  app.register(jwt, {
    secret: env.JWT_SECRET,
    namespace: 'access',
    sign: { expiresIn: '15m' },
  });

  app.register(jwt, {
    secret: env.JWT_REFRESH_SECRET,
    namespace: 'refresh',
    sign: { expiresIn: '30d' },
  });

  app.decorate('requireUser', async (req: any, reply: any) => {
    try {
      await req.jwtVerify();
    } catch {
      return reply.code(401).send({ error: 'unauthorized' });
    }

    const userId = req.user?.sub as string | undefined;
    if (!userId) return reply.code(401).send({ error: 'unauthorized' });

    const user = await prisma.user.findUnique({
      where: { id: userId },
      select: { id: true, role: true, isBanned: true, username: true, email: true },
    });
    if (!user) return reply.code(401).send({ error: 'unauthorized' });
    if (user.isBanned) return reply.code(403).send({ error: 'banned' });

    req.userContext = user;
  });

  app.decorate('requireRole', (roles: string[]) => {
    return async (req: any, reply: any) => {
      await app.requireUser(req, reply);
      const role = req.userContext?.role as string | undefined;
      if (!role || !roles.includes(role)) return reply.code(403).send({ error: 'forbidden' });
    };
  });
});

declare module 'fastify' {
  interface FastifyInstance {
    requireUser: (req: any, reply: any) => Promise<any>;
    requireRole: (roles: string[]) => (req: any, reply: any) => Promise<any>;
  }
}

declare module 'fastify' {
  interface FastifyRequest {
    userContext?: { id: string; role: string; isBanned: boolean; username: string; email: string };
  }
}
