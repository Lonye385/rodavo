import React, { useEffect, useState } from 'react';
import { AdminApiClient } from '../../services/api';

export function VehiclesPage() {
  const api = AdminApiClient.fromEnv();
  const [items, setItems] = useState<any[]>([]);
  const [form, setForm] = useState({ category: 'car', make: '', model: '', year: '' });

  const load = async () => {
    const res = await api.adminVehicles();
    setItems(res.items);
  };

  useEffect(() => {
    // ignore: void promises
    load();
  }, []);

  return (
    <div className="p-6">
      <h1 className="text-2xl font-black mb-4">Vehicles</h1>

      <form
        className="p-4 rounded-xl bg-white/5 border border-white/10 mb-4 grid grid-cols-1 md:grid-cols-4 gap-2"
        onSubmit={async (e) => {
          e.preventDefault();
          await api.adminVehicleCreate({
            category: form.category,
            make: form.make,
            model: form.model,
            year: form.year ? Number(form.year) : undefined,
          });
          setForm({ category: 'car', make: '', model: '', year: '' });
          await load();
        }}
      >
        <select value={form.category} onChange={(e) => setForm({ ...form, category: e.target.value })} className="p-3 rounded bg-black/30 border border-white/10">
          {['car','moto','bicycle','truck','bus','rv','tvde'].map((c) => <option key={c} value={c}>{c}</option>)}
        </select>
        <input value={form.make} onChange={(e) => setForm({ ...form, make: e.target.value })} placeholder="Make" className="p-3 rounded bg-black/30 border border-white/10" />
        <input value={form.model} onChange={(e) => setForm({ ...form, model: e.target.value })} placeholder="Model" className="p-3 rounded bg-black/30 border border-white/10" />
        <input value={form.year} onChange={(e) => setForm({ ...form, year: e.target.value })} placeholder="Year" className="p-3 rounded bg-black/30 border border-white/10" />
        <button className="md:col-span-4 px-4 py-2 rounded bg-[#590df2] font-bold">Add vehicle</button>
      </form>

      <div className="rounded-xl border border-white/10 overflow-hidden">
        <table className="w-full text-sm">
          <thead className="bg-white/5">
            <tr>
              <th className="text-left p-2">Category</th>
              <th className="text-left p-2">Make</th>
              <th className="text-left p-2">Model</th>
              <th className="text-left p-2">Year</th>
              <th className="text-left p-2">Active</th>
            </tr>
          </thead>
          <tbody>
            {items.map((i) => (
              <tr key={i.id} className="border-t border-white/5">
                <td className="p-2">{i.category}</td>
                <td className="p-2">{i.make}</td>
                <td className="p-2">{i.model}</td>
                <td className="p-2">{i.year ?? '-'}</td>
                <td className="p-2">
                  <input
                    type="checkbox"
                    checked={i.isActive}
                    onChange={async (e) => {
                      await api.adminVehicleUpdate(i.id, { isActive: e.target.checked });
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
