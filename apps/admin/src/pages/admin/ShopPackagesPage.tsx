import React, { useEffect, useState } from 'react';
import { AdminApiClient } from '../../services/api';

export function ShopPackagesPage() {
  const api = AdminApiClient.fromEnv();
  const [items, setItems] = useState<any[]>([]);
  const [form, setForm] = useState({ sku: '', title: '', priceEur: '0', description: '' });

  const load = async () => {
    const res = await api.adminShopPackages();
    setItems(res.items);
  };

  useEffect(() => {
    // ignore: void promises
    load();
  }, []);

  return (
    <div className="p-6">
      <h1 className="text-2xl font-black mb-4">Shop packages</h1>

      <form
        className="p-4 rounded-xl bg-white/5 border border-white/10 mb-4 grid grid-cols-1 md:grid-cols-4 gap-2"
        onSubmit={async (e) => {
          e.preventDefault();
          await api.adminShopPackageCreate({
            sku: form.sku,
            title: form.title,
            priceEur: Number(form.priceEur),
            description: form.description || undefined,
          });
          setForm({ sku: '', title: '', priceEur: '0', description: '' });
          await load();
        }}
      >
        <input value={form.sku} onChange={(e) => setForm({ ...form, sku: e.target.value })} placeholder="SKU" className="p-3 rounded bg-black/30 border border-white/10" />
        <input value={form.title} onChange={(e) => setForm({ ...form, title: e.target.value })} placeholder="Title" className="p-3 rounded bg-black/30 border border-white/10" />
        <input value={form.priceEur} onChange={(e) => setForm({ ...form, priceEur: e.target.value })} placeholder="Price EUR" className="p-3 rounded bg-black/30 border border-white/10" />
        <input value={form.description} onChange={(e) => setForm({ ...form, description: e.target.value })} placeholder="Description" className="p-3 rounded bg-black/30 border border-white/10" />
        <button className="md:col-span-4 px-4 py-2 rounded bg-[#590df2] font-bold">Add package</button>
      </form>

      <div className="rounded-xl border border-white/10 overflow-hidden">
        <table className="w-full text-sm">
          <thead className="bg-white/5">
            <tr>
              <th className="text-left p-2">SKU</th>
              <th className="text-left p-2">Title</th>
              <th className="text-left p-2">Price</th>
              <th className="text-left p-2">Active</th>
            </tr>
          </thead>
          <tbody>
            {items.map((i) => (
              <tr key={i.id} className="border-t border-white/5">
                <td className="p-2">{i.sku}</td>
                <td className="p-2">{i.title}</td>
                <td className="p-2">€{i.priceEur}</td>
                <td className="p-2">
                  <input
                    type="checkbox"
                    checked={i.isActive}
                    onChange={async (e) => {
                      await api.adminShopPackageUpdate(i.id, { isActive: e.target.checked });
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
