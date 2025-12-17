import React, { useEffect, useState } from 'react';
import { AdminApiClient } from '../../services/api';

export function HazardsPage() {
  const api = AdminApiClient.fromEnv();
  const [events, setEvents] = useState<any[]>([]);

  const load = async () => {
    const res = await api.adminHazards(true);
    setEvents(res.events);
  };

  useEffect(() => {
    // ignore: void promises
    load();
  }, []);

  return (
    <div className="p-6">
      <div className="flex items-center mb-4">
        <h1 className="text-2xl font-black flex-1">Hazards</h1>
        <button onClick={() => void load()} className="px-3 py-2 rounded bg-white/10 border border-white/10">Refresh</button>
      </div>
      <div className="grid gap-2">
        {events.map((e) => (
          <div key={e.id} className="p-4 rounded-xl bg-white/5 border border-white/10 flex items-center gap-3">
            <div className="text-sm font-bold w-40">{e.type}</div>
            <div className="text-xs text-white/60 flex-1">
              {e.title ?? '-'} • reports: {e._count?.reports ?? 0}
              <div className="text-[10px]">{e.lat.toFixed(5)}, {e.lng.toFixed(5)} • {new Date(e.updatedAt).toLocaleString()}</div>
            </div>
            <button
              onClick={async () => {
                await api.adminHazardUpdate(e.id, { isActive: false });
                await load();
              }}
              className="px-3 py-2 rounded bg-red-500/10 border border-red-500/20"
            >
              Desativar
            </button>
          </div>
        ))}
      </div>
    </div>
  );
}
