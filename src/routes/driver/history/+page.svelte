<script>


  const history = [
    { id: 'L-8941', route: 'Denver → Phoenix', date: 'Jan 12, 2024', earnings: '$4,200', distance: '1,280 km', status: 'Completed', rating: 5 },
    { id: 'L-8830', route: 'Dallas → Houston', date: 'Jan 10, 2024', earnings: '$1,850', distance: '385 km', status: 'Completed', rating: 4.8 },
    { id: 'L-8722', route: 'Atlanta → Orlando', date: 'Jan 08, 2024', earnings: '$2,100', distance: '710 km', status: 'Completed', rating: 5 },
    { id: 'L-8615', route: 'San Jose → Seattle', date: 'Jan 05, 2024', earnings: '$5,900', distance: '1,350 km', status: 'Completed', rating: 4.9 },
    { id: 'L-8501', route: 'Boston → New York', date: 'Jan 02, 2024', earnings: '$1,200', distance: '350 km', status: 'Completed', rating: 4.7 },
  ];
</script>



    <main class="flex-1 flex flex-col h-screen overflow-hidden relative">
        <header class="flex items-center justify-between glass border-b border-slate-200 px-8 py-5 h-20 shrink-0 z-20">
            <div class="flex items-center gap-4">
                <a href="/driver/dashboard" class="p-2 rounded-xl text-slate-400 hover:text-primary transition-all micro-interaction">
                    <span class="material-symbols-outlined">arrow_back</span>
                </a>
                <div class="w-px h-6 bg-slate-200"></div>
                <div>
                    <h2 class="text-2xl font-black text-slate-900 tracking-tight leading-none">Mission Archive</h2>
                    <p class="text-[10px] font-black text-slate-400 uppercase tracking-widest mt-1">Operational History & Analytics</p>
                </div>
            </div>
            <div class="flex items-center gap-4">
                <button class="flex items-center gap-2 px-4 py-2.5 rounded-xl border border-slate-200 text-xs font-black uppercase tracking-widest hover:bg-slate-50 transition-all micro-interaction">
                    <span class="material-symbols-outlined text-[18px]">download</span>
                    Export Log
                </button>
            </div>
        </header>

        <div class="flex-1 overflow-y-auto p-8 bg-[radial-gradient(40%_40%_at_50%_0%,rgba(29,78,216,0.02)_0%,transparent_100%)]">
            <div class="max-w-6xl mx-auto">
                <div class="grid grid-cols-1 md:grid-cols-4 gap-6 mb-8">
                    <div class="premium-card p-6 bg-white">
                        <p class="text-[10px] font-black text-slate-400 uppercase tracking-widest mb-1">Total Loads</p>
                        <p class="text-3xl font-black text-slate-900">142</p>
                    </div>
                    <div class="premium-card p-6 bg-white">
                        <p class="text-[10px] font-black text-slate-400 uppercase tracking-widest mb-1">Distance Travelled</p>
                        <p class="text-3xl font-black text-slate-900">42,500 <span class="text-sm">km</span></p>
                    </div>
                    <div class="premium-card p-6 bg-white">
                        <p class="text-[10px] font-black text-slate-400 uppercase tracking-widest mb-1">Total Lifetime</p>
                        <p class="text-3xl font-black text-slate-900">$185k</p>
                    </div>
                    <div class="premium-card p-6 bg-white">
                        <p class="text-[10px] font-black text-emerald-500 uppercase tracking-widest mb-1">Fleet Rating</p>
                        <div class="flex items-center gap-2">
                            <p class="text-3xl font-black text-slate-900">4.9</p>
                            <span class="material-symbols-outlined text-yellow-400 fill-yellow-400">star</span>
                        </div>
                    </div>
                </div>

                <div class="premium-card overflow-hidden">
                    <table class="w-full text-left">
                        <thead>
                            <tr class="bg-slate-50/50 border-b border-slate-100">
                                <th class="px-6 py-4 text-[10px] font-black text-slate-400 uppercase tracking-widest">Load ID</th>
                                <th class="px-6 py-4 text-[10px] font-black text-slate-400 uppercase tracking-widest">Route Expansion</th>
                                <th class="px-6 py-4 text-[10px] font-black text-slate-400 uppercase tracking-widest">Timestamp</th>
                                <th class="px-6 py-4 text-[10px] font-black text-slate-400 uppercase tracking-widest">Metric</th>
                                <th class="px-6 py-4 text-[10px] font-black text-slate-400 uppercase tracking-widest">Yield</th>
                                <th class="px-6 py-4 text-[10px] font-black text-slate-400 uppercase tracking-widest">Rating</th>
                            </tr>
                        </thead>
                        <tbody class="divide-y divide-slate-100">
                            {#each history as item}
                                <tr class="hover:bg-slate-50/50 transition-colors group cursor-pointer">
                                    <td class="px-6 py-5">
                                        <span class="text-sm font-black text-slate-900 group-hover:text-primary transition-colors">{item.id}</span>
                                    </td>
                                    <td class="px-6 py-5">
                                        <p class="text-sm font-bold text-slate-700">{item.route}</p>
                                    </td>
                                    <td class="px-6 py-5">
                                        <p class="text-xs font-bold text-slate-500">{item.date}</p>
                                    </td>
                                    <td class="px-6 py-5">
                                        <p class="text-xs font-bold text-slate-500">{item.distance}</p>
                                    </td>
                                    <td class="px-6 py-5">
                                        <p class="text-sm font-black text-slate-900">{item.earnings}</p>
                                    </td>
                                    <td class="px-6 py-5">
                                        <div class="flex items-center gap-1.5">
                                            <span class="text-xs font-black text-slate-700">{item.rating}</span>
                                            <span class="material-symbols-outlined text-sm text-yellow-400 fill-yellow-400">star</span>
                                        </div>
                                    </td>
                                </tr>
                            {/each}
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </main>

