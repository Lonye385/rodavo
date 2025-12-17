import 'dotenv/config';
import argon2 from 'argon2';
import { nanoid } from 'nanoid';

import { prisma } from '../db/prisma.js';

async function main() {
  const email = process.env.OWNER_EMAIL ?? '';
  const username = process.env.OWNER_USERNAME ?? '';
  const password = process.env.OWNER_PASSWORD ?? '';

  if (!email || !username || !password) {
    throw new Error('Missing OWNER_EMAIL/OWNER_USERNAME/OWNER_PASSWORD in .env');
  }

  const existing = await prisma.user.findFirst({
    where: { OR: [{ email }, { username }] },
    select: { id: true, email: true, username: true, role: true },
  });

  if (existing) {
    console.log('Owner already exists:', existing);
    return;
  }

  const user = await prisma.user.create({
    data: {
      id: nanoid(),
      email,
      username,
      passwordHash: await argon2.hash(password),
      role: 'owner',
      isBanned: false,
    } as any,
    select: { id: true, email: true, username: true, role: true },
  });

  console.log('Created owner:', user);
}

main()
  .catch((e) => {
    console.error(e);
    process.exitCode = 1;
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
