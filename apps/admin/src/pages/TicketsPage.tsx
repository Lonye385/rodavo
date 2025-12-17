import React, { useEffect, useState } from 'react';
import { AdminApiClient } from '../services/api';

export function TicketsPage() {
  const api = AdminApiClient.fromEnv();
  const [tickets, setTickets] = useState<any[]>([]);

  useEffect(() => {
    const run = async () => {
      const res = await api.adminTickets();
      setTickets(res.tickets);
    };
    // ignore: void promises
    run();
  }, []);

  return (
    <div className="p-6">
      <h1 className="text-2xl font-black mb-4">Tickets</h1>
      <div className="grid gap-2">
        {tickets.map((t) => (
          <div key={t.id} className="p-4 rounded-xl bg-white/5 border border-white/10">
            <div className="text-xs text-white/50">{t.status} • {new Date(t.updatedAt).toLocaleString()}</div>
            <div className="font-bold">{t.subject}</div>
            <div className="text-sm text-white/70">{t.user?.email}</div>
          </div>
        ))}
      </div>
    </div>
  );
}
