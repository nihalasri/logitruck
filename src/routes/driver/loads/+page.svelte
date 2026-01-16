<script>

  import DriverSidebar from '$lib/components/DriverSidebar.svelte';
  import { activeJob } from '$lib/stores/job.js';
  import { supabase } from '$lib/supabase';
  import { onMount } from 'svelte';

  let originQuery = $state('');
  let destQuery = $state('');

  let loads = $state([]);
  let allLoads = []; // Cache for filtering
  let loading = $state(true);

  async function fetchLoads() {
      try {
          const { data, error } = await supabase
              .from('loads')
              .select('*')
              .order('created_at', { ascending: false });
          
          if (error) throw error;
          
          // Map DB fields to UI
          allLoads = data.map(l => ({
              id: l.id,
              origin: l.origin,
              dest: l.destination,
              type: l.cargo_type,
              weight: l.weight || 'N/A',
              dist: l.distance || 'N/A',
              price: l.price,
              tag: l.status
          }));
          loads = [...allLoads];
      } catch (err) {
          console.error('Error fetching loads:', err);
      } finally {
          loading = false;
      }
  }

  onMount(() => {
      fetchLoads();
  });

  let showConfirmation = $state(false);
  let showSuccess = $state(false);
  let selectedLoad = $state(null);

  function handleSearch() {
    loads = allLoads.filter(load => 
      load.origin.toLowerCase().includes(originQuery.toLowerCase()) &&
      load.dest.toLowerCase().includes(destQuery.toLowerCase())
    );
  }

  function handlePickup(load) {
      selectedLoad = load;
      showConfirmation = true;
  }

  function confirmPickup() {
      if (selectedLoad) {
          activeJob.set(selectedLoad);
          loads = loads.filter(l => l.id !== selectedLoad.id);
          showConfirmation = false;
          showSuccess = true;
          selectedLoad = null;
      }
  }

  function cancelPickup() {
      showConfirmation = false;
      selectedLoad = null;
  }

  function handleInspect(load) {
      alert(`Manifest Details:\nID: ${load.id}\nType: ${load.type}\nDistance: ${load.dist}\n\nFull manifest document would open here.`);
  }
</script>

