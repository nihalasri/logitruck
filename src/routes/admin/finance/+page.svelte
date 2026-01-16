<script>
    let transactions = [
        { id: 'TRX-5592', type: 'Payout', amount: '$4,200.00', user: 'Robert Brown', role: 'Driver', date: 'Oct 24, 2026', status: 'Completed' },
        { id: 'TRX-5591', type: 'Payment', amount: '$1,250.00', user: 'Acme Corp', role: 'Client', date: 'Oct 24, 2026', status: 'Completed' },
        { id: 'TRX-5590', type: 'Refund', amount: '$150.00', user: 'LogiTech Inc', role: 'Client', date: 'Oct 23, 2026', status: 'Processing' },
        { id: 'TRX-5589', type: 'Payout', amount: '$3,800.00', user: 'Sarah Connor', role: 'Driver', date: 'Oct 23, 2026', status: 'Completed' },
        { id: 'TRX-5588', type: 'Fee', amount: '$45.00', user: 'Platform', role: 'System', date: 'Oct 22, 2026', status: 'Completed' }
    ];

    let query = $state('');

    let filteredTransactions = $derived(transactions.filter(t => 
        t.id.toLowerCase().includes(query.toLowerCase()) || 
        t.user.toLowerCase().includes(query.toLowerCase())
    ));
</script>

<div class="p-8 max-w-[1600px] mx-auto space-y-8">
    
    <!-- Header -->
    <header class="flex items-center justify-between">
        <div>
            <h1 class="text-3xl font-black text-slate-900 tracking-tight">Financial Ledger</h1>
            <p class="text-slate-500 font-medium">Platform revenue and payouts audit</p>
        </div>
        <div class="flex gap-4">
            <button class="flex items-center gap-2 px-4 py-2 bg-white border border-slate-200 rounded-lg text-sm font-bold text-slate-600 hover:bg-slate-50 shadow-sm">
                <span class="material-symbols-outlined text-[18px]">download</span>
                Export CSV
            </button>
        </div>
    </header>

    <!-- Finance Stats -->
     <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
        <div class="bg-white p-6 rounded-2xl border border-slate-100 shadow-sm">
            <p class="text-xs font-black text-slate-400 uppercase tracking-widest mb-1">Total Volume</p>
            <h3 class="text-3xl font-black text-slate-900">$1.2M</h3>
        </div>
        <div class="bg-white p-6 rounded-2xl border border-slate-100 shadow-sm">
            <p class="text-xs font-black text-emerald-500 uppercase tracking-widest mb-1">Net Revenue</p>
            <h3 class="text-3xl font-black text-emerald-600">$124,500</h3>
        </div>
        <div class="bg-white p-6 rounded-2xl border border-slate-100 shadow-sm">
            <p class="text-xs font-black text-indigo-500 uppercase tracking-widest mb-1">Pending Payouts</p>
            <h3 class="text-3xl font-black text-slate-900">$45,200</h3>
        </div>
    </div>

    <!-- Transactions Table -->
    <div class="bg-white rounded-2xl border border-slate-100 shadow-sm overflow-hidden">
        <div class="p-4 border-b border-slate-100 flex items-center gap-4">
             <div class="relative w-full max-w-md">
                <span class="absolute left-3 top-1/2 -translate-y-1/2 material-symbols-outlined text-slate-400">search</span>
                <input bind:value={query} type="text" placeholder="Search transaction ID or user..." class="pl-10 pr-4 py-2 border border-slate-200 rounded-lg text-sm font-bold focus:outline-none focus:ring-2 focus:ring-indigo-500 w-full" />
            </div>
        </div>
        <table class="w-full text-left border-collapse">
            <thead class="bg-slate-50 border-b border-slate-100">
                <tr>
                    <th class="px-6 py-4 text-[10px] font-black uppercase tracking-widest text-slate-500">Transaction ID</th>
                    <th class="px-6 py-4 text-[10px] font-black uppercase tracking-widest text-slate-500">Type</th>
                    <th class="px-6 py-4 text-[10px] font-black uppercase tracking-widest text-slate-500">User / Entity</th>
                    <th class="px-6 py-4 text-[10px] font-black uppercase tracking-widest text-slate-500">Amount</th>
                    <th class="px-6 py-4 text-[10px] font-black uppercase tracking-widest text-slate-500">Date</th>
                    <th class="px-6 py-4 text-[10px] font-black uppercase tracking-widest text-slate-500 text-right">Status</th>
                </tr>
            </thead>
            <tbody class="divide-y divide-slate-100">
                {#each filteredTransactions as trx}
                    <tr class="hover:bg-slate-50/50 transition-colors group">
                        <td class="px-6 py-4 font-mono text-xs font-bold text-slate-600">
                            {trx.id}
                        </td>
                         <td class="px-6 py-4">
                             <div class="flex items-center gap-2">
                                <span class="material-symbols-outlined text-[18px] text-slate-400">
                                    {trx.type === 'Payout' ? 'arrow_outward' : 
                                     trx.type === 'Payment' ? 'arrow_downward' : 'sync_alt'}
                                </span>
                                <span class="text-xs font-bold text-slate-700">{trx.type}</span>
                             </div>
                        </td>
                        <td class="px-6 py-4">
                            <div>
                                <p class="text-sm font-bold text-slate-900 leading-none">{trx.user}</p>
                                <p class="text-[10px] font-bold text-slate-400 uppercase tracking-widest mt-1">{trx.role}</p>
                            </div>
                        </td>
                        <td class="px-6 py-4">
                            <span class="text-sm font-black {trx.type === 'Payout' ? 'text-slate-900' : 'text-emerald-600'}">
                                {trx.type === 'Payout' ? '-' : '+'}{trx.amount}
                            </span>
                        </td>
                         <td class="px-6 py-4">
                            <span class="text-xs font-medium text-slate-500 font-mono">{trx.date}</span>
                        </td>
                        <td class="px-6 py-4 text-right">
                            <span class="inline-flex items-center gap-1.5 px-2.5 py-1 rounded-full text-[10px] font-black uppercase tracking-wider
                                {trx.status === 'Completed' ? 'bg-emerald-50 text-emerald-600' : 
                                 trx.status === 'Processing' ? 'bg-blue-50 text-blue-600' : 'bg-red-50 text-red-600'}">
                                {trx.status}
                            </span>
                        </td>
                    </tr>
                {/each}
            </tbody>
        </table>
    </div>
</div>
