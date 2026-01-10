<script>

  import ClientSidebar from '$lib/components/ClientSidebar.svelte';

  let history = [
    { id: 'L-8801', route: 'Miami, FL → Atlanta, GA', driver: 'Robert Brown', date: 'Oct 15, 2026', total: '$1,200', rating: '5.0' },
    { id: 'L-8750', route: 'Chicago, IL → Detroit, MI', driver: 'Sarah Connor', date: 'Oct 10, 2026', total: '$450', rating: '4.8' },
    { id: 'L-8700', route: 'Houston, TX → Austin, TX', driver: 'James Bond', date: 'Oct 05, 2026', total: '$300', rating: '5.0' }
  ];
</script>

<div class="bg-bg-main text-slate-900 font-display min-h-screen flex selection:bg-primary/10">
    <ClientSidebar activePage="history" />

    <main class="flex-1 flex flex-col h-screen overflow-hidden relative">
        <!-- Glassmorphism Header -->
        <header class="flex items-center justify-between glass border-b border-slate-200 px-8 py-5 h-20 shrink-0 z-20">
            <div>
                <h2 class="text-2xl font-black text-slate-900 tracking-tight leading-none">Operational Archives</h2>
                <p class="text-[10px] font-black text-slate-400 uppercase tracking-widest mt-1">Immutable transit history</p>
            </div>
            <div class="flex items-center gap-3">
                <button class="bg-slate-50 border border-slate-200 text-slate-600 px-5 py-2.5 rounded-xl text-xs font-black hover:bg-white hover:text-primary transition-all micro-interaction">
                    Download Manifests
                </button>
            </div>
        </header>

        <div class="flex-1 overflow-y-auto p-8 bg-[radial-gradient(35%_35%_at_50%_0%,rgba(29,78,216,0.02)_0%,transparent_100%)]">
            <div class="premium-card overflow-hidden">
                <table class="w-full text-left">
                    <thead class="bg-slate-50 border-b border-slate-100">
                        <tr>
                            <th class="px-8 py-5 text-[10px] font-black uppercase tracking-widest text-slate-400">Load Identity</th>
                            <th class="px-8 py-5 text-[10px] font-black uppercase tracking-widest text-slate-400">Route Trajectory</th>
                            <th class="px-8 py-5 text-[10px] font-black uppercase tracking-widest text-slate-400">Assigned Partner</th>
                            <th class="px-8 py-5 text-[10px] font-black uppercase tracking-widest text-slate-400">Timestamp</th>
                            <th class="px-8 py-5 text-[10px] font-black uppercase tracking-widest text-slate-400">Final Settlement</th>
                            <th class="px-8 py-5 text-right text-[10px] font-black uppercase tracking-widest text-slate-400">Performance Index</th>
                        </tr>
                    </thead>
                    <tbody class="divide-y divide-slate-100">
                        {#each history as item}
                            <tr class="hover:bg-slate-50/50 transition-all cursor-pointer group">
                                <td class="px-8 py-6">
                                    <span class="font-black text-primary tracking-tighter">{item.id}</span>
                                </td>
                                <td class="px-8 py-6 font-black text-slate-900 text-sm">
                                    {item.route}
                                </td>
                                <td class="px-8 py-6">
                                    <div class="flex items-center gap-3">
                                        <div class="size-8 rounded-lg bg-slate-100 flex items-center justify-center text-slate-400 group-hover:bg-primary/10 group-hover:text-primary transition-all">
                                            <span class="material-symbols-outlined text-[18px]">account_circle</span>
                                        </div>
                                        <span class="text-xs font-bold text-slate-600 group-hover:text-slate-900 transition-colors">{item.driver}</span>
                                    </div>
                                </td>
                                <td class="px-8 py-6">
                                    <span class="text-xs font-bold text-slate-400 uppercase tracking-tight">{item.date}</span>
                                </td>
                                <td class="px-8 py-6">
                                    <span class="text-sm font-black text-slate-900">{item.total}</span>
                                </td>
                                <td class="px-8 py-6 text-right">
                                    <div class="inline-flex items-center gap-1.5 px-3 py-1 bg-yellow-50 border border-yellow-100 text-yellow-600 rounded-full">
                                        <span class="material-symbols-outlined text-[14px] fill-current">star</span>
                                        <span class="text-[10px] font-black uppercase tracking-widest">{item.rating}</span>
                                    </div>
                                </td>
                            </tr>
                        {/each}
                    </tbody>
                </table>
            </div>

            <!-- Summary Deck -->
            <div class="grid grid-cols-1 md:grid-cols-2 gap-8 mt-12 pb-12">
                <div class="premium-card p-10 bg-white border border-slate-200 text-slate-900 relative overflow-hidden group">
                    <div class="absolute -right-8 -bottom-8 opacity-100 group-hover:scale-110 transition-transform duration-700">
                        <span class="material-symbols-outlined text-[160px] text-slate-50">insights</span>
                    </div>
                    <div class="relative z-10">
                        <h3 class="text-2xl font-black tracking-tight mb-2">Network Insights</h3>
                        <p class="text-slate-500 text-sm font-medium mb-8 leading-relaxed">Your transit efficiency is 12% above market average this quarter.</p>
                        <button class="px-6 py-3 rounded-xl bg-slate-900 text-white font-black text-xs micro-interaction shadow-lg shadow-slate-200">Visualize Analysis</button>
                    </div>
                </div>
                <div class="premium-card p-10 bg-white border border-slate-200 text-slate-900 relative overflow-hidden group">
                    <div class="absolute -right-8 -bottom-8 opacity-100 group-hover:scale-110 transition-transform duration-700">
                        <span class="material-symbols-outlined text-[160px] text-primary/5">history_edu</span>
                    </div>
                    <div class="relative z-10">
                        <h3 class="text-2xl font-black tracking-tight mb-2">Compliance Log</h3>
                        <p class="text-slate-500 text-sm font-medium mb-8 leading-relaxed">All certificates and insurance verification nodes are synchronized.</p>
                        <button class="px-6 py-3 rounded-xl bg-primary text-white font-black text-xs micro-interaction shadow-lg shadow-primary/20">Audit Protocols</button>
                    </div>
                </div>
            </div>
        </div>
    </main>
</div>
