<script>


  const bids = [
    { id: 'L-9921', route: 'Miami Node', rate: '$3.20', total: '$3,840', status: 'In Review', color: 'text-blue-500', bg: 'bg-blue-50', date: '2024-01-10', weight: '15t', type: 'Dry Van' },
    { id: 'L-9844', route: 'Seattle Node', rate: '$2.95', total: '$6,195', status: 'Pending', color: 'text-yellow-600', bg: 'bg-yellow-50', date: '2024-01-12', weight: '22t', type: 'Reefer' },
    { id: 'L-9550', route: 'Austin Node', rate: '$3.50', total: '$2,800', status: 'Outbid', color: 'text-red-500', bg: 'bg-red-50', date: '2024-01-15', weight: '12t', type: 'Flatbed' },
    { id: 'L-9400', route: 'Chicago Node', rate: '$3.10', total: '$4,500', status: 'Accepted', color: 'text-emerald-500', bg: 'bg-emerald-50', date: '2024-01-18', weight: '18t', type: 'Dry Van' },
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
                    <h2 class="text-2xl font-black text-slate-900 tracking-tight leading-none">Proposal Nexus</h2>
                    <p class="text-[10px] font-black text-slate-400 uppercase tracking-widest mt-1">Live Bidding & Negotiation</p>
                </div>
            </div>
            <div class="flex items-center gap-4">
                <button class="bg-primary hover:bg-primary-dark text-white px-6 py-2.5 rounded-xl text-xs font-black uppercase tracking-widest transition-all shadow-lg shadow-primary/20 micro-interaction">
                    New Proposal
                </button>
            </div>
        </header>

        <div class="flex-1 overflow-y-auto p-8 bg-[radial-gradient(40%_40%_at_50%_0%,rgba(29,78,216,0.02)_0%,transparent_100%)]">
            <div class="max-w-6xl mx-auto">
                <div class="grid grid-cols-1 md:grid-cols-3 gap-6 mb-8">
                    <div class="premium-card p-6 bg-white">
                        <p class="text-[10px] font-black text-slate-400 uppercase tracking-widest mb-1">Active Bids</p>
                        <p class="text-3xl font-black text-slate-900">12</p>
                    </div>
                    <div class="premium-card p-6 bg-white border-emerald-100">
                        <p class="text-[10px] font-black text-emerald-500 uppercase tracking-widest mb-1">Acceptance Rate</p>
                        <p class="text-3xl font-black text-emerald-600">68%</p>
                    </div>
                    <div class="premium-card p-6 bg-white border-primary/10">
                        <p class="text-[10px] font-black text-primary uppercase tracking-widest mb-1">Potential Revenue</p>
                        <p class="text-3xl font-black text-slate-900">$24,800</p>
                    </div>
                </div>

                <div class="premium-card overflow-hidden">
                    <div class="p-6 border-b border-slate-100 bg-slate-50/50 flex justify-between items-center">
                        <h3 class="text-sm font-black text-slate-900 uppercase tracking-widest">Ongoing Negotiations</h3>
                        <div class="flex gap-2">
                            <button class="p-2 rounded-lg bg-white border border-slate-200 text-slate-400 hover:text-primary transition-all">
                                <span class="material-symbols-outlined text-[20px]">filter_list</span>
                            </button>
                            <button class="p-2 rounded-lg bg-white border border-slate-200 text-slate-400 hover:text-primary transition-all">
                                <span class="material-symbols-outlined text-[20px]">search</span>
                            </button>
                        </div>
                    </div>
                    <table class="w-full text-left border-collapse">
                        <thead class="bg-slate-50 border-b border-slate-100">
                            <tr>
                                <th class="px-6 py-5 text-[10px] font-black uppercase tracking-widest text-slate-400">Proposal ID</th>
                                <th class="px-6 py-5 text-[10px] font-black uppercase tracking-widest text-slate-400">Route & Cargo</th>
                                <th class="px-6 py-5 text-[10px] font-black uppercase tracking-widest text-slate-400">Financial Bid</th>
                                <th class="px-6 py-5 text-[10px] font-black uppercase tracking-widest text-slate-400">Status</th>
                                <th class="px-6 py-5 text-[10px] font-black uppercase tracking-widest text-slate-400 text-right">Actions</th>
                            </tr>
                        </thead>
                        <tbody class="divide-y divide-slate-100">
                            {#each bids as bid}
                                <tr class="hover:bg-slate-50/50 transition-colors group">
                                    <td class="px-6 py-6 font-black text-slate-900">
                                        {bid.id}
                                    </td>
                                    <td class="px-6 py-6">
                                        <div class="flex flex-col">
                                            <span class="text-xs font-black text-slate-900">{bid.route}</span>
                                            <div class="flex items-center gap-2 mt-1">
                                                <span class="text-[9px] font-bold text-slate-500 uppercase tracking-tight">{bid.type}</span>
                                                <span class="size-1 rounded-full bg-slate-200"></span>
                                                <span class="text-[9px] font-bold text-slate-500 uppercase tracking-tight">{bid.weight}</span>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="px-6 py-6">
                                        <div class="flex flex-col">
                                            <span class="text-sm font-black text-slate-900">{bid.total}</span>
                                            <span class="text-[9px] font-bold text-slate-400 uppercase tracking-tight">{bid.rate}/km</span>
                                        </div>
                                    </td>
                                    <td class="px-6 py-6">
                                        <span class="px-2.5 py-1 rounded-full text-[9px] font-black uppercase tracking-widest {bid.bg} {bid.color}">
                                            {bid.status}
                                        </span>
                                    </td>
                                    <td class="px-6 py-6 text-right">
                                        <div class="flex items-center justify-end gap-2">
                                            <button class="px-4 py-2 rounded-xl border border-slate-200 text-xs font-black uppercase tracking-widest hover:bg-white hover:border-primary hover:text-primary transition-all">
                                                Edit
                                            </button>
                                            <button class="px-4 py-2 rounded-xl bg-slate-900 text-white text-xs font-black uppercase tracking-widest hover:bg-primary transition-all shadow-lg shadow-slate-200">
                                                Retract
                                            </button>
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

