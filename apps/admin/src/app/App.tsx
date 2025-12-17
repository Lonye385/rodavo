import React, { useEffect, useState } from 'react';
import { Users, Ticket, AlertTriangle, LayoutDashboard, LogOut, Truck, Store, Percent, UserPlus, ScrollText } from 'lucide-react';

import { AdminApiClient, type ApiUser } from '../services/api';
import { LoginPage } from '../pages/LoginPage';
import { DashboardPage } from '../pages/DashboardPage';
import { UsersPage } from '../pages/UsersPage';
import { TicketsPage } from '../pages/TicketsPage';
import { HazardsPage } from '../pages/admin/HazardsPage';
import { VehiclesPage } from '../pages/admin/VehiclesPage';
import { ShopPackagesPage } from '../pages/admin/ShopPackagesPage';
import { PromotionsPage } from '../pages/admin/PromotionsPage';
import { TeamPage } from '../pages/admin/TeamPage';
import { AuditPage } from '../pages/admin/AuditPage';

type View = 'dashboard' | 'users' | 'tickets' | 'hazards' | 'vehicles' | 'shop' | 'promos' | 'team' | 'audit';

export default function App() {
  const api = AdminApiClient.fromEnv();
  const [user, setUser] = useState<ApiUser | null>(null);
  const [view, setView] = useState<View>('dashboard');

  useEffect(() => {
    const bootstrap = async () => {
      if (!api.getTokens()) return;
      try {
        const me = await api.me();
        setUser(me);
      } catch {
        api.logout();
      }
    };
    // ignore: void promises
    bootstrap();
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  if (!user) {
    return <LoginPage onLoggedIn={setUser} />;
  }

  return (
    <div className="h-full flex">
      <aside className="w-64 bg-[#0a0a0a] border-r border-white/5 p-4 flex flex-col">
        <div className="mb-4">
          <div className="text-lg font-black tracking-tight">RodaVO Admin</div>
          <div className="text-xs text-white/50">{user.email} • {user.role}</div>
        </div>
        <nav className="flex flex-col gap-2 text-sm">
          <button onClick={() => setView('dashboard')} className={`flex items-center gap-2 p-2 rounded ${view==='dashboard'?'bg-white/10':'hover:bg-white/5'}`}>
            <LayoutDashboard size={16} /> Dashboard
          </button>
          <button onClick={() => setView('users')} className={`flex items-center gap-2 p-2 rounded ${view==='users'?'bg-white/10':'hover:bg-white/5'}`}>
            <Users size={16} /> Users
          </button>
          <button onClick={() => setView('tickets')} className={`flex items-center gap-2 p-2 rounded ${view==='tickets'?'bg-white/10':'hover:bg-white/5'}`}>
            <Ticket size={16} /> Tickets
          </button>
          <button onClick={() => setView('hazards')} className={`flex items-center gap-2 p-2 rounded ${view==='hazards'?'bg-white/10':'hover:bg-white/5'}`}>
            <AlertTriangle size={16} /> Hazards
          </button>
          <button onClick={() => setView('vehicles')} className={`flex items-center gap-2 p-2 rounded ${view==='vehicles'?'bg-white/10':'hover:bg-white/5'}`}>
            <Truck size={16} /> Vehicles
          </button>
          <button onClick={() => setView('shop')} className={`flex items-center gap-2 p-2 rounded ${view==='shop'?'bg-white/10':'hover:bg-white/5'}`}>
            <Store size={16} /> Shop
          </button>
          <button onClick={() => setView('promos')} className={`flex items-center gap-2 p-2 rounded ${view==='promos'?'bg-white/10':'hover:bg-white/5'}`}>
            <Percent size={16} /> Promos
          </button>
          <button onClick={() => setView('team')} className={`flex items-center gap-2 p-2 rounded ${view==='team'?'bg-white/10':'hover:bg-white/5'}`}>
            <UserPlus size={16} /> Team
          </button>
          <button onClick={() => setView('audit')} className={`flex items-center gap-2 p-2 rounded ${view==='audit'?'bg-white/10':'hover:bg-white/5'}`}>
            <ScrollText size={16} /> Audit
          </button>
        </nav>
        <div className="mt-auto pt-4">
          <button
            onClick={() => {
              api.logout();
              setUser(null);
            }}
            className="w-full flex items-center justify-center gap-2 p-2 rounded bg-red-500/10 border border-red-500/20 hover:bg-red-500/15"
          >
            <LogOut size={16} /> Logout
          </button>
        </div>
      </aside>
      <main className="flex-1 overflow-auto">
        {view === 'dashboard' && <DashboardPage />}
        {view === 'users' && <UsersPage />}
        {view === 'tickets' && <TicketsPage />}
        {view === 'hazards' && <HazardsPage />}
        {view === 'vehicles' && <VehiclesPage />}
        {view === 'shop' && <ShopPackagesPage />}
        {view === 'promos' && <PromotionsPage />}
        {view === 'team' && <TeamPage />}
        {view === 'audit' && <AuditPage />}
      </main>
    </div>
  );
}
