<script>

  import ClientSidebar from '$lib/components/ClientSidebar.svelte';
  import { loadsStore } from '$lib/stores/loads.js';

  let loads = $derived($loadsStore);
</script>

<div class="bg-bg-main text-slate-900 font-display min-h-screen flex selection:bg-primary/10">
    <ClientSidebar activePage="my loads" />

    <!-- Main Content -->
    <main class="flex-1 flex flex-col h-screen overflow-hidden relative">
        <!-- Glassmorphism Header -->
        <header class="flex items-center justify-between glass border-b border-slate-200 px-8 py-5 h-20 shrink-0 z-20">
            <div>
                <h2 class="text-2xl font-black text-slate-900 tracking-tight">My Shipments</h2>
                <p class="text-[10px] font-black text-slate-400 uppercase tracking-widest mt-1">Active shipments: {loads.length}</p>
            </div>
            <a href="/client/post-load" class="group relative flex items-center justify-center gap-3 bg-primary text-white px-6 py-3 rounded-xl font-bold transition-all shadow-xl shadow-primary/20 hover:scale-105 active:scale-95">
                <span class="material-symbols-outlined text-[20px]">add_circle</span>
                New Shipment
            </a>
        </header>

        <div class="flex-1 overflow-y-auto p-8 bg-[radial-gradient(35%_35%_at_50%_0%,rgba(29,78,216,0.02)_0%,transparent_100%)]">
            <div class="premium-card overflow-hidden">
                <table class="w-full text-left border-collapse">
                    <thead class="bg-slate-50 border-b border-slate-100">
                        <tr>
                            <th class="px-8 py-5 text-[10px] font-black uppercase tracking-widest text-slate-400">ID</th>
                            <th class="px-8 py-5 text-[10px] font-black uppercase tracking-widest text-slate-400">Route</th>
                            <th class="px-8 py-5 text-[10px] font-black uppercase tracking-widest text-slate-400">Driver</th>
                            <th class="px-8 py-5 text-[10px] font-black uppercase tracking-widest text-slate-400">Status</th>
                            <th class="px-8 py-5 text-right text-[10px] font-black uppercase tracking-widest text-slate-400">Manage</th>
                        </tr>
                    </thead>
                    <tbody class="divide-y divide-slate-100">
                        {#each loads as load}
                            <tr class="hover:bg-slate-50/50 transition-all cursor-pointer group">
                                <td class="px-8 py-6">
                                    <div class="flex flex-col">
                                        <span class="font-black text-primary tracking-tighter">{load.id}</span>
                                        <span class="text-[10px] font-bold text-slate-400">{load.date}</span>
                                    </div>
                                </td>
                                <td class="px-8 py-6">
                                    <div class="flex flex-col">
                                        <span class="text-xs font-black text-slate-900">{load.route}</span>
                                        <span class="text-[10px] font-bold text-slate-400 uppercase tracking-tighter">{load.cargo}</span>
                                    </div>
                                </td>
                                <td class="px-8 py-6">
                                    <div class="flex items-center gap-3">
                                        <div class="size-9 rounded-xl bg-slate-100 flex items-center justify-center text-slate-400 group-hover:bg-primary/10 group-hover:text-primary transition-colors">
                                            <span class="material-symbols-outlined text-[20px]">person</span>
                                        </div>
                                        <div class="flex flex-col">
                                            <span class="text-xs font-black text-slate-900">Mike R.</span>
                                            <span class="text-[9px] font-bold text-slate-400 uppercase tracking-widest">+1 (555) 0012</span>
                                        </div>
                                    </div>
                                </td>
                                <td class="px-8 py-6">
                                    <div class="flex flex-col gap-1.5">
                                        <span class="inline-flex items-center gap-2 px-3 py-1 rounded-full text-[10px] font-black uppercase tracking-wider w-fit {load.status === 'Delivered' ? 'bg-emerald-50 text-emerald-600' : load.status === 'In Transit' ? 'bg-primary/10 text-primary' : 'bg-slate-100 text-slate-400'}">
                                            {#if load.status === 'In Transit'}<span class="size-1.5 rounded-full bg-primary animate-pulse"></span>{/if}
                                            {load.status}
                                        </span>
                                        {#if load.status === 'In Transit'}
                                            <a href="/client/tracking" class="text-[9px] font-black text-primary uppercase tracking-widest hover:underline flex items-center gap-1">
                                                <span class="material-symbols-outlined text-[14px]">share_location</span>
                                                Track Now
                                            </a>
                                        {/if}
                                    </div>
                                </td>
                                <td class="px-8 py-6 text-right">
                                    <button class="p-2.5 rounded-xl text-slate-300 hover:text-primary hover:bg-primary/5 transition-all micro-interaction">
                                        <span class="material-symbols-outlined text-[20px]">more_horiz</span>
                                    </button>
                                </td>
                            </tr>
                        {/each}
                    </tbody>
                </table>
            </div>
        </div>
    </main>
</div>
