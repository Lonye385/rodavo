import React, { useEffect, useState } from 'react';
import { AdminApiClient } from '../../services/api';

export function PromotionsPage() {
  const api = AdminApiClient.fromEnv();
  const [items, setItems] = useState<any[]>([]);
  const [form, setForm] = useState({ code: '', percentOff: '10' });

  const load = async () => {
    const res = await api.adminPromotions();
    setItems(res.items);
  };

  useEffect(() => {
    // ignore: void promises
    load();
  }, []);

  return (
    <div className="p-6">
      <h1 className="text-2xl font-black mb-4">Promotions</h1>

      <form
        className="p-4 rounded-xl bg-white/5 border border-white/10 mb-4 flex gap-2"
        onSubmit={async (e) => {
          e.preventDefault();
          await api.adminPromotionCreate({ code: form.code, percentOff: Number(form.percentOff) });
          setForm({ code: '', percentOff: '10' });
          await load();
        }}
      >
        <input value={form.code} onChange={(e) => setForm({ ...form, code: e.target.value })} placeholder="CODE" className="p-3 rounded bg-black/30 border border-white/10" />
        <input value={form.percentOff} onChange={(e) => setForm({ ...form, percentOff: e.target.value })} placeholder="%" className="p-3 rounded bg-black/30 border border-white/10 w-24" />
        <button className="px-4 rounded bg-[#590df2] font-bold">Create</button>
      </form>

      <div className="rounded-xl border border-white/10 overflow-hidden">
        <table className="w-full text-sm">
          <thead className="bg-white/5">
            <tr>
              <th className="text-left p-2">Code</th>
              <th className="text-left p-2">% off</th>
              <th className="text-left p-2">Active</th>
            </tr>
          </thead>
          <tbody>
            {items.map((i) => (
              <tr key={i.id} className="border-t border-white/5">
                <td className="p-2">{i.code}</td>
                <td className="p-2">{i.percentOff}</td>
                <td className="p-2">
                  <input
                    type="checkbox"
                    checked={i.active}
                    onChange={async (e) => {
                      await api.adminPromotionUpdate(i.id, { active: e.target.checked });
                      await load();
                    }}
                  />
                </td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>
    </div>
  );
}
