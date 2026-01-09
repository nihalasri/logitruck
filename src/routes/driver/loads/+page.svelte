<script>

  import DriverSidebar from '$lib/components/DriverSidebar.svelte';

  let originQuery = $state('');
  let destQuery = $state('');

  const allLoads = [
    { id: 'Ref #19384', origin: 'Chicago, IL', dest: 'Miami, FL', type: 'Reefer', weight: '42,000 lbs', dist: '1,300 miles', price: '$3,200', tag: 'Hot Load' },
    { id: 'Ref #88221', origin: 'Seattle, WA', dest: 'Portland, OR', type: 'Dry Van', weight: '12,000 lbs', dist: '180 miles', price: '$450', tag: 'Ending Soon' },
    { id: 'Ref #77321', origin: 'Austin, TX', dest: 'Dallas, TX', type: 'Flatbed', weight: '45,000 lbs', dist: '200 miles', price: '$600', tag: 'New' },
    { id: 'Ref #11294', origin: 'Denver, CO', dest: 'Phoenix, AZ', type: 'Dry Van', weight: '38,000 lbs', dist: '850 miles', price: '$1,900', tag: 'Open' }
  ];

  let loads = $state([...allLoads]);

  function handleSearch() {
    loads = allLoads.filter(load => 
      load.origin.toLowerCase().includes(originQuery.toLowerCase()) &&
      load.dest.toLowerCase().includes(destQuery.toLowerCase())
    );
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
                <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8 pb-12">
                    {#each loads as load}
                        <div class="premium-card p-8 group hover:border-primary/20 transition-all duration-500 relative flex flex-col">
                            <div class="flex justify-between items-start mb-6">
                                <div>
                                    <h3 class="text-xl font-black text-slate-900 leading-tight mb-1">{load.origin} <span class="text-slate-300 mx-1">→</span> {load.dest}</h3>
                                    <p class="text-[10px] font-black text-slate-500 uppercase tracking-widest">{load.id}</p>
                                </div>
                                <span class="px-3 py-1 rounded-full text-[9px] font-black uppercase tracking-widest {load.tag === 'Hot Load' ? 'bg-red-50 text-red-600 border border-red-100' : 'bg-primary/5 text-primary border border-primary/10'}">
                                    {load.tag}
                                </span>
                            </div>

                            <div class="space-y-4 mb-8">
                                <div class="flex items-center gap-4">
                                    <div class="size-10 rounded-xl bg-slate-50 flex items-center justify-center text-slate-400 group-hover:bg-primary/10 group-hover:text-primary transition-colors">
                                        <span class="material-symbols-outlined text-[20px]">local_shipping</span>
                                    </div>
                                    <div>
                                        <p class="text-[10px] font-black text-slate-500 uppercase tracking-widest">Asset Required</p>
                                        <p class="text-sm font-black text-slate-900">{load.type}</p>
                                    </div>
                                </div>
                                <div class="flex items-center gap-4">
                                    <div class="size-10 rounded-xl bg-slate-50 flex items-center justify-center text-slate-400">
                                        <span class="material-symbols-outlined text-[20px]">calendar_today</span>
                                    </div>
                                    <div>
                                        <p class="text-[10px] font-black text-slate-500 uppercase tracking-widest">Pickup Schedule</p>
                                        <p class="text-sm font-black text-slate-900">Oct 24 • 08:00 UTC</p>
                                    </div>
                                </div>
                            </div>

                            <div class="mt-auto bg-slate-50 rounded-2xl p-6 border border-slate-100 flex items-center justify-between mb-8">
                                <div>
                                    <p class="text-[10px] font-black text-slate-400 uppercase tracking-widest mb-1">Fixed Settlement</p>
                                    <p class="text-3xl font-black text-primary leading-none">{load.price}</p>
                                </div>
                                <div class="text-right">
                                    <p class="text-[10px] font-black text-slate-500 uppercase tracking-widest mb-1">{load.dist}</p>
                                    <span class="text-[9px] font-black text-emerald-600 uppercase tracking-widest bg-emerald-50 px-2 py-0.5 rounded-full">Instant Book</span>
                                </div>
                            </div>

                            <div class="grid grid-cols-2 gap-4">
                                <button class="moving-border h-12 rounded-full shadow-lg shadow-slate-200 micro-interaction">
                                    <div class="moving-border-content px-6 py-2">
                                        <span class="text-slate-900 font-black text-sm">Pick up load</span>
                                    </div>
                                </button>
                                <button class="py-4 bg-white border border-slate-200 text-slate-900 rounded-xl font-black text-xs hover:bg-slate-50 transition-all micro-interaction">Inspect Manifest</button>
                            </div>
                        </div>
                    {/each}
                </div>

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
</div>
