import React, { useEffect, useState } from 'react';
import { AdminApiClient, type ApiUser } from '../services/api';

export function UsersPage() {
  const api = AdminApiClient.fromEnv();
  const [q, setQ] = useState('');
  const [users, setUsers] = useState<ApiUser[]>([]);

  const load = async () => {
    const res = await api.adminUsers(q.trim() || undefined);
    setUsers(res.users);
  };

  useEffect(() => {
    // ignore: void promises
    load();
  }, []);

  return (
    <div className="p-6">
      <div className="flex items-center gap-2 mb-4">
        <h1 className="text-2xl font-black flex-1">Users</h1>
        <input value={q} onChange={(e) => setQ(e.target.value)} placeholder="Search" className="p-2 rounded bg-black/30 border border-white/10" />
        <button onClick={() => void load()} className="p-2 rounded bg-white/10 border border-white/10">Go</button>
      </div>
      <div className="rounded-xl border border-white/10 overflow-hidden">
        <table className="w-full text-sm">
          <thead className="bg-white/5">
            <tr>
              <th className="text-left p-2">Username</th>
              <th className="text-left p-2">Email</th>
              <th className="text-left p-2">Role</th>
            </tr>
          </thead>
          <tbody>
            {users.map((u) => (
              <tr key={u.id} className="border-t border-white/5">
                <td className="p-2">{u.username}</td>
                <td className="p-2 text-white/70">{u.email}</td>
                <td className="p-2">{u.role}</td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>
    </div>
  );
}
