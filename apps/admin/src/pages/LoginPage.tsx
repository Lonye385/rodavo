import React, { useState } from 'react';
import { LogIn } from 'lucide-react';

import { AdminApiClient, type ApiUser } from '../services/api';

export function LoginPage({ onLoggedIn }: { onLoggedIn: (u: ApiUser) => void }) {
  const api = AdminApiClient.fromEnv();
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [error, setError] = useState<string | null>(null);
  const [loading, setLoading] = useState(false);

  return (
    <div className="h-full flex items-center justify-center p-6">
      <form
        className="w-full max-w-sm bg-[#0a0a0a] border border-white/10 rounded-2xl p-6"
        onSubmit={async (e) => {
          e.preventDefault();
          setLoading(true);
          setError(null);
          try {
            const res = await api.login(email.trim(), password);
            // Basic check: only non-user roles should access admin
            if (res.user.role === 'user') {
              api.logout();
              setError('Sem permissões de admin.');
              return;
            }
            onLoggedIn(res.user);
          } catch {
            setError('Login inválido.');
          } finally {
            setLoading(false);
          }
        }}
      >
        <div className="text-xl font-black mb-1">Admin</div>
        <div className="text-xs text-white/50 mb-4">Acesso restrito</div>
        <label className="text-xs text-white/60">Email</label>
        <input value={email} onChange={(e) => setEmail(e.target.value)} className="w-full mt-1 mb-3 p-3 rounded bg-black/30 border border-white/10" />
        <label className="text-xs text-white/60">Password</label>
        <input type="password" value={password} onChange={(e) => setPassword(e.target.value)} className="w-full mt-1 mb-4 p-3 rounded bg-black/30 border border-white/10" />
        <button disabled={loading} className="w-full p-3 rounded bg-[#590df2] font-bold flex items-center justify-center gap-2">
          <LogIn size={16} /> {loading ? '...' : 'Entrar'}
        </button>
        {error && <div className="mt-3 text-xs text-red-300">{error}</div>}
      </form>
    </div>
  );
}
