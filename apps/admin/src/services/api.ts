type Tokens = { accessToken: string; refreshToken: string };

const storageKey = 'rodavo_admin_tokens_v1';

export type ApiUser = { id: string; email: string; username: string; role: string };

function readTokens(): Tokens | null {
  try {
    const raw = localStorage.getItem(storageKey);
    if (!raw) return null;
    const parsed = JSON.parse(raw) as Tokens;
    if (!parsed?.accessToken || !parsed?.refreshToken) return null;
    return parsed;
  } catch {
    return null;
  }
}

function writeTokens(tokens: Tokens | null) {
  if (!tokens) {
    localStorage.removeItem(storageKey);
    return;
  }
  localStorage.setItem(storageKey, JSON.stringify(tokens));
}

export class AdminApiClient {
  constructor(private baseUrl: string) {}

  static fromEnv() {
    const baseUrl = import.meta.env.VITE_API_BASE_URL ?? 'http://localhost:8080';
    return new AdminApiClient(baseUrl);
  }

  getTokens() {
    return readTokens();
  }

  logout() {
    writeTokens(null);
  }

  async login(email: string, password: string): Promise<{ user: ApiUser }> {
    const res = await fetch(`${this.baseUrl}/auth/login`, {
      method: 'POST',
      headers: { 'content-type': 'application/json' },
      body: JSON.stringify({ email, password }),
    });
    if (!res.ok) throw new Error('login_failed');
    const json = (await res.json()) as { user: ApiUser; accessToken: string; refreshToken: string };
    writeTokens({ accessToken: json.accessToken, refreshToken: json.refreshToken });
    return { user: json.user };
  }

  async me(): Promise<ApiUser> {
    return await this.authed<ApiUser>('/me');
  }

  async adminStats() {
    return await this.authed<{ users: number; openTickets: number; activeHazards: number }>('/admin/stats');
  }

  async adminUsers(q?: string) {
    const url = q ? `/admin/users?q=${encodeURIComponent(q)}` : '/admin/users';
    return await this.authed<{ users: ApiUser[] }>(url);
  }

  async adminTickets() {
    return await this.authed<{ tickets: any[] }>('/admin/tickets');
  }

  async adminTicket(ticketId: string) {
    return await this.authed<{ ticket: any }>(`/admin/tickets/${ticketId}`);
  }

  async adminTicketReply(ticketId: string, text: string) {
    return await this.authed<{ message: any }>(`/admin/tickets/${ticketId}/reply`, {
      method: 'POST',
      headers: { 'content-type': 'application/json' },
      body: JSON.stringify({ text }),
    });
  }

  async adminHazards(active?: boolean) {
    const url = active === undefined ? '/admin/hazards' : `/admin/hazards?active=${active ? 'true' : 'false'}`;
    return await this.authed<{ events: any[] }>(url);
  }

  async adminHazardUpdate(id: string, patch: { isActive?: boolean; title?: string | null; type?: string }) {
    return await this.authed<{ event: any }>(`/admin/hazards/${id}`, {
      method: 'PATCH',
      headers: { 'content-type': 'application/json' },
      body: JSON.stringify(patch),
    });
  }

  async adminVehicles() {
    return await this.authed<{ items: any[] }>('/admin/vehicles');
  }

  async adminVehicleCreate(body: any) {
    return await this.authed<{ item: any }>('/admin/vehicles', {
      method: 'POST',
      headers: { 'content-type': 'application/json' },
      body: JSON.stringify(body),
    });
  }

  async adminVehicleUpdate(id: string, patch: any) {
    return await this.authed<{ item: any }>(`/admin/vehicles/${id}`, {
      method: 'PATCH',
      headers: { 'content-type': 'application/json' },
      body: JSON.stringify(patch),
    });
  }

  async adminShopPackages() {
    return await this.authed<{ items: any[] }>('/admin/shop/packages');
  }

  async adminShopPackageCreate(body: any) {
    return await this.authed<{ item: any }>('/admin/shop/packages', {
      method: 'POST',
      headers: { 'content-type': 'application/json' },
      body: JSON.stringify(body),
    });
  }

  async adminShopPackageUpdate(id: string, patch: any) {
    return await this.authed<{ item: any }>(`/admin/shop/packages/${id}`, {
      method: 'PATCH',
      headers: { 'content-type': 'application/json' },
      body: JSON.stringify(patch),
    });
  }

  async adminPromotions() {
    return await this.authed<{ items: any[] }>('/admin/promotions');
  }

  async adminPromotionCreate(body: any) {
    return await this.authed<{ item: any }>('/admin/promotions', {
      method: 'POST',
      headers: { 'content-type': 'application/json' },
      body: JSON.stringify(body),
    });
  }

  async adminPromotionUpdate(id: string, patch: any) {
    return await this.authed<{ item: any }>(`/admin/promotions/${id}`, {
      method: 'PATCH',
      headers: { 'content-type': 'application/json' },
      body: JSON.stringify(patch),
    });
  }

  async adminInvites() {
    return await this.authed<{ invites: any[] }>('/admin/invites');
  }

  async adminInviteCreate(body: any) {
    return await this.authed<{ invite: any }>('/admin/invites', {
      method: 'POST',
      headers: { 'content-type': 'application/json' },
      body: JSON.stringify(body),
    });
  }

  async adminAudit(action?: string) {
    const url = action ? `/admin/audit?action=${encodeURIComponent(action)}` : '/admin/audit';
    return await this.authed<{ logs: any[] }>(url);
  }

  private async authed<T>(path: string, init?: RequestInit): Promise<T> {
    const tokens = readTokens();
    if (!tokens) throw new Error('no_tokens');

    const doReq = async (accessToken: string) =>
      fetch(`${this.baseUrl}${path}`, {
        ...init,
        headers: { ...(init?.headers ?? {}), authorization: `Bearer ${accessToken}` },
      });

    let res = await doReq(tokens.accessToken);
    if (res.status === 401) {
      const refreshed = await this.refresh(tokens.refreshToken);
      res = await doReq(refreshed.accessToken);
    }

    if (!res.ok) throw new Error(`api_${res.status}`);
    return (await res.json()) as T;
  }

  private async refresh(refreshToken: string): Promise<{ accessToken: string }> {
    const res = await fetch(`${this.baseUrl}/auth/refresh`, {
      method: 'POST',
      headers: { 'content-type': 'application/json' },
      body: JSON.stringify({ refreshToken }),
    });
    if (!res.ok) {
      writeTokens(null);
      throw new Error('refresh_failed');
    }
    const json = (await res.json()) as { accessToken: string };
    const existing = readTokens();
    if (!existing) throw new Error('no_tokens');
    writeTokens({ accessToken: json.accessToken, refreshToken: existing.refreshToken });
    return json;
  }
}
