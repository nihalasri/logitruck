<script>
  import '../../layout.css';
  import ClientSidebar from '$lib/components/ClientSidebar.svelte';

  let bids = [
    { id: 'B-101', loadId: 'L-8942', amount: '$450', driver: 'John Doe', status: 'Accepted', date: 'Oct 24, 2026' },
    { id: 'B-102', loadId: 'L-8942', amount: '$420', driver: 'Jane Smith', status: 'Pending', date: 'Oct 24, 2026' },
    { id: 'B-103', loadId: 'L-8940', amount: '$580', driver: 'Mike Ross', status: 'Outbid', date: 'Oct 23, 2026' }
  ];
</script>

<div class="bg-background-light dark:bg-background-dark text-slate-900 dark:text-white font-display antialiased flex h-screen overflow-hidden">
    <ClientSidebar activePage="bids" />

    <main class="flex-1 flex flex-col overflow-hidden">
        <header class="h-16 border-b border-slate-200 dark:border-slate-800 flex items-center px-8 bg-white dark:bg-background-dark">
            <h2 class="text-xl font-bold">Manage Bids</h2>
        </header>

        <div class="flex-1 overflow-y-auto p-8">
            <div class="bg-white dark:bg-[#192233] rounded-xl border border-slate-200 dark:border-slate-800 overflow-hidden">
                <table class="w-full text-left">
                    <thead class="bg-slate-50 dark:bg-slate-800/50 text-xs font-bold uppercase text-slate-500">
                        <tr>
                            <th class="px-6 py-4">Bid ID</th>
                            <th class="px-6 py-4">Load ID</th>
                            <th class="px-6 py-4">Driver</th>
                            <th class="px-6 py-4">Amount</th>
                            <th class="px-6 py-4">Status</th>
                        </tr>
                    </thead>
                    <tbody class="divide-y divide-slate-200 dark:divide-slate-800">
                        {#each bids as bid}
                            <tr class="hover:bg-slate-50 dark:hover:bg-white/5 transition-colors">
                                <td class="px-6 py-4 font-mono font-bold text-primary">{bid.id}</td>
                                <td class="px-6 py-4 text-slate-500">{bid.loadId}</td>
                                <td class="px-6 py-4 font-medium">{bid.driver}</td>
                                <td class="px-6 py-4 font-bold">{bid.amount}</td>
                                <td class="px-6 py-4">
                                    <span class="px-2 py-1 rounded-full text-xs font-bold 
                                        {bid.status === 'Accepted' ? 'bg-emerald-100 text-emerald-700' : 
                                         bid.status === 'Pending' ? 'bg-blue-100 text-blue-700' : 'bg-red-100 text-red-700'}">
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
