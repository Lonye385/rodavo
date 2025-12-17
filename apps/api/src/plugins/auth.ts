import fp from 'fastify-plugin';
import jwt from '@fastify/jwt';
import type { FastifyPluginAsync } from 'fastify';

import { env } from '../config/env.js';

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
  });
});

declare module 'fastify' {
  interface FastifyInstance {
    requireUser: (req: any, reply: any) => Promise<any>;
  }
}
