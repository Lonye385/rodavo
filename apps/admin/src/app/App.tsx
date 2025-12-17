import React, { useEffect, useState } from 'react';
import { Users, Ticket, AlertTriangle, LayoutDashboard, LogOut } from 'lucide-react';

import { AdminApiClient, type ApiUser } from '../services/api';
import { LoginPage } from '../pages/LoginPage';
import { DashboardPage } from '../pages/DashboardPage';
import { UsersPage } from '../pages/UsersPage';
import { TicketsPage } from '../pages/TicketsPage';

type View = 'dashboard' | 'users' | 'tickets';

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
        {/* Hazards moderation will be next page */}
        <div className="hidden"><AlertTriangle /></div>
      </main>
    </div>
  );
}
