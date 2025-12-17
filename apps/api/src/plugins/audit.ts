import fp from 'fastify-plugin';
import type { FastifyPluginAsync } from 'fastify';
import { nanoid } from 'nanoid';

import { prisma } from '../db/prisma.js';

export const auditPlugin: FastifyPluginAsync = fp(async (app) => {
  app.decorate('audit', async (params: { actorId?: string; action: string; target?: string; meta?: unknown }) => {
    await prisma.auditLog.create({
      data: {
        id: nanoid(),
        actorId: params.actorId,
        action: params.action,
        target: params.target,
        metaJson: params.meta == null ? null : JSON.stringify(params.meta),
      },
    });
  });
});

declare module 'fastify' {
  interface FastifyInstance {
    audit: (params: { actorId?: string; action: string; target?: string; meta?: unknown }) => Promise<void>;
  }
}
