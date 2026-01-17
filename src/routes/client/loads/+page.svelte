<script>

  import ClientSidebar from '$lib/components/ClientSidebar.svelte';
  import { loadsStore } from '$lib/stores/loads.js';

  let loads = $derived($loadsStore);
  let activeMenuId = $state(null);

  function toggleMenu(id) {
      if (activeMenuId === id) {
          activeMenuId = null;
      } else {
          activeMenuId = id;
      }
  }

  function handleMenuAction(action, load) {
      console.log(`Action ${action} on load ${load.id}`);
      activeMenuId = null;
      if (action === 'track' && load.status === 'In Transit') {
          // Navigate logic or handled by link
      }
  }

  function handleBackdropClick() {
      activeMenuId = null;
  }
</script>

<!-- Backdrop for closing menus -->
{#if activeMenuId}
    <div class="fixed inset-0 z-30 cursor-default" onclick={handleBackdropClick} role="button" tabindex="0" onkeydown={e => e.key === 'Escape' && handleBackdropClick()}></div>
{/if}

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
            <div class="premium-card overflow-visible">
                <table class="w-full text-left border-collapse">
                    <thead class="bg-slate-50 border-b border-slate-100">
                        <tr>
                            <th class="px-8 py-5 text-[10px] font-black uppercase tracking-widest text-slate-500">ID</th>
                            <th class="px-8 py-5 text-[10px] font-black uppercase tracking-widest text-slate-500">Route</th>
                            <th class="px-8 py-5 text-[10px] font-black uppercase tracking-widest text-slate-500">Driver</th>
                            <th class="px-8 py-5 text-[10px] font-black uppercase tracking-widest text-slate-500">Status</th>
                            <th class="px-8 py-5 text-right text-[10px] font-black uppercase tracking-widest text-slate-500">Manage</th>
                        </tr>
                    </thead>
                    <tbody class="divide-y divide-slate-100">
                        {#each loads as load}
                            <tr class="hover:bg-slate-50/50 transition-all group relative {activeMenuId === load.id ? 'z-50' : 'z-0'}">
                                <td class="px-8 py-6">
                                    <div class="flex flex-col">
                                        <span class="font-black text-primary tracking-tighter">{load.id.slice(0, 8)}...</span>
                                        <span class="text-[10px] font-bold text-slate-400">{new Date(load.pickup_date || load.created_at).toLocaleDateString()}</span>
                                    </div>
                                </td>
                                <td class="px-8 py-6">
                                    <div class="flex flex-col">
                                        <span class="text-xs font-black text-slate-900">{load.origin} → {load.destination}</span>
                                        <span class="text-[10px] font-bold text-slate-400 uppercase tracking-tighter">{load.cargo_type || 'General'}</span>
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
                                    <div class="relative z-50 flex justify-end">
                                        <button 
                                            onclick={() => toggleMenu(load.id)}
                                            class="size-8 rounded-lg border border-slate-200 text-slate-400 hover:text-primary hover:bg-slate-50 hover:border-slate-300 flex items-center justify-center transition-all {activeMenuId === load.id ? 'bg-slate-50 text-primary border-slate-300' : ''}"
                                        >
                                            <span class="material-symbols-outlined text-lg">more_horiz</span>
                                        </button>

                                        {#if activeMenuId === load.id}
                                            <div class="absolute right-0 top-full mt-2 w-48 bg-white rounded-xl shadow-xl border border-slate-100 overflow-hidden z-40 animate-scale-up origin-top-right text-left">
                                                <div class="p-1">
                                                    {#if load.status === 'In Transit'}
                                                        <a href="/client/tracking" class="w-full text-left px-3 py-2 text-xs font-bold text-slate-600 hover:bg-slate-50 rounded-lg flex items-center gap-2 transition-colors">
                                                            <span class="material-symbols-outlined text-sm">share_location</span>
                                                            Track Live
                                                        </a>
                                                    {/if}
                                                    <button onclick={() => handleMenuAction('details', load)} class="w-full text-left px-3 py-2 text-xs font-bold text-slate-600 hover:bg-slate-50 rounded-lg flex items-center gap-2 transition-colors">
                                                        <span class="material-symbols-outlined text-sm">visibility</span>
                                                        View Details
                                                    </button>
                                                    <button onclick={() => handleMenuAction('docs', load)} class="w-full text-left px-3 py-2 text-xs font-bold text-slate-600 hover:bg-slate-50 rounded-lg flex items-center gap-2 transition-colors">
                                                        <span class="material-symbols-outlined text-sm">description</span>
                                                        Documents
                                                    </button>
                                                    <div class="h-px bg-slate-100 my-1"></div>
                                                    <button onclick={() => handleMenuAction('duplicate', load)} class="w-full text-left px-3 py-2 text-xs font-bold text-slate-600 hover:bg-slate-50 rounded-lg flex items-center gap-2 transition-colors">
                                                        <span class="material-symbols-outlined text-sm">content_copy</span>
                                                        Duplicate Load
                                                    </button>
                                                    <button onclick={() => handleMenuAction('cancel', load)} class="w-full text-left px-3 py-2 text-xs font-bold text-red-500 hover:bg-red-50 rounded-lg flex items-center gap-2 transition-colors">
                                                        <span class="material-symbols-outlined text-sm">cancel</span>
                                                        Cancel Shipment
                                                    </button>
                                                </div>
                                            </div>
                                        {/if}
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
