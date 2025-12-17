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
