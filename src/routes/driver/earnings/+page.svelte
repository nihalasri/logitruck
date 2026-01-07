<script>
  import DriverSidebar from '$lib/components/DriverSidebar.svelte';

  const transactions = [
    { id: 'TX-9901', date: 'Jan 12, 2024', amount: '$4,200', type: 'Load Completion', status: 'Deposited', loadId: 'L-8941' },
    { id: 'TX-9844', date: 'Jan 10, 2024', amount: '$1,850', type: 'Load Completion', status: 'Deposited', loadId: 'L-8830' },
    { id: 'TX-9520', date: 'Jan 08, 2024', amount: '$150', type: 'Fuel Reimbursement', status: 'Processing', loadId: 'L-8722' },
    { id: 'TX-9411', date: 'Jan 05, 2024', amount: '$5,900', type: 'Load Completion', status: 'Deposited', loadId: 'L-8615' },
    { id: 'TX-9200', date: 'Jan 01, 2024', amount: '$500', type: 'Safety Bonus', status: 'Deposited', loadId: 'N/A' },
  ];
</script>

<div class="bg-bg-main text-slate-900 font-display min-h-screen flex selection:bg-primary/10">
    <DriverSidebar activePage="earnings" />

    <main class="flex-1 flex flex-col h-screen overflow-hidden relative">
        <header class="flex items-center justify-between glass border-b border-slate-200 px-8 py-5 h-20 shrink-0 z-20">
            <div class="flex items-center gap-4">
                <a href="/driver/dashboard" class="p-2 rounded-xl text-slate-400 hover:text-primary transition-all micro-interaction">
                    <span class="material-symbols-outlined">arrow_back</span>
                </a>
                <div class="w-px h-6 bg-slate-200"></div>
                <div>
                    <h2 class="text-2xl font-black text-slate-900 tracking-tight leading-none">Capital Stream</h2>
                    <p class="text-[10px] font-black text-slate-400 uppercase tracking-widest mt-1">Financial Yield & Settlements</p>
                </div>
            </div>
            <div class="flex items-center gap-4">
                <button class="bg-slate-900 text-white px-6 py-2.5 rounded-xl text-xs font-black uppercase tracking-widest transition-all shadow-lg shadow-slate-200 micro-interaction">
                    Withdraw Capital
                </button>
            </div>
        </header>

        <div class="flex-1 overflow-y-auto p-8 bg-[radial-gradient(40%_40%_at_50%_0%,rgba(29,78,216,0.02)_0%,transparent_100%)]">
            <div class="max-w-6xl mx-auto">
                <div class="grid grid-cols-1 lg:grid-cols-12 gap-8 mb-8">
                    <div class="lg:col-span-8">
                        <div class="premium-card p-8 bg-slate-900 text-white relative overflow-hidden mb-8">
                            <div class="absolute -right-20 -top-20 size-80 bg-primary/20 blur-[100px] rounded-full"></div>
                            <div class="relative z-10">
                                <p class="text-[10px] font-black text-slate-400 uppercase tracking-widest mb-2">Available Balance</p>
                                <h3 class="text-5xl font-black mb-6 tracking-tighter tabular-nums">$12,842.50</h3>
                                <div class="flex gap-8">
                                    <div>
                                        <p class="text-[10px] font-black text-slate-400 uppercase tracking-widest mb-1">In Escrow</p>
                                        <p class="text-xl font-black">$4,500.00</p>
                                    </div>
                                    <div class="w-px h-10 bg-slate-800"></div>
                                    <div>
                                        <p class="text-[10px] font-black text-slate-400 uppercase tracking-widest mb-1">Month to Date</p>
                                        <p class="text-xl font-black text-emerald-400">$8,920.15</p>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="premium-card overflow-hidden">
                            <div class="p-6 border-b border-slate-100 bg-slate-50/50">
                                <h3 class="text-sm font-black text-slate-900 uppercase tracking-widest">Transaction Ledger</h3>
                            </div>
                            <div class="divide-y divide-slate-100">
                                {#each transactions as tx}
                                    <div class="p-6 hover:bg-slate-50/50 transition-colors flex items-center justify-between">
                                        <div class="flex items-center gap-4">
                                            <div class="size-10 rounded-xl bg-slate-100 flex items-center justify-center text-slate-400">
                                                <span class="material-symbols-outlined text-[20px]">{tx.type.includes('Fuel') ? 'local_gas_station' : 'payments'}</span>
                                            </div>
                                            <div>
                                                <p class="text-sm font-black text-slate-900">{tx.type}</p>
                                                <p class="text-[10px] font-bold text-slate-400 uppercase tracking-tight">{tx.date} • ID: {tx.id}</p>
                                            </div>
                                        </div>
                                        <div class="text-right">
                                            <p class="text-sm font-black text-slate-900">{tx.amount}</p>
                                            <span class="text-[9px] font-black uppercase tracking-widest {tx.status === 'Deposited' ? 'text-emerald-500' : 'text-blue-500'}">{tx.status}</span>
                                        </div>
                                    </div>
                                {/each}
                            </div>
                        </div>
                    </div>

                    <div class="lg:col-span-4 space-y-8">
                        <div class="premium-card p-8">
                            <h4 class="text-[10px] font-black text-slate-500 uppercase tracking-wider mb-6">Revenue Velocity</h4>
                            <div class="space-y-6">
                                {#each [
                                    { label: 'Freight Yield', value: 85, color: 'bg-primary' },
                                    { label: 'Incentives', value: 12, color: 'bg-emerald-500' },
                                    { label: 'Reimbursements', value: 3, color: 'bg-slate-400' }
                                ] as metric}
                                    <div>
                                        <div class="flex justify-between items-end mb-2">
                                            <span class="text-[10px] font-black text-slate-600 uppercase tracking-widest">{metric.label}</span>
                                            <span class="text-xs font-black text-slate-900">{metric.value}%</span>
                                        </div>
                                        <div class="h-1.5 w-full bg-slate-100 rounded-full overflow-hidden">
                                            <div class="h-full {metric.color} rounded-full" style="width: {metric.value}%"></div>
                                        </div>
                                    </div>
                                {/each}
                            </div>
                        </div>

                        <div class="premium-card p-8 bg-blue-50/50 border-primary/10">
                            <h4 class="text-[10px] font-black text-primary uppercase tracking-wider mb-4">Tax Optimization</h4>
                            <p class="text-xs font-bold text-slate-600 leading-relaxed mb-6">
                                Your estimated tax liability for Q1 is <span class="text-slate-900 font-black">$2,140</span>. Save 15% by allocating to your 401k now.
                            </p>
                            <button class="w-full py-3 rounded-xl bg-white border border-primary/20 text-primary text-[10px] font-black uppercase tracking-widest hover:bg-primary hover:text-white transition-all">
                                View Tax Center
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
</div>
