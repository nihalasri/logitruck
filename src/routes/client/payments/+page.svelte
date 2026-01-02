<script>
  import '../../layout.css';
  import ClientSidebar from '$lib/components/ClientSidebar.svelte';

  let payments = [
    { id: 'PAY-001', amount: '$1,200', method: 'Visa **** 4242', status: 'Completed', date: 'Oct 24, 2026' },
    { id: 'PAY-002', amount: '$450', method: 'Bank Transfer', status: 'Pending', date: 'Oct 25, 2026' },
    { id: 'PAY-003', amount: '$300', method: 'Visa **** 4242', status: 'Completed', date: 'Oct 05, 2026' }
  ];
</script>

<div class="bg-background-light dark:bg-background-dark text-slate-900 dark:text-white font-display antialiased flex h-screen overflow-hidden">
    <ClientSidebar activePage="payments" />

    <main class="flex-1 flex flex-col overflow-hidden">
        <header class="h-16 border-b border-slate-200 dark:border-slate-800 flex items-center px-8 bg-white dark:bg-background-dark">
            <h2 class="text-xl font-bold">Payments & Invoices</h2>
        </header>

        <div class="flex-1 overflow-y-auto p-8">
            <div class="grid grid-cols-1 md:grid-cols-3 gap-6 mb-8">
                <div class="bg-primary/10 border border-primary/20 p-6 rounded-xl">
                    <p class="text-sm text-slate-500 mb-1">Total Spent</p>
                    <p class="text-2xl font-black">$12,450</p>
                </div>
                <div class="bg-emerald-500/10 border border-emerald-500/20 p-6 rounded-xl">
                    <p class="text-sm text-slate-500 mb-1">Active Balance</p>
                    <p class="text-2xl font-black">$0.00</p>
                </div>
                <div class="bg-blue-500/10 border border-blue-500/20 p-6 rounded-xl">
                    <p class="text-sm text-slate-500 mb-1">Pending Invoices</p>
                    <p class="text-2xl font-black">1</p>
                </div>
            </div>

            <div class="bg-white dark:bg-[#192233] rounded-xl border border-slate-200 dark:border-slate-800 overflow-hidden">
                <table class="w-full text-left">
                    <thead class="bg-slate-50 dark:bg-slate-800/50 text-xs font-bold uppercase text-slate-500">
                        <tr>
                            <th class="px-6 py-4">Transaction ID</th>
                            <th class="px-6 py-4">Amount</th>
                            <th class="px-6 py-4">Method</th>
                            <th class="px-6 py-4">Status</th>
                            <th class="px-6 py-4 text-right">Invoice</th>
                        </tr>
                    </thead>
                    <tbody class="divide-y divide-slate-200 dark:divide-slate-800">
                        {#each payments as pay}
                            <tr class="hover:bg-slate-50 dark:hover:bg-white/5 transition-colors group">
                                <td class="px-6 py-4">
                                    <div class="flex flex-col">
                                        <span class="font-mono font-bold text-primary">{pay.id}</span>
                                        <span class="text-[10px] text-slate-500">{pay.date}</span>
                                    </div>
                                </td>
                                <td class="px-6 py-4 font-bold">{pay.amount}</td>
                                <td class="px-6 py-4 text-slate-500">{pay.method}</td>
                                <td class="px-6 py-4">
                                    <span class="px-2 py-1 rounded-full text-xs font-bold 
                                        {pay.status === 'Completed' ? 'bg-emerald-100 text-emerald-700' : 'bg-blue-100 text-blue-700'}">
                                        {pay.status}
                                    </span>
                                </td>
                                <td class="px-6 py-4 text-right">
                                    <button class="text-primary hover:text-white transition-colors">
                                        <span class="material-symbols-outlined">download</span>
                                    </button>
                                </td>
                            </tr>
                        {/each}
                    </tbody>
                </table>
            </div>

            <!-- Subscription Plans (For Porter Features) -->
            <div class="mt-8">
                <h3 class="text-lg font-bold mb-4">Subscription Plans</h3>
                <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                    <div class="p-6 rounded-xl border border-slate-200 dark:border-slate-800 bg-white dark:bg-[#192233]">
                        <div class="flex justify-between items-start mb-4">
                            <div>
                                <h4 class="font-bold">Standard Business</h4>
                                <p class="text-xs text-slate-500 italic">Current Plan</p>
                            </div>
                            <span class="bg-primary/20 text-primary text-xs font-bold px-2 py-1 rounded">Active</span>
                        </div>
                        <ul class="text-sm space-y-2 text-slate-500 mb-6">
                            <li class="flex items-center gap-2"><span class="material-symbols-outlined text-xs text-emerald-500">check</span> 5% discount on all loads</li>
                            <li class="flex items-center gap-2"><span class="material-symbols-outlined text-xs text-emerald-500">check</span> Priority matching</li>
                        </ul>
                    </div>
                    <div class="p-6 rounded-xl border border-dashed border-primary/50 bg-primary/5">
                        <h4 class="font-bold">Enterprise API Logistics</h4>
                        <p class="text-sm text-slate-500 mb-4">For large-scale operations with API integration.</p>
                        <button class="w-full bg-primary text-white py-2 rounded-lg font-bold text-sm">Upgrade for $99/mo</button>
                    </div>
                </div>
            </div>
        </div>
    </main>
</div>
