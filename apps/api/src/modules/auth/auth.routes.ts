import type { FastifyPluginAsync } from 'fastify';
import { z } from 'zod';
import argon2 from 'argon2';
import { nanoid } from 'nanoid';

import { prisma } from '../../db/prisma.js';

const RegisterSchema = z.object({
  email: z.string().email(),
  username: z.string().min(3).max(24),
  password: z.string().min(8).max(128),
});

const LoginSchema = z.object({
  email: z.string().email(),
  password: z.string().min(1),
});

const RefreshSchema = z.object({
  refreshToken: z.string().min(10),
});

export const authRoutes: FastifyPluginAsync = async (app) => {
  app.post('/auth/admin/accept-invite', async (req, reply) => {
    const body = z
      .object({
        token: z.string().min(10),
        email: z.string().email(),
        username: z.string().min(3).max(24),
        password: z.string().min(8).max(128),
      })
      .parse(req.body);

    const invite = await prisma.adminInvite.findUnique({ where: { token: body.token } });
    if (!invite) return reply.code(404).send({ error: 'invite_not_found' });
    if (invite.acceptedAt) return reply.code(409).send({ error: 'invite_used' });
    if (invite.email.toLowerCase() !== body.email.toLowerCase()) return reply.code(403).send({ error: 'invite_email_mismatch' });
    if (invite.expiresAt.getTime() < Date.now()) return reply.code(410).send({ error: 'invite_expired' });

    const exists = await prisma.user.findFirst({
      where: { OR: [{ email: body.email }, { username: body.username }] },
      select: { id: true },
    });
    if (exists) return reply.code(409).send({ error: 'user_exists' });

    const user = await prisma.user.create({
      data: {
        id: nanoid(),
        email: body.email,
        username: body.username,
        passwordHash: await argon2.hash(body.password),
        role: invite.role,
      },
      select: { id: true, email: true, username: true, role: true },
    });

    await prisma.adminInvite.update({ where: { token: body.token }, data: { acceptedAt: new Date() } });

    const refreshJti = nanoid();
    await prisma.session.create({ data: { id: nanoid(), userId: user.id, refreshJti } });

    const accessToken = await (reply as any).jwtSign({ sub: user.id });
    const refreshToken = await (reply as any).jwtSign({ sub: user.id, jti: refreshJti }, { namespace: 'refresh' });

    return { user, accessToken, refreshToken };
  });

  app.post('/auth/register', async (req, reply) => {
    const body = RegisterSchema.parse(req.body);

    const exists = await prisma.user.findFirst({
      where: { OR: [{ email: body.email }, { username: body.username }] },
      select: { id: true },
    });
    if (exists) return reply.code(409).send({ error: 'user_exists' });

    const user = await prisma.user.create({
      data: {
        id: nanoid(),
        email: body.email,
        username: body.username,
        passwordHash: await argon2.hash(body.password),
      },
      select: { id: true, email: true, username: true, role: true },
    });

    const refreshJti = nanoid();
    await prisma.session.create({ data: { id: nanoid(), userId: user.id, refreshJti } });

    const accessToken = await (reply as any).jwtSign({ sub: user.id });
    const refreshToken = await (reply as any).jwtSign({ sub: user.id, jti: refreshJti }, { namespace: 'refresh' });

    return { user, accessToken, refreshToken };
  });

  app.post('/auth/login', async (req, reply) => {
    const body = LoginSchema.parse(req.body);

    const user = await prisma.user.findUnique({ where: { email: body.email } });
    if (!user) return reply.code(401).send({ error: 'invalid_credentials' });

    const ok = await argon2.verify(user.passwordHash, body.password);
    if (!ok) return reply.code(401).send({ error: 'invalid_credentials' });

    const refreshJti = nanoid();
    await prisma.session.create({ data: { id: nanoid(), userId: user.id, refreshJti } });

    const accessToken = await (reply as any).jwtSign({ sub: user.id });
    const refreshToken = await (reply as any).jwtSign({ sub: user.id, jti: refreshJti }, { namespace: 'refresh' });

    return {
      user: { id: user.id, email: user.email, username: user.username, role: user.role },
      accessToken,
      refreshToken,
    };
  });

  app.post('/auth/refresh', async (req, reply) => {
    const body = RefreshSchema.parse(req.body);

    let payload: any;
    try {
      payload = (app as any).refresh.verify(body.refreshToken);
    } catch {
      return reply.code(401).send({ error: 'invalid_refresh' });
    }

    const session = await prisma.session.findUnique({ where: { refreshJti: payload.jti } });
    if (!session || session.revokedAt) return reply.code(401).send({ error: 'invalid_refresh' });

    const accessToken = await (reply as any).jwtSign({ sub: payload.sub });
    return { accessToken };
  });
};
