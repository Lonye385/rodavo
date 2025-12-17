import Fastify from 'fastify';

import { env } from './config/env.js';
import { corePlugin } from './plugins/core.js';
import { authPlugin } from './plugins/auth.js';
import { auditPlugin } from './plugins/audit.js';
import { healthRoutes } from './routes/health.js';
import { authRoutes } from './modules/auth/auth.routes.js';
import { usersRoutes } from './modules/users/users.routes.js';
import { hazardsRoutes } from './modules/hazards/hazards.routes.js';
import { postsRoutes } from './modules/posts/posts.routes.js';
import { guildsRoutes } from './modules/guilds/guilds.routes.js';
import { ticketsRoutes } from './modules/tickets/tickets.routes.js';
import { adminRoutes } from './modules/admin/admin.routes.js';

const app = Fastify({ logger: true });

await app.register(corePlugin);
await app.register(authPlugin);
await app.register(auditPlugin);

await app.register(healthRoutes);
await app.register(authRoutes);
await app.register(usersRoutes);
await app.register(hazardsRoutes);
await app.register(postsRoutes);
await app.register(guildsRoutes);
await app.register(ticketsRoutes);
await app.register(adminRoutes);

await app.listen({ port: env.PORT, host: '0.0.0.0' });
