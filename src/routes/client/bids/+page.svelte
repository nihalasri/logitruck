<script>

  import ClientSidebar from '$lib/components/ClientSidebar.svelte';

  let bids = [
    { id: 'B-101', loadId: 'L-8942', amount: '$450', driver: 'John Doe', status: 'Accepted', date: 'Oct 24, 2026' },
    { id: 'B-102', loadId: 'L-8942', amount: '$420', driver: 'Jane Smith', status: 'Pending', date: 'Oct 24, 2026' },
    { id: 'B-103', loadId: 'L-8940', amount: '$580', driver: 'Mike Ross', status: 'Outbid', date: 'Oct 23, 2026' }
  ];
</script>

<div class="bg-bg-main text-slate-900 font-display min-h-screen flex selection:bg-primary/10">
    <ClientSidebar activePage="bids" />

    <main class="flex-1 flex flex-col h-screen overflow-hidden relative">
        <!-- Glassmorphism Header -->
        <header class="flex items-center justify-between glass border-b border-slate-200 px-8 py-5 h-20 shrink-0 z-20">
            <div>
                <h2 class="text-2xl font-black text-slate-900 tracking-tight leading-none">Market Proposals</h2>
                <p class="text-[10px] font-black text-slate-400 uppercase tracking-widest mt-1">Live competitive matrix</p>
            </div>
            <div class="flex items-center gap-3">
                <span class="bg-emerald-50 text-emerald-600 px-3 py-1 rounded-full text-[10px] font-black uppercase tracking-wider border border-emerald-100 italic">Market Active</span>
            </div>
        </header>

        <div class="flex-1 overflow-y-auto p-8 bg-[radial-gradient(35%_35%_at_50%_0%,rgba(29,78,216,0.02)_0%,transparent_100%)]">
            <div class="premium-card overflow-hidden">
                <table class="w-full text-left">
                    <thead class="bg-slate-50 border-b border-slate-100">
                        <tr>
                            <th class="px-8 py-5 text-[10px] font-black uppercase tracking-widest text-slate-400">Bid Node</th>
                            <th class="px-8 py-5 text-[10px] font-black uppercase tracking-widest text-slate-400">Target Shipment</th>
                            <th class="px-8 py-5 text-[10px] font-black uppercase tracking-widest text-slate-400">Carrier Representative</th>
                            <th class="px-8 py-5 text-[10px] font-black uppercase tracking-widest text-slate-400">Financial Stake</th>
                            <th class="px-8 py-5 text-[10px] font-black uppercase tracking-widest text-slate-400">Resolution</th>
                        </tr>
                    </thead>
                    <tbody class="divide-y divide-slate-100">
                        {#each bids as bid}
                            <tr class="hover:bg-slate-50/50 transition-all cursor-pointer group">
                                <td class="px-8 py-6 font-black text-primary tracking-tighter">{bid.id}</td>
                                <td class="px-8 py-6">
                                    <div class="flex flex-col">
                                        <span class="text-xs font-black text-slate-900">{bid.loadId}</span>
                                        <span class="text-[9px] font-bold text-slate-400 uppercase">Archive Node</span>
                                    </div>
                                </td>
                                <td class="px-8 py-6">
                                    <div class="flex items-center gap-3">
                                        <div class="size-9 rounded-xl bg-slate-100 flex items-center justify-center text-slate-400 group-hover:bg-primary/10 group-hover:text-primary transition-colors">
                                            <span class="material-symbols-outlined text-[20px]">badge</span>
                                        </div>
                                        <span class="text-xs font-black text-slate-900">{bid.driver}</span>
                                    </div>
                                </td>
                                <td class="px-8 py-6">
                                    <span class="text-sm font-black text-slate-900 group-hover:text-primary transition-colors">{bid.amount}</span>
                                </td>
                                <td class="px-8 py-6">
                                    <span class="inline-flex items-center gap-2 px-3 py-1 rounded-full text-[10px] font-black uppercase tracking-wider 
                                        {bid.status === 'Accepted' ? 'bg-emerald-50 text-emerald-600 border border-emerald-100' : 
                                         bid.status === 'Pending' ? 'bg-primary/10 text-primary border border-primary/10' : 'bg-red-50 text-red-600 border border-red-100'}">
                                        {bid.status}
                                    </span>
                                </td>
                            </tr>
                        {/each}
                    </tbody>
                </table>
            </div>
        </div>
    </main>
</div>
