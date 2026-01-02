<script>
  import '../../layout.css';
  import ClientSidebar from '$lib/components/ClientSidebar.svelte';

  let history = [
    { id: 'L-8801', route: 'Miami, FL → Atlanta, GA', driver: 'Robert Brown', date: 'Oct 15, 2026', total: '$1,200', rating: '5.0' },
    { id: 'L-8750', route: 'Chicago, IL → Detroit, MI', driver: 'Sarah Connor', date: 'Oct 10, 2026', total: '$450', rating: '4.8' },
    { id: 'L-8700', route: 'Houston, TX → Austin, TX', driver: 'James Bond', date: 'Oct 05, 2026', total: '$300', rating: '5.0' }
  ];
</script>

<div class="bg-background-light dark:bg-background-dark text-slate-900 dark:text-white font-display antialiased flex h-screen overflow-hidden">
    <ClientSidebar activePage="history" />

    <main class="flex-1 flex flex-col overflow-hidden">
        <header class="h-16 border-b border-slate-200 dark:border-slate-800 flex items-center px-8 bg-white dark:bg-background-dark">
            <h2 class="text-xl font-bold">Shipping History</h2>
        </header>

        <div class="flex-1 overflow-y-auto p-8">
            <div class="bg-white dark:bg-[#192233] rounded-xl border border-slate-200 dark:border-slate-800 overflow-hidden">
                <table class="w-full text-left">
                    <thead class="bg-slate-50 dark:bg-slate-800/50 text-xs font-bold uppercase text-slate-500">
                        <tr>
                            <th class="px-6 py-4">Load ID</th>
                            <th class="px-6 py-4">Route</th>
                            <th class="px-6 py-4">Driver</th>
                            <th class="px-6 py-4">Date</th>
                            <th class="px-6 py-4">Total</th>
                            <th class="px-6 py-4">Rating</th>
                        </tr>
                    </thead>
                    <tbody class="divide-y divide-slate-200 dark:divide-slate-800">
                        {#each history as item}
                            <tr class="hover:bg-slate-50 dark:hover:bg-white/5 transition-colors">
                                <td class="px-6 py-4 font-mono font-bold text-primary">{item.id}</td>
                                <td class="px-6 py-4 font-medium">{item.route}</td>
                                <td class="px-6 py-4 text-slate-500">{item.driver}</td>
                                <td class="px-6 py-4 text-slate-500">{item.date}</td>
                                <td class="px-6 py-4 font-bold">{item.total}</td>
                                <td class="px-6 py-4">
                                    <div class="flex items-center gap-1 text-yellow-500">
                                        <span class="material-symbols-outlined text-sm">star</span>
                                        <span class="text-xs font-bold">{item.rating}</span>
                                    </div>
                                </td>
                            </tr>
                        {/each}
                    </tbody>
                </table>
            </div>
        </div>
    </main>
</div>
