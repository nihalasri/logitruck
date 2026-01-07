<script>

  import ClientSidebar from '$lib/components/ClientSidebar.svelte';

  let payments = [
    { id: 'PAY-001', amount: '$1,200', method: 'Visa **** 4242', status: 'Completed', date: 'Oct 24, 2026' },
    { id: 'PAY-002', amount: '$450', method: 'Bank Transfer', status: 'Pending', date: 'Oct 25, 2026' },
    { id: 'PAY-003', amount: '$300', method: 'Visa **** 4242', status: 'Completed', date: 'Oct 05, 2026' }
  ];
</script>

<div class="bg-bg-main text-slate-900 font-display min-h-screen flex selection:bg-primary/10">
    <ClientSidebar activePage="payments" />

    <main class="flex-1 flex flex-col h-screen overflow-hidden relative">
        <!-- Glassmorphism Header -->
        <header class="flex items-center justify-between glass border-b border-slate-200 px-8 py-5 h-20 shrink-0 z-20">
            <div>
                <h2 class="text-2xl font-black text-slate-900 tracking-tight leading-none">Financial Ledger</h2>
                <p class="text-[10px] font-black text-slate-400 uppercase tracking-widest mt-1">Transaction audit trail</p>
            </div>
            <button class="bg-slate-900 text-white px-6 py-2.5 rounded-xl text-sm font-black shadow-xl shadow-slate-200 micro-interaction">
                Export Data
            </button>
        </header>

        <div class="flex-1 overflow-y-auto p-8 bg-[radial-gradient(35%_35%_at_50%_0%,rgba(29,78,216,0.02)_0%,transparent_100%)]">
            <!-- Stats Summary -->
            <div class="grid grid-cols-1 md:grid-cols-4 gap-6 mb-10">
                <div class="premium-card p-8 group relative overflow-hidden">
                    <div class="absolute -right-4 -bottom-4 opacity-[0.05] group-hover:scale-110 transition-transform duration-500">
                        <span class="material-symbols-outlined text-8xl text-primary">account_balance_wallet</span>
                    </div>
                    <p class="text-[10px] font-black uppercase tracking-[0.2em] text-slate-400 mb-2">Aggregate Outflow</p>
                    <p class="text-4xl font-black text-slate-900">$12,450.00</p>
                </div>
                <div class="premium-card p-8 border-emerald-100 bg-emerald-50/30">
                    <p class="text-[10px] font-black uppercase tracking-[0.2em] text-slate-400 mb-2">Reward Credits</p>
                    <p class="text-4xl font-black text-emerald-600">$125.50</p>
                </div>
                <div class="premium-card p-8 border-primary/10 bg-primary/5">
                    <p class="text-[10px] font-black uppercase tracking-[0.2em] text-slate-400 mb-2">Corporate Discount</p>
                    <p class="text-4xl font-black text-primary">12% OFF</p>
                </div>
                <div class="premium-card p-8 bg-slate-900 text-white group relative overflow-hidden">
                    <div class="absolute -right-4 -top-4 opacity-[0.1]">
                        <span class="material-symbols-outlined text-4xl">confirmation_number</span>
                    </div>
                    <p class="text-[10px] font-black uppercase tracking-[0.2em] text-slate-400 mb-4">Active Promo</p>
                    <div class="flex items-center gap-2">
                        <input type="text" placeholder="CODE" class="w-full bg-white/10 border border-white/20 rounded-lg px-3 py-2 text-xs font-black uppercase placeholder:text-slate-500 focus:outline-none focus:ring-1 focus:ring-primary"/>
                        <button class="bg-primary px-3 py-2 rounded-lg material-symbols-outlined text-sm">check</button>
                    </div>
                </div>
            </div>

            <div class="premium-card overflow-hidden mb-10">
                <table class="w-full text-left">
                    <thead class="bg-slate-50 border-b border-slate-100">
                        <tr>
                            <th class="px-8 py-5 text-[10px] font-black uppercase tracking-widest text-slate-400">Reference ID</th>
                            <th class="px-8 py-5 text-[10px] font-black uppercase tracking-widest text-slate-400">Magnitude</th>
                            <th class="px-8 py-5 text-[10px] font-black uppercase tracking-widest text-slate-400">Modality</th>
                            <th class="px-8 py-5 text-[10px] font-black uppercase tracking-widest text-slate-400">State</th>
                            <th class="px-8 py-5 text-right text-[10px] font-black uppercase tracking-widest text-slate-400">Documentation</th>
                        </tr>
                    </thead>
                    <tbody class="divide-y divide-slate-100">
                        {#each payments as pay}
                            <tr class="hover:bg-slate-50/50 transition-all cursor-pointer group">
                                <td class="px-8 py-6">
                                    <div class="flex flex-col">
                                        <span class="font-black text-primary tracking-tighter">{pay.id}</span>
                                        <span class="text-[10px] font-bold text-slate-400">{pay.date}</span>
                                    </div>
                                </td>
                                <td class="px-8 py-6 font-black text-slate-900">{pay.amount}</td>
                                <td class="px-8 py-6">
                                    <div class="flex items-center gap-2">
                                        <span class="material-symbols-outlined text-[18px] text-slate-300">credit_card</span>
                                        <span class="text-xs font-bold text-slate-500">{pay.method}</span>
                                    </div>
                                </td>
                                <td class="px-8 py-6">
                                    <span class="inline-flex items-center px-3 py-1 rounded-full text-[10px] font-black uppercase tracking-wider 
                                        {pay.status === 'Completed' ? 'bg-emerald-50 text-emerald-600 border border-emerald-100' : 'bg-primary/5 text-primary border border-primary/10'}">
                                        {pay.status}
                                    </span>
                                </td>
                                <td class="px-8 py-6 text-right">
                                    <button class="p-2.5 rounded-xl text-slate-400 hover:text-primary hover:bg-primary/5 transition-all micro-interaction">
                                        <span class="material-symbols-outlined text-[20px]">download_for_offline</span>
                                    </button>
                                </td>
                            </tr>
                        {/each}
                    </tbody>
                </table>
            </div>

            <div class="p-6 bg-slate-900 text-white rounded-[2rem] flex items-center justify-between mb-10 relative overflow-hidden">
                <div class="absolute inset-0 bg-gradient-to-r from-primary/20 to-transparent"></div>
                <div class="relative z-10 flex items-center gap-6">
                    <div class="size-12 rounded-2xl bg-white/10 border border-white/20 flex items-center justify-center">
                        <span class="material-symbols-outlined text-primary">group_add</span>
                    </div>
                    <div>
                        <p class="text-sm font-black tracking-tight">Split Payment Modal Active</p>
                        <p class="text-[10px] font-black text-slate-400 uppercase tracking-widest">Enable to share fares with multiple entities for shared loads</p>
                    </div>
                </div>
                <div class="relative z-10 size-12 rounded-full bg-slate-700 p-1 flex items-center justify-start cursor-pointer hover:bg-slate-600 transition-colors">
                    <div class="size-10 rounded-full bg-white shadow-sm"></div>
                </div>
            </div>

            <!-- Service Tiering -->
            <div class="space-y-6 pb-12">
                <h3 class="text-xl font-black tracking-tight text-slate-900">Service Architecture</h3>
                <div class="grid grid-cols-1 md:grid-cols-2 gap-8">
                    <div class="premium-card p-10 bg-white relative overflow-hidden ring-2 ring-primary">
                        <div class="absolute right-6 top-6">
                            <span class="bg-primary text-white text-[10px] font-black px-3 py-1.5 rounded-full uppercase tracking-widest shadow-lg shadow-primary/20">Active Node</span>
                        </div>
                        <h4 class="text-2xl font-black text-slate-900 mb-2">Corporate Core</h4>
                        <p class="text-slate-500 font-medium text-sm mb-8 leading-relaxed">Enhanced throughput with priority matching across the entire LogiPro network.</p>
                        <ul class="space-y-4 mb-10">
                            {#each ['5% Rebate on Long-haul', 'Priority Dispatch Access', 'Institutional Support', 'Enterprise Dashboard Sync'] as feature}
                            <li class="flex items-center gap-3">
                                <div class="size-6 rounded-lg bg-primary/10 text-primary flex items-center justify-center">
                                    <span class="material-symbols-outlined text-sm font-bold">check</span>
                                </div>
                                <span class="text-sm font-bold text-slate-600">{feature}</span>
                            </li>
                            {/each}
                        </ul>
                    </div>

                    <div class="premium-card p-10 bg-slate-900 text-white relative overflow-hidden group">
                        <!-- Glow -->
                        <div class="absolute -right-20 -bottom-20 size-64 bg-primary/20 blur-[100px] rounded-full"></div>
                        
                        <div class="relative z-10">
                            <h4 class="text-2xl font-black mb-2">Logistics API Pro</h4>
                            <p class="text-slate-400 font-medium text-sm mb-8 leading-relaxed">Full programmatic access with unlimited webhook listeners and dedicated infrastructure.</p>
                            <button class="w-full py-5 rounded-2xl bg-white text-slate-900 font-black text-sm micro-interaction shadow-2xl shadow-black/20">
                                Upgrade to Enterprise
                            </button>
                            <p class="text-center mt-6 text-[10px] font-black text-primary uppercase tracking-[0.3em]">Institutional Grade</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
</div>
