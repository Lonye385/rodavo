import React, { useEffect, useState } from 'react';
import { AdminApiClient } from '../../services/api';

export function TeamPage() {
  const api = AdminApiClient.fromEnv();
  const [invites, setInvites] = useState<any[]>([]);
  const [form, setForm] = useState({ email: '', role: 'support' });

  const load = async () => {
    const res = await api.adminInvites();
    setInvites(res.invites);
  };

  useEffect(() => {
    // ignore: void promises
    load();
  }, []);

  return (
    <div className="p-6">
      <h1 className="text-2xl font-black mb-4">Team</h1>

      <form
        className="p-4 rounded-xl bg-white/5 border border-white/10 mb-4 flex gap-2"
        onSubmit={async (e) => {
          e.preventDefault();
          const res = await api.adminInviteCreate({ email: form.email, role: form.role, ttlDays: 7 });
          await load();
          alert(`Invite token (send privately): ${res.invite.token}`);
          setForm({ email: '', role: 'support' });
        }}
      >
        <input value={form.email} onChange={(e) => setForm({ ...form, email: e.target.value })} placeholder="Email" className="p-3 rounded bg-black/30 border border-white/10 flex-1" />
        <select value={form.role} onChange={(e) => setForm({ ...form, role: e.target.value })} className="p-3 rounded bg-black/30 border border-white/10">
          {['support','moderator','finance','admin'].map((r) => <option key={r} value={r}>{r}</option>)}
        </select>
        <button className="px-4 rounded bg-[#590df2] font-bold">Invite</button>
      </form>

      <div className="rounded-xl border border-white/10 overflow-hidden">
        <table className="w-full text-sm">
          <thead className="bg-white/5">
            <tr>
              <th className="text-left p-2">Email</th>
              <th className="text-left p-2">Role</th>
              <th className="text-left p-2">Expires</th>
              <th className="text-left p-2">Accepted</th>
            </tr>
          </thead>
          <tbody>
            {invites.map((i) => (
              <tr key={i.id} className="border-t border-white/5">
                <td className="p-2">{i.email}</td>
                <td className="p-2">{i.role}</td>
                <td className="p-2">{new Date(i.expiresAt).toLocaleString()}</td>
                <td className="p-2">{i.acceptedAt ? 'yes' : 'no'}</td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>

      <div className="mt-4 text-xs text-white/60">
        Para aceitar convite: chama <code className="bg-black/30 px-1 rounded">POST /auth/admin/accept-invite</code> (podes fazer com curl/Postman) e cria conta.
      </div>
    </div>
  );
}
