import React, { useEffect, useState } from 'react';
import { AdminApiClient } from '../../services/api';

export function AuditPage() {
  const api = AdminApiClient.fromEnv();
  const [q, setQ] = useState('');
  const [logs, setLogs] = useState<any[]>([]);

  const load = async () => {
    const res = await api.adminAudit(q.trim() || undefined);
    setLogs(res.logs);
  };

  useEffect(() => {
    // ignore: void promises
    load();
  }, []);

  return (
    <div className="p-6">
      <div className="flex items-center gap-2 mb-4">
        <h1 className="text-2xl font-black flex-1">Audit</h1>
        <input value={q} onChange={(e) => setQ(e.target.value)} placeholder="action contains…" className="p-2 rounded bg-black/30 border border-white/10" />
        <button onClick={() => void load()} className="p-2 rounded bg-white/10 border border-white/10">Go</button>
      </div>
      <div className="grid gap-2">
        {logs.map((l) => (
          <div key={l.id} className="p-3 rounded bg-white/5 border border-white/10">
            <div className="text-xs text-white/50">{new Date(l.createdAt).toLocaleString()} • actor={l.actorId ?? '-'} • target={l.target ?? '-'}</div>
            <div className="font-mono text-xs">{l.action}</div>
          </div>
        ))}
      </div>
    </div>
  );
}
