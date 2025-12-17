import React, { useEffect, useState } from 'react';
import { AdminApiClient } from '../services/api';

export function DashboardPage() {
  const api = AdminApiClient.fromEnv();
  const [data, setData] = useState<{ users: number; openTickets: number; activeHazards: number } | null>(null);

  useEffect(() => {
    const run = async () => {
      try {
        setData(await api.adminStats());
      } catch {
        setData(null);
      }
    };
    // ignore: void promises
    run();
  }, []);

  return (
    <div className="p-6">
      <h1 className="text-2xl font-black mb-4">Dashboard</h1>
      {!data ? (
        <div className="text-white/60">A carregar...</div>
      ) : (
        <div className="grid grid-cols-1 md:grid-cols-3 gap-3">
          <div className="p-4 rounded-xl bg-white/5 border border-white/10">
            <div className="text-xs text-white/50">Users</div>
            <div className="text-2xl font-black">{data.users}</div>
          </div>
          <div className="p-4 rounded-xl bg-white/5 border border-white/10">
            <div className="text-xs text-white/50">Open tickets</div>
            <div className="text-2xl font-black">{data.openTickets}</div>
          </div>
          <div className="p-4 rounded-xl bg-white/5 border border-white/10">
            <div className="text-xs text-white/50">Active hazards</div>
            <div className="text-2xl font-black">{data.activeHazards}</div>
          </div>
        </div>
      )}
    </div>
  );
}