<div class="bg-bg-main text-slate-900 font-display min-h-screen flex selection:bg-primary/10">
    <DriverSidebar activePage="available loads" />

    <main class="flex-1 flex flex-col h-screen overflow-hidden relative">
        <!-- Glassmorphism Header -->
        <header class="flex items-center justify-between glass border-b border-slate-200 px-8 py-5 h-20 shrink-0 z-20">
            <div class="flex items-center gap-4">
                <a href="/" class="p-2 rounded-xl text-slate-400 hover:text-primary transition-all micro-interaction">
                    <span class="material-symbols-outlined">home</span>
                </a>
                <div class="w-px h-6 bg-slate-200"></div>
                <div>
                    <h2 class="text-2xl font-black text-slate-900 tracking-tight leading-none">Manifest Nexus</h2>
                    <p class="text-[10px] font-black text-slate-500 uppercase tracking-widest mt-1">142 verified consignment nodes discovered</p>
                </div>
            </div>
            <div class="flex items-center gap-3">
                <button class="bg-slate-50 border border-slate-200 text-slate-600 px-5 py-2.5 rounded-xl text-xs font-black hover:bg-white hover:text-primary transition-all micro-interaction">
                    Saved Search Arrays
                </button>
            </div>
        </header>

        <div class="flex-1 overflow-y-auto bg-[radial-gradient(45%_45%_at_50%_0%,rgba(29,78,216,0.02)_0%,transparent_100%)]">
            <div class="max-w-7xl mx-auto p-12">
                <!-- Search & Filters -->
                <div class="grid grid-cols-1 md:grid-cols-3 gap-6 mb-12">
                    <div class="premium-card p-6">
                        <span class="block text-[10px] font-black uppercase tracking-widest text-slate-500 mb-3">Origin Node</span>
                        <div class="relative">
                            <span class="absolute left-4 top-1/2 -translate-y-1/2 material-symbols-outlined text-slate-300">location_on</span>
                            <input bind:value={originQuery} type="text" placeholder="Specify Departure..." class="w-full pl-12 pr-4 py-4 rounded-2xl bg-slate-50 border-none text-sm font-bold focus:bg-white focus:ring-2 focus:ring-primary/20 transition-all" />
                        </div>
                    </div>
                    <div class="premium-card p-6">
                        <span class="block text-[10px] font-black uppercase tracking-widest text-slate-500 mb-3">Destination Node</span>
                        <div class="relative">
                            <span class="absolute left-4 top-1/2 -translate-y-1/2 material-symbols-outlined text-slate-300">flag</span>
                            <input bind:value={destQuery} type="text" placeholder="Specify Arrival..." class="w-full pl-12 pr-4 py-4 rounded-2xl bg-slate-50 border-none text-sm font-bold focus:bg-white focus:ring-2 focus:ring-primary/20 transition-all" />
                        </div>
                    </div>
                    <div class="flex items-end">
                        <button onclick={handleSearch} class="w-full h-[76px] bg-slate-900 text-white rounded-2xl font-black text-sm shadow-xl shadow-slate-200 micro-interaction flex items-center justify-center gap-3 active:scale-95 transition-transform">
                            <span class="material-symbols-outlined">search</span>
                            Search
                        </button>
                    </div>
                </div>

                <!-- Load Grid -->
                {#if loading}
                    <div class="flex justify-center py-20">
                        <div class="size-10 border-4 border-slate-200 border-t-primary rounded-full animate-spin"></div>
                    </div>
                {:else if loads.length === 0}
                    <div class="text-center py-20 text-slate-400">
                        <span class="material-symbols-outlined text-4xl mb-4">folder_off</span>
                        <p>No available loads found.</p>
                    </div>
                {:else}
                    <div class="premium-card overflow-hidden mb-12">
                        <table class="w-full text-left border-collapse">
                            <thead class="bg-slate-50 border-b border-slate-100">
                                <tr>
                                    <th class="px-6 py-5 text-[10px] font-black uppercase tracking-widest text-slate-400">Load Ref</th>
                                    <th class="px-6 py-5 text-[10px] font-black uppercase tracking-widest text-slate-400">Route Node</th>
                                    <th class="px-6 py-5 text-[10px] font-black uppercase tracking-widest text-slate-400">Cargo Specs</th>
                                    <th class="px-6 py-5 text-[10px] font-black uppercase tracking-widest text-slate-400">Settlement</th>
                                    <th class="px-6 py-5 text-[10px] font-black uppercase tracking-widest text-slate-400 text-right">Actions</th>
                                </tr>
                            </thead>
                            <tbody class="divide-y divide-slate-100">
                                {#each loads as load}
                                    <tr class="hover:bg-slate-50/50 transition-colors group">
                                        <td class="px-6 py-6">
                                            <div class="flex flex-col">
                                                <span class="font-black text-primary tracking-tighter">{load.id}</span>
                                                <span class="px-2 py-0.5 rounded-full text-[9px] font-black uppercase tracking-widest w-fit mt-1 {load.tag === 'Hot Load' ? 'bg-red-50 text-red-600' : 'bg-slate-100 text-slate-400'}">
                                                    {load.tag}
                                                </span>
                                            </div>
                                        </td>
                                        <td class="px-6 py-6 font-black text-slate-900">
                                            <div class="flex items-center gap-2">
                                                <span>{load.origin}</span>
                                                <span class="text-slate-300">→</span>
                                                <span>{load.dest}</span>
                                            </div>
                                            <p class="text-[10px] text-slate-400 mt-1 uppercase tracking-wide">{load.dist}</p>
                                        </td>
                                        <td class="px-6 py-6">
                                            <div class="flex flex-col gap-1">
                                                <div class="flex items-center gap-2">
                                                    <span class="material-symbols-outlined text-[16px] text-slate-400">local_shipping</span>
                                                    <span class="text-xs font-bold text-slate-700">{load.type}</span>
                                                </div>
                                                <div class="flex items-center gap-2">
                                                    <span class="material-symbols-outlined text-[16px] text-slate-400">scale</span>
                                                    <span class="text-xs font-bold text-slate-700">{load.weight}</span>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="px-6 py-6">
                                            <span class="text-xl font-black text-emerald-600">{load.price}</span>
                                        </td>
                                        <td class="px-6 py-6 text-right">
                                            <div class="flex items-center justify-end gap-2">
                                                <button onclick={() => handleInspect(load)} class="p-2 rounded-lg border border-slate-200 text-slate-400 hover:text-primary hover:border-primary transition-all" title="Inspect">
                                                    <span class="material-symbols-outlined text-[20px]">visibility</span>
                                                </button>
                                                <button onclick={() => handlePickup(load)} class="px-4 py-2 bg-slate-900 text-white rounded-lg text-xs font-black uppercase tracking-widest shadow-lg hover:bg-primary transition-all">
                                                    Pick Up
                                                </button>
                                            </div>
                                        </td>
                                    </tr>
                                {/each}
                            </tbody>
                        </table>
                    </div>
                {/if}

                <!-- Footer Stats -->
                <div class="py-12 border-t border-slate-100 flex flex-col md:flex-row justify-between items-center gap-8">
                    <p class="text-[10px] font-black text-slate-400 uppercase tracking-[0.3em]">Institutional Grade Logistics Ecosystem v4.0.2</p>
                    <div class="flex gap-4">
                        {#each [1, 2, 3] as i}
                            <button class="size-10 rounded-xl border border-slate-200 flex items-center justify-center text-xs font-black {i === 1 ? 'bg-primary text-white border-primary' : 'text-slate-400 hover:text-primary hover:bg-slate-50'} transition-all">{i}</button>
                        {/each}
                        <button class="size-10 rounded-xl border border-slate-200 flex items-center justify-center text-slate-400 hover:text-primary hover:bg-slate-50 transition-all">
                            <span class="material-symbols-outlined text-sm">chevron_right</span>
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <!-- Confirmation Modal -->
    {#if showConfirmation}
    <div class="fixed inset-0 z-50 flex items-center justify-center bg-slate-900/60 backdrop-blur-sm animate-fade-in p-6">
        <div class="bg-white rounded-3xl p-8 max-w-md w-full shadow-2xl scale-100 animate-scale-up">
            <h3 class="text-2xl font-black text-slate-900 mb-2">Confirm Pickup</h3>
            <p class="text-slate-500 font-medium mb-8">
                Are you sure you want to accept this load? This will be added to your schedule immediately.
            </p>
            
            <div class="bg-slate-50 rounded-2xl p-6 mb-8 border border-slate-100">
                <div class="flex justify-between items-center mb-2">
                    <span class="text-xs font-black uppercase tracking-widest text-slate-400">Load ID</span>
                    <span class="text-sm font-black text-slate-900">{selectedLoad.id}</span>
                </div>
                <div class="flex justify-between items-center mb-2">
                    <span class="text-xs font-black uppercase tracking-widest text-slate-400">Origin</span>
                    <span class="text-sm font-black text-slate-900">{selectedLoad.origin}</span>
                </div>
                <div class="flex justify-between items-center">
                    <span class="text-xs font-black uppercase tracking-widest text-slate-400">Payout</span>
                    <span class="text-lg font-black text-emerald-600">{selectedLoad.price}</span>
                </div>
            </div>

            <div class="grid grid-cols-2 gap-4">
                <button onclick={cancelPickup} class="py-4 rounded-xl font-bold text-slate-500 hover:bg-slate-100 transition-colors">Cancel</button>
                <button onclick={confirmPickup} class="py-4 rounded-xl font-black text-white bg-primary shadow-lg shadow-primary/30 hover:scale-105 transition-transform">Confirm Job</button>
            </div>
        </div>
    </div>
    {/if}

    <!-- Success Modal -->
     {#if showSuccess}
     <div class="fixed inset-0 z-50 flex items-center justify-center bg-slate-900/60 backdrop-blur-sm animate-fade-in p-6">
         <div class="bg-white rounded-3xl p-10 max-w-sm w-full shadow-2xl scale-100 animate-scale-up text-center">
             <div class="size-20 bg-emerald-100 text-emerald-600 rounded-full flex items-center justify-center mx-auto mb-6">
                 <span class="material-symbols-outlined text-4xl">check_circle</span>
             </div>
             <h3 class="text-2xl font-black text-slate-900 mb-2">Load Confirmed!</h3>
             <p class="text-slate-500 font-medium mb-8">
                 It has been added to your schedule.
             </p>
             <button onclick={() => showSuccess = false} class="w-full py-4 rounded-xl font-black text-white bg-slate-900 hover:scale-105 transition-transform">Get to work</button>
         </div>
     </div>
     {/if}
</div>
