import React, { useEffect, useState } from 'react';
import { AdminApiClient } from '../services/api';

export function TicketsPage() {
  const api = AdminApiClient.fromEnv();
  const [tickets, setTickets] = useState<any[]>([]);
  const [selected, setSelected] = useState<any | null>(null);
  const [reply, setReply] = useState('');

  const load = async () => {
    const res = await api.adminTickets();
    setTickets(res.tickets);
  };

  const loadTicket = async (id: string) => {
    const res = await api.adminTicket(id);
    setSelected(res.ticket);
  };

  useEffect(() => {
    // ignore: void promises
    load();
  }, []);

  return (
    <div className="p-6">
      <h1 className="text-2xl font-black mb-4">Tickets</h1>
      <div className="grid grid-cols-1 lg:grid-cols-2 gap-4">
        <div className="grid gap-2">
          {tickets.map((t) => (
            <button
              key={t.id}
              onClick={() => void loadTicket(t.id)}
              className="text-left p-4 rounded-xl bg-white/5 border border-white/10 hover:bg-white/7"
            >
              <div className="text-xs text-white/50">{t.status} • {new Date(t.updatedAt).toLocaleString()}</div>
              <div className="font-bold">{t.subject}</div>
              <div className="text-sm text-white/70">{t.user?.email}</div>
            </button>
          ))}
        </div>

        <div className="p-4 rounded-xl bg-white/5 border border-white/10">
          {!selected ? (
            <div className="text-white/60">Seleciona um ticket para responder.</div>
          ) : (
            <>
              <div className="text-xs text-white/50">{selected.status}</div>
              <div className="text-lg font-black mb-2">{selected.subject}</div>
              <div className="text-sm text-white/70 mb-4">{selected.user?.email}</div>

              <div className="space-y-2 max-h-[360px] overflow-auto pr-2">
                {(selected.messages ?? []).map((m: any) => (
                  <div key={m.id} className="p-3 rounded bg-black/30 border border-white/10">
                    <div className="text-[10px] text-white/50">{m.author} • {new Date(m.createdAt).toLocaleString()}</div>
                    <div className="text-sm">{m.text}</div>
                  </div>
                ))}
              </div>

              <form
                className="mt-4 flex gap-2"
                onSubmit={async (e) => {
                  e.preventDefault();
                  if (!reply.trim()) return;
                  await api.adminTicketReply(selected.id, reply.trim());
                  setReply('');
                  await loadTicket(selected.id);
                  await load();
                }}
              >
                <input
                  value={reply}
                  onChange={(e) => setReply(e.target.value)}
                  className="flex-1 p-3 rounded bg-black/30 border border-white/10"
                  placeholder="Resposta…"
                />
                <button className="px-4 rounded bg-[#590df2] font-bold">Enviar</button>
              </form>
            </>
          )}
        </div>
      </div>
    </div>
  );
}
