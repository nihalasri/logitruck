<script>

  import { goto } from '$app/navigation';
  import DriverSidebar from '$lib/components/DriverSidebar.svelte';

  function handleLogout() {
      goto('/login');
  }
</script>

<div class="bg-bg-main text-slate-900 font-display min-h-screen flex selection:bg-primary/10">
    <DriverSidebar activePage="dashboard" />

    <main class="flex-1 flex flex-col h-screen overflow-hidden relative">
        <!-- Glassmorphism Header -->
        <header class="flex items-center justify-between glass border-b border-slate-200 px-8 py-5 h-20 shrink-0 z-20">
            <div class="flex items-center gap-4">
                <a href="/" class="p-2 rounded-xl text-slate-400 hover:text-primary transition-all micro-interaction">
                    <span class="material-symbols-outlined">home</span>
                </a>
                <div class="w-px h-6 bg-slate-200"></div>
                <div>
                    <h2 class="text-2xl font-black text-slate-900 tracking-tight leading-none">Dashboard</h2>
                    <p class="text-[10px] font-black text-slate-400 uppercase tracking-widest mt-1">Live Status</p>
                </div>
            </div>
            <div class="flex items-center gap-4">
                <div class="flex items-center gap-2 bg-emerald-50 border border-emerald-100 px-4 py-2 rounded-xl">
                    <span class="size-2 rounded-full bg-emerald-500 animate-pulse"></span>
                    <span class="text-[10px] font-black uppercase tracking-widest text-emerald-600">Working Now</span>
                </div>
                <button class="relative p-2.5 rounded-xl bg-slate-50 border border-slate-100 text-slate-400 hover:text-primary transition-all micro-interaction">
                    <span class="material-symbols-outlined">notifications</span>
                    <span class="absolute top-2 right-2 size-2 rounded-full bg-red-500"></span>
                </button>
            </div>
        </header>

        <div class="flex-1 overflow-y-auto p-8 bg-[radial-gradient(40%_40%_at_50%_0%,rgba(29,78,216,0.02)_0%,transparent_100%)]">
            <div class="grid grid-cols-1 lg:grid-cols-12 gap-8 mb-8">
                <!-- Current Deployment Card -->
                <div class="lg:col-span-8 premium-card overflow-hidden flex flex-col">
                    <div class="p-8 border-b border-slate-100 flex justify-between items-center bg-slate-50/50">
                        <div>
                            <div class="flex items-center gap-3 mb-2">
                                <span class="bg-primary text-white text-[10px] font-black px-2.5 py-1 rounded-full uppercase tracking-widest">Current Trip</span>
                                <h3 class="text-xl font-black text-slate-900 tracking-tight leading-none">Load #L-8942</h3>
                            </div>
                            <div class="flex items-center gap-2 text-slate-500 text-[10px] font-black uppercase tracking-widest">
                                <span>High-Value Biohazard</span>
                                <span>•</span>
                                <span>18.5 Metric Tons</span>
                            </div>
                        </div>
                        <button class="moving-border h-12 rounded-xl shadow-xl shadow-slate-200 micro-interaction">
                            <div class="moving-border-content px-6 py-3 gap-2">
                                <span class="material-symbols-outlined text-[18px]">satellite_alt</span>
                                <span class="text-slate-900 font-black text-xs">Update Location</span>
                            </div>
                        </button>
                    </div>
                    
                    <div class="flex-1 flex flex-col md:flex-row">
                        <div class="p-8 flex-1 flex flex-col justify-between gap-10 relative">
                            <!-- Timeline -->
                            <div class="absolute left-[47px] top-12 bottom-32 w-px bg-slate-200"></div>
                            
                            <div class="space-y-10">
                                <div class="flex gap-6 items-start relative z-10">
                                    <div class="size-10 rounded-xl bg-slate-100 border border-slate-200 flex items-center justify-center shrink-0">
                                        <span class="material-symbols-outlined text-slate-400 text-[18px]">share_location</span>
                                    </div>
                                    <div>
                                        <p class="text-[10px] font-black text-slate-500 uppercase tracking-widest mb-1">Pickup</p>
                                        <p class="text-lg font-black text-slate-900 leading-none">Industrial Hub, IL</p>
                                        <p class="text-[10px] font-bold text-slate-500 mt-1 uppercase">Finalized: 08:30 UTC</p>
                                    </div>
                                </div>
                                <div class="flex gap-6 items-start relative z-10">
                                    <div class="size-10 rounded-xl bg-primary shadow-lg shadow-primary/20 flex items-center justify-center shrink-0">
                                        <span class="material-symbols-outlined text-white text-[18px]">flag</span>
                                    </div>
                                    <div>
                                        <p class="text-[10px] font-black text-primary uppercase tracking-widest mb-1 font-display">Drop-off</p>
                                        <p class="text-lg font-black text-slate-900 leading-none">Logistics Gate West, TX</p>
                                        <p class="text-[10px] font-bold text-slate-500 mt-1 uppercase">ETA: 14.5 Hours</p>
                                    </div>
                                </div>
                            </div>

                            <div class="bg-slate-50 rounded-2xl p-6 border border-slate-100">
                                <div class="flex justify-between items-end mb-3">
                                    <div>
                                        <p class="text-[10px] font-black text-slate-400 uppercase tracking-widest mb-1">Trip Progress</p>
                                        <p class="text-2xl font-black text-slate-900 leading-none">724 km <span class="text-slate-400 text-sm">REMAINING</span></p>
                                    </div>
                                    <span class="text-primary font-black text-sm">62.8%</span>
                                </div>
                                <div class="h-1.5 w-full bg-slate-200 rounded-full overflow-hidden">
                                    <div class="h-full bg-primary rounded-full" style="width: 62.8%"></div>
                                </div>
                            </div>
                        </div>

                        <div class="w-full md:w-1/2 min-h-[300px] relative bg-slate-50 p-4">
                            <div class="w-full h-full rounded-2xl overflow-hidden border border-slate-200 shadow-inner relative group">
                                <img src="https://images.unsplash.com/photo-1524661135-423995f22d0b?q=80&w=800&auto=format&fit=crop" class="w-full h-full object-cover grayscale opacity-50 group-hover:grayscale-0 group-hover:opacity-100 transition-all duration-1000" alt="Map">
                                <div class="absolute inset-0 bg-primary/5 pointer-events-none"></div>
                                <div class="absolute top-4 left-4 glass px-3 py-1.5 rounded-lg border border-white/50 flex items-center gap-2">
                                    <span class="size-2 rounded-full bg-primary animate-ping"></span>
                                    <span class="text-[9px] font-black uppercase tracking-widest text-slate-900">Live Location</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Financial Performance Card -->
                <div class="lg:col-span-4 flex flex-col gap-6">
                    <div class="premium-card p-8 bg-white relative overflow-hidden group border-primary/10 shadow-lg shadow-primary/5">
                        <div class="absolute -right-8 -bottom-8 opacity-[0.03] group-hover:scale-110 transition-transform duration-700">
                            <span class="material-symbols-outlined text-[160px] text-primary">payments</span>
                        </div>
                        <div class="relative z-10">
                            <p class="text-[10px] font-black text-slate-500 uppercase tracking-widest mb-2">This Month's Pay</p>
                            <h4 class="text-5xl font-black text-slate-900 mb-2 tracking-tighter tabular-nums">$4,821.50</h4>
                            <div class="flex items-center gap-2 text-emerald-600">
                                <span class="material-symbols-outlined text-sm font-black text-emerald-500">trending_up</span>
                                <span class="text-[10px] font-black uppercase tracking-widest">+18.4% Better Work</span>
                            </div>
                        </div>
                    </div>

                    <div class="premium-card p-8 flex-1 bg-white border-slate-200">
                        <h4 class="text-[10px] font-black text-slate-500 uppercase tracking-wider mb-6">Work Summary</h4>
                        <div class="flex items-end justify-between gap-3 h-40">
                            {#each [40, 65, 50, 85, 95, 35, 25] as height, i}
                                <div class="flex-1 flex flex-col items-center gap-3 group">
                                    <div class="w-full bg-slate-100 rounded-lg relative overflow-hidden transition-all group-hover:bg-primary/5 cursor-pointer" style="height: 100%">
                                        <div class="absolute bottom-0 left-0 right-0 bg-slate-200 transition-all group-hover:bg-primary/20" style="height: {height}%"></div>
                                        {#if i === 4}
                                            <div class="absolute bottom-0 left-0 right-0 bg-primary/80" style="height: {height}%"></div>
                                        {/if}
                                    </div>
                                    <span class="text-[9px] font-black text-slate-500 uppercase">{['M', 'T', 'W', 'T', 'F', 'S', 'S'][i]}</span>
                                </div>
                            {/each}
                        </div>
                    </div>
                </div>
            </div>

            <!-- Operational Matrix -->
            <div class="grid grid-cols-1 lg:grid-cols-2 gap-8 pb-12">
                <div class="premium-card p-8">
                    <div class="flex justify-between items-center mb-8">
                        <h3 class="text-xl font-black text-slate-900 tracking-tight flex items-center gap-3">
                            <div class="size-8 rounded-lg bg-primary/10 text-primary flex items-center justify-center">
                                <span class="material-symbols-outlined text-[20px]">gavel</span>
                            </div>
                            Pending Jobs
                        </h3>
                        <a href="/driver/proposals" class="text-[10px] font-black text-primary uppercase tracking-widest hover:underline">See All</a>
                    </div>
                    
                    <div class="space-y-3">
                        {#each [
                            { id: 'L-9921', route: 'Miami', rate: '$3.20', total: '$3,840', status: 'In Review', color: 'bg-blue-500' },
                            { id: 'L-9844', route: 'Seattle', rate: '$2.95', total: '$6,195', status: 'Pending', color: 'bg-yellow-500' },
                            { id: 'L-9550', route: 'Austin', rate: '$3.50', total: '$2,800', status: 'Outbid', color: 'bg-red-500' },
                        ] as bid}
                            <div class="flex items-center justify-between p-4 rounded-xl bg-slate-50 border border-slate-100 hover:border-primary/20 transition-all cursor-pointer group">
                                <div class="flex items-center gap-4">
                                    <div class="size-10 rounded-xl bg-white border border-slate-100 flex items-center justify-center text-slate-400 group-hover:text-primary transition-colors">
                                        <span class="material-symbols-outlined text-[20px]">package_2</span>
                                    </div>
                                    <div>
                                        <p class="text-sm font-black text-slate-900 group-hover:text-primary transition-colors">{bid.id} • {bid.route}</p>
                                        <p class="text-[10px] font-bold text-slate-400 uppercase tracking-tight">{bid.rate}/km • Fast Job</p>
                                    </div>
                                </div>
                                <div class="text-right">
                                    <p class="text-sm font-black text-slate-900">{bid.total}</p>
                                    <span class="text-[9px] font-black uppercase tracking-widest {bid.status === 'Outbid' ? 'text-red-500' : 'text-slate-400'}">{bid.status}</span>
                                </div>
                            </div>
                        {/each}
                    </div>
                </div>

                <div class="premium-card p-8 bg-blue-50/30 border-primary/10 relative overflow-hidden">
                    <div class="absolute -right-20 -bottom-20 size-64 bg-primary/10 blur-[100px] rounded-full"></div>
                    <div class="relative z-10 h-full flex flex-col">
                        <div class="flex justify-between items-center mb-10">
                            <div>
                                <h3 class="text-xl font-black tracking-tight leading-none mb-2 text-slate-900">Suggested Return Jobs</h3>
                                <p class="text-slate-500 text-xs font-bold uppercase tracking-widest text-[10px]">AI Best Fits</p>
                            </div>
                            <div class="size-12 rounded-xl bg-primary shadow-lg shadow-primary/20 text-white flex items-center justify-center">
                                <span class="material-symbols-outlined text-3xl font-black">bolt</span>
                            </div>
                        </div>

                        <div class="grid grid-cols-1 md:grid-cols-2 gap-4 flex-1">
                            <div class="p-6 rounded-2xl bg-slate-50 border border-slate-200 hover:bg-slate-100 transition-all cursor-pointer border-l-4 border-l-primary flex flex-col justify-between">
                                <div>
                                    <div class="flex justify-between mb-4">
                                        <span class="text-[9px] font-black uppercase tracking-widest text-slate-500">Location #1029</span>
                                        <span class="text-[9px] font-black uppercase tracking-widest text-emerald-600">92% Match</span>
                                    </div>
                                    <p class="text-sm font-black text-slate-900 mb-1">Dallas <span class="text-slate-400">→</span> Industrial Hub</p>
                                    <p class="text-[10px] text-slate-500 font-bold uppercase">Dry Van • 18t</p>
                                </div>
                                <div class="mt-6 flex justify-between items-center text-slate-900">
                                    <span class="text-lg font-black">$2,900</span>
                                    <span class="text-[9px] font-black text-primary uppercase tracking-widest">Take Job</span>
                                </div>
                            </div>

                            <div class="p-6 rounded-2xl bg-slate-50 border border-slate-200 hover:bg-slate-100 transition-all cursor-pointer flex flex-col justify-between">
                                <div>
                                    <div class="flex justify-between mb-4">
                                        <span class="text-[9px] font-black uppercase tracking-widest text-slate-500">Location #1045</span>
                                        <span class="text-[9px] font-black uppercase tracking-widest text-slate-500">Standard Match</span>
                                    </div>
                                    <p class="text-sm font-black text-slate-900 mb-1">Dallas <span class="text-slate-400">→</span> Gateway South</p>
                                    <p class="text-[10px] text-slate-500 font-bold uppercase">Reefer • 20t</p>
                                </div>
                                <div class="mt-6 flex justify-between items-center text-slate-900">
                                    <span class="text-lg font-black">$1,850</span>
                                    <span class="text-[9px] font-black text-slate-500 uppercase tracking-widest">Details</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
</div>
