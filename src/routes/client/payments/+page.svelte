<script>
    import { supabase } from '$lib/supabase';
    import { onMount } from 'svelte';
    import ClientSidebar from '$lib/components/ClientSidebar.svelte';
    import { fade, fly } from 'svelte/transition';
    import { walletBalance, formatCurrency } from '$lib/stores/wallet';

    let payments = $state([]);
    let showAddFundsModal = $state(false);
    let addAmount = $state('');
    let isProcessing = $state(false);
    let promoCode = $state('');
    let splitPaymentActive = $state(false);

    onMount(async () => {
        await fetchTransactions();
    });

    async function fetchTransactions() {
        const { data: { user } } = await supabase.auth.getUser();
        if (!user) return;

        const { data, error } = await supabase
            .from('transactions')
            .select('*')
            .eq('user_id', user.id)
            .order('created_at', { ascending: false });

        if (data) {
            payments = data.map(t => ({
                id: `#TRX-${t.id.slice(0, 8).toUpperCase()}`,
                amount: formatCurrency(t.amount),
                method: t.description || 'Wallet',
                status: 'Completed', // Simplified
                date: new Date(t.created_at).toLocaleDateString()
            }));
            
            // Calculate balance locally if needed, or rely on store
        }
    }

    async function handleAddFunds() {
        if (!addAmount || isNaN(addAmount) || Number(addAmount) <= 0) return;
        isProcessing = true;
        
        try {
            const { data: { user } } = await supabase.auth.getUser();
             if (!user) throw new Error("No user");

            const amount = Number(addAmount);
            
            // Insert Transaction
            const { error } = await supabase.from('transactions').insert({
                user_id: user.id,
                amount: amount,
                type: 'deposit',
                description: 'Add Funds via Card'
            });

            if (error) throw error;

            $walletBalance += amount;
            await fetchTransactions(); // Refresh list
            
            addAmount = '';
            showAddFundsModal = false;
        } catch (err) {
            console.error("Add funds failed", err);
            alert("Failed to add funds");
        } finally {
            isProcessing = false;
        }
    }

    function exportData() {
        const headers = ["ID", "Amount", "Method", "Status", "Date"];
        const rows = payments.map(p => [p.id, p.amount, p.method, p.status, p.date]);
        const csvContent = "data:text/csv;charset=utf-8," + 
            [headers.join(","), ...rows.map(e => e.join(","))].join("\n");
        
        const encodedUri = encodeURI(csvContent);
        const link = document.createElement("a");
        link.setAttribute("href", encodedUri);
        link.setAttribute("download", "logitruck_transactions.csv");
        document.body.appendChild(link);
        link.click();
        document.body.removeChild(link);
    }

    function applyPromo() {
        if(promoCode.trim()) {
            alert(`Promo code '${promoCode}' applied! discount will be reflected on next invoice.`);
            promoCode = '';
        }
    }
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
            <button on:click={exportData} class="bg-slate-900 text-white px-6 py-2.5 rounded-xl text-sm font-black shadow-xl shadow-slate-200 micro-interaction hover:bg-slate-800 transition-colors">
                Export Data
            </button>
        </header>

        <div class="flex-1 overflow-y-auto p-8 bg-[radial-gradient(35%_35%_at_50%_0%,rgba(29,78,216,0.02)_0%,transparent_100%)]">
            <!-- Stats Summary -->
            <div class="grid grid-cols-1 md:grid-cols-4 gap-6 mb-10">
                <!-- Aggregate Outflow -->
                <div class="premium-card p-6 flex flex-col justify-between relative overflow-hidden group hover:shadow-lg transition-all bg-white min-h-[160px]">
                    <div class="absolute top-0 right-0 p-4 opacity-5 group-hover:opacity-10 transition-opacity">
                        <span class="material-symbols-outlined text-6xl">payments</span>
                    </div>
                    <div>
                         <p class="text-[10px] font-black uppercase tracking-widest text-slate-500 mb-2">Aggregate Outflow</p>
                         <h3 class="text-3xl font-black text-slate-900 tracking-tight">$12,450.00</h3>
                    </div>
                     <div class="mt-auto flex items-center gap-2 text-[10px] font-bold text-slate-400">
                        <span class="text-emerald-500 bg-emerald-50 px-1.5 py-0.5 rounded flex items-center gap-0.5"><span class="material-symbols-outlined text-[12px]">trending_down</span> -2.4%</span> <span class="tracking-wide uppercase">vs last month</span>
                    </div>
                </div>

                <!-- Wallet Balance (Replaces Corporate Discount) -->
                <div class="premium-card p-6 flex flex-col justify-between bg-gradient-to-br from-blue-600 to-indigo-700 text-white relative overflow-hidden shadow-xl shadow-blue-900/10 min-h-[160px] group">
                    <div class="absolute -right-4 -bottom-4 opacity-20 rotate-12 group-hover:scale-110 transition-transform duration-700">
                        <span class="material-symbols-outlined text-8xl">account_balance_wallet</span>
                    </div>
                    <div class="relative z-10 flex flex-col h-full justify-between">
                         <div>
                            <p class="text-[10px] font-black uppercase tracking-widest text-blue-100 mb-2">Available Balance</p>
                            <h3 class="text-3xl font-black tracking-tight text-white">{formatCurrency($walletBalance)}</h3>

                         </div>
                         <button on:click={() => showAddFundsModal = true} class="w-fit mt-auto bg-white/20 hover:bg-white/30 text-white px-4 py-2 rounded-lg text-xs font-black uppercase tracking-wider backdrop-blur-sm border border-white/10 micro-interaction transition-all">
                             + Add Funds
                         </button>
                    </div>
                </div>

                <!-- Reward Credits -->
                <div class="premium-card p-6 flex flex-col justify-between bg-gradient-to-br from-emerald-500 to-teal-600 text-white relative overflow-hidden shadow-xl shadow-emerald-900/10 min-h-[160px] group">
                    <div class="absolute -right-4 -bottom-4 opacity-20 rotate-12 group-hover:scale-110 transition-transform duration-700">
                        <span class="material-symbols-outlined text-8xl">loyalty</span>
                    </div>
                     <div class="relative z-10">
                         <p class="text-[10px] font-black uppercase tracking-widest text-emerald-100 mb-2">Reward Credits</p>
                         <h3 class="text-3xl font-black tracking-tight text-white">$125.50</h3>
                    </div>
                    <div class="relative z-10 mt-auto flex items-center gap-2 text-[10px] font-bold text-emerald-100">
                        <span class="bg-white/20 px-2.5 py-1 rounded-md text-white backdrop-blur-sm border border-white/10 uppercase tracking-widest">Redeemable</span>
                    </div>
                </div>

                <!-- Active Promo -->
                <div class="premium-card p-6 bg-slate-900 text-white flex flex-col justify-between relative overflow-hidden min-h-[160px]">
                    <div class="absolute -right-4 -top-4 opacity-[0.1]">
                        <span class="material-symbols-outlined text-6xl">confirmation_number</span>
                    </div>
                    <div class="relative z-10 w-full h-full flex flex-col justify-between">
                        <p class="text-[10px] font-black uppercase tracking-widest text-slate-400 mb-2">Active Promo</p>
                        <div class="flex items-center gap-2">
                            <input type="text" bind:value={promoCode} placeholder="CODE" class="w-full bg-slate-800 border border-slate-700 rounded-xl px-4 py-3 text-xs font-black uppercase placeholder:text-slate-600 focus:outline-none focus:ring-2 focus:ring-primary transition-all text-white"/>
                            <button on:click={applyPromo} class="bg-primary hover:bg-primary-hover px-4 py-3 rounded-xl text-white transition-colors flex items-center justify-center shadow-lg shadow-primary/25">
                                 <span class="material-symbols-outlined text-[18px]">check</span>
                            </button>
                        </div>
                        <p class="text-[9px] font-bold text-slate-500 mt-2">Applies to next invoice</p>
                    </div>
                </div>
            </div>

            <!-- Transactions Table -->
            <div class="premium-card overflow-hidden mb-10">
                <table class="w-full text-left">
                    <thead class="bg-slate-50 border-b border-slate-100">
                        <tr>
                            <th class="px-8 py-5 text-[10px] font-black uppercase tracking-widest text-slate-400">Reference ID</th>
                            <th class="px-8 py-5 text-[10px] font-black uppercase tracking-widest text-slate-400">Amount</th>
                            <th class="px-8 py-5 text-[10px] font-black uppercase tracking-widest text-slate-400">Method</th>
                            <th class="px-8 py-5 text-[10px] font-black uppercase tracking-widest text-slate-400">Status</th>
                            <th class="px-8 py-5 text-right text-[10px] font-black uppercase tracking-widest text-slate-400">Invoice</th>
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

            <!-- Payment Methods Management -->
            <div class="space-y-6 pb-12">
                <div class="flex items-center justify-between">
                    <h3 class="text-xl font-black tracking-tight text-slate-900">Payment Methods</h3>
                    <button class="text-primary text-xs font-black uppercase tracking-widest hover:text-primary-hover transition-colors flex items-center gap-1.5 border border-primary/20 px-3 py-1.5 rounded-lg hover:bg-primary/5">
                        <span class="material-symbols-outlined text-[16px]">add</span>
                        Add New
                    </button>
                </div>
                
                <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
                    <!-- Visa Card -->
                    <div class="premium-card p-6 bg-white border border-slate-200 text-slate-900 relative overflow-hidden group">
                         <div class="absolute -right-8 -top-8 p-6 opacity-[0.05] group-hover:opacity-[0.1] transition-opacity">
                            <span class="material-symbols-outlined text-[140px] text-slate-900">credit_card</span>
                        </div>
                        <div class="relative z-10 flex flex-col h-full justify-between min-h-[160px]">
                            <div class="flex justify-between items-start">
                                <span class="bg-slate-900 text-white px-2 py-1 rounded text-[10px] font-black uppercase tracking-widest">Default</span>
                                <span class="material-symbols-outlined text-2xl">contactless</span>
                            </div>
                            <div>
                                <p class="font-mono text-xl tracking-widest mb-1 text-slate-900">**** **** **** 4242</p>
                                <div class="flex justify-between items-end">
                                    <div class="flex flex-col">
                                        <span class="text-[9px] text-slate-400 uppercase tracking-widest">Card Holder</span>
                                        <span class="text-xs font-bold text-slate-900">NATHAN WRIGHT</span>
                                    </div>
                                    <div class="flex flex-col items-end">
                                        <span class="text-[9px] text-slate-400 uppercase tracking-widest">Expires</span>
                                        <span class="text-xs font-bold text-slate-900">09/28</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Mastercard Card -->
                    <div class="premium-card p-6 bg-white border border-slate-100 relative overflow-hidden group hover:border-primary/20 transition-all">
                        <div class="relative z-10 flex flex-col h-full justify-between min-h-[160px]">
                            <div class="flex justify-between items-start">
                                <div class="size-8 rounded bg-red-500/10 flex items-center justify-center">
                                    <span class="material-symbols-outlined text-red-500">credit_card</span>
                                </div>
                                <button class="text-slate-400 hover:text-red-500 transition-colors">
                                    <span class="material-symbols-outlined text-[20px]">delete</span>
                                </button>
                            </div>
                            <div>
                                <p class="font-mono text-xl tracking-widest mb-1 text-slate-700">**** **** **** 8899</p>
                                <div class="flex justify-between items-end">
                                    <div class="flex flex-col">
                                        <span class="text-[9px] text-slate-400 uppercase tracking-widest">Card Holder</span>
                                        <span class="text-xs font-bold text-slate-900">NATHAN WRIGHT</span>
                                    </div>
                                    <div class="flex flex-col items-end">
                                        <span class="text-[9px] text-slate-400 uppercase tracking-widest">Expires</span>
                                        <span class="text-xs font-bold text-slate-900">01/27</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Add New Placeholder -->
                    <button class="premium-card p-6 border-2 border-dashed border-slate-200 bg-slate-50/50 flex flex-col items-center justify-center gap-3 text-slate-400 hover:border-primary/50 hover:bg-primary/5 hover:text-primary transition-all min-h-[160px]">
                        <span class="material-symbols-outlined text-4xl">add_circle</span>
                        <span class="text-xs font-black uppercase tracking-widest">Link New Method</span>
                    </button>
                </div>
            </div>
        </div>
    </main>

    <!-- Add Funds Modal -->
    {#if showAddFundsModal}
        <div class="fixed inset-0 z-50 flex items-center justify-center p-4" transition:fade>
            <button class="absolute inset-0 bg-slate-900/60 backdrop-blur-sm cursor-default w-full h-full border-none" on:click={() => showAddFundsModal = false} aria-label="Close modal"></button>
            <div class="bg-white w-full max-w-md rounded-3xl p-8 relative z-10 shadow-2xl flex flex-col items-center" transition:fly={{ y: 20 }}>
                <div class="size-16 rounded-2xl bg-primary/10 flex items-center justify-center mb-6">
                    <span class="material-symbols-outlined text-3xl text-primary">add_card</span>
                </div>
                <h3 class="text-2xl font-black text-slate-900 mb-2">Add Funds</h3>
                <p class="text-slate-500 text-sm text-center mb-8">Securely load your wallet using your saved payment method.</p>
                
                <div class="w-full space-y-4">
                    <div>
                        <label for="add-amount" class="text-[10px] font-black uppercase tracking-widest text-slate-400 ml-1 mb-2 block">Amount ($)</label>
                        <input 
                            id="add-amount"
                            type="number" 
                            bind:value={addAmount} 
                            placeholder="Enter amount (e.g. 500)" 
                            class="w-full bg-slate-50 border border-slate-200 rounded-xl px-4 py-4 text-lg font-bold text-slate-900 focus:outline-none focus:ring-2 focus:ring-primary/20 focus:border-primary transition-all text-center"
                        />
                    </div>
                </div>

                <div class="w-full grid grid-cols-2 gap-3 mt-8">
                    <button on:click={() => showAddFundsModal = false} class="py-4 rounded-xl text-slate-500 font-bold text-sm bg-slate-100 hover:bg-slate-200 transition-colors">Cancel</button>
                    <button on:click={handleAddFunds} disabled={isProcessing} class="py-4 rounded-xl bg-primary text-white font-black text-sm hover:bg-primary-hover shadow-lg shadow-primary/20 transition-all flex items-center justify-center gap-2">
                        {#if isProcessing}
                            <div class="size-4 rounded-full border-2 border-white/30 border-t-white animate-spin"></div>
                            Processing...
                        {:else}
                            Confirm Interest
                        {/if}
                    </button>
                </div>
            </div>
        </div>
    {/if}
</div>
