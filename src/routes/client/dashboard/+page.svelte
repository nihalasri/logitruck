<script>

  import { goto } from '$app/navigation';
  import ClientSidebar from '$lib/components/ClientSidebar.svelte';

  function handleLogout() {
      goto('/login');
  }
</script>

<div class="bg-bg-main text-slate-900 font-display min-h-screen flex selection:bg-primary/10">
    <ClientSidebar activePage="dashboard" />
    
    <!-- Main Content -->
    <main class="flex-1 flex flex-col h-screen overflow-hidden relative">
        <!-- Glassmorphism Top Navbar -->
        <header class="flex items-center justify-between glass border-b border-slate-200 px-8 py-5 h-20 shrink-0 z-20">
            <div class="flex items-center gap-4 lg:hidden">
                <button class="text-slate-600 hover:text-primary transition-colors">
                    <span class="material-symbols-outlined">menu</span>
                </button>
                <span class="text-xl font-black tracking-tight">LogiPro</span>
            </div>
            
            <div class="hidden lg:flex flex-1 max-w-xl">
                <div class="relative w-full group">
                    <div class="absolute inset-y-0 left-0 pl-4 flex items-center pointer-events-none text-slate-400 group-focus-within:text-primary transition-colors">
                        <span class="material-symbols-outlined text-[20px]">search</span>
                    </div>
                    <input 
                        class="block w-full pl-11 pr-4 py-3 rounded-2xl bg-slate-100/50 border-none placeholder-slate-400 focus:bg-white focus:ring-2 focus:ring-primary/20 transition-all text-sm font-medium" 
                        placeholder="Search for goods, trucks, or drivers..." 
                        type="text"
                    />
                </div>
            </div>

            <div class="flex items-center gap-6">
                <button class="relative p-2.5 rounded-xl text-slate-500 hover:bg-slate-100 hover:text-primary transition-all micro-interaction">
                    <span class="material-symbols-outlined text-[22px]">notifications</span>
                    <span class="absolute top-2.5 right-2.5 h-2 w-2 rounded-full bg-primary ring-2 ring-white"></span>
                </button>
                <div class="flex items-center gap-3 pl-4 border-l border-slate-200 group cursor-pointer">
                    <div class="flex flex-col items-end hidden sm:flex">
                        <span class="text-sm font-bold leading-tight group-hover:text-primary transition-colors">Nathan Wright</span>
                        <span class="text-[10px] font-black text-slate-400 uppercase tracking-widest">Premium User</span>
                    </div>
                    <div class="h-10 w-10 rounded-xl overflow-hidden ring-2 ring-slate-100 group-hover:ring-primary/20 transition-all shadow-sm">
                        <img alt="User Avatar" class="h-full w-full object-cover" src="https://lh3.googleusercontent.com/aida-public/AB6AXuDk1CgNlJV18_q29KbXBf8ln6HSnqfA-YzBNnf7JKoU7dYliOHYJtFhXuqR5CI5oQ1xB4e5kRizYPL-8iXm_wyFef4hltUdYqo5GSwjctgtyC1KmU3iS2_A6MntpBhUW7m6Z-b6Iu4uGyXvJdlmrLZ5BMBXyYcvBY_huYGi6d1tRX6rBYClpLei-YhoYKwFau4HZbNs7dT54pPwLUPH3v3SvQm3b_Enxkkl_h_lG6UOUScmaPgmlbwF5BWk5ewswLMlj7VDUYYfVAw"/>
                    </div>
                </div>
            </div>
        </header>

        <!-- Scrollable Content Area -->
        <div class="flex-1 overflow-y-auto p-8 space-y-10 bg-[radial-gradient(40%_40%_at_50%_0%,rgba(29,78,216,0.03)_0%,transparent_100%)]">
            <!-- Header Section -->
            <div class="flex flex-col md:flex-row md:items-center justify-between gap-6">
                <div class="flex flex-col">
                    <div class="flex items-center gap-3">
                        <h2 class="text-4xl font-black text-slate-900 tracking-tight leading-none font-display">Dashboard</h2>
                        <div class="px-3 py-1 rounded-full bg-gradient-to-r from-yellow-400 to-yellow-600 text-[10px] font-black uppercase text-white shadow-lg shadow-yellow-200/50 flex items-center gap-1.5">
                            <span class="material-symbols-outlined text-[14px]">military_tech</span>
                            Gold Member
                        </div>
                    </div>
                    <div class="flex items-center gap-4 mt-2">
                        <p class="text-text-muted font-medium">Tuesday, January 2nd • System Status: <span class="text-emerald-500 font-bold">Good</span></p>
                        <div class="h-4 w-px bg-slate-200"></div>
                        <div class="flex items-center gap-1.5">
                            <span class="material-symbols-outlined text-primary text-[18px]">workspace_premium</span>
                            <span class="text-xs font-black text-slate-900 tracking-tight">2,450 Reward Points</span>
                        </div>
                    </div>
                </div>
                <a href="/client/post-load" class="group relative flex items-center justify-center gap-3 bg-primary text-white px-8 py-4 rounded-2xl font-bold transition-all shadow-xl shadow-primary/20 hover:scale-105 active:scale-95 overflow-hidden">
                    <span class="material-symbols-outlined text-[20px]">add_circle</span>
                    Create New Shipment
                    <div class="absolute inset-0 bg-gradient-to-r from-white/10 to-transparent translate-x-[-100%] group-hover:translate-x-[100%] transition-transform duration-700"></div>
                </a>
            </div>

            <!-- Stats Highlight Grid -->
            <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6">
                {#each [
                    { label: 'Live Shipments', val: '12', mod: '+2', color: 'primary', icon: 'local_shipping' },
                    { label: 'Pending Bids', val: '05', mod: 'Action', color: 'blue', icon: 'gavel' },
                    { label: 'Scheduled', val: '03', mod: 'Next: 8h', color: 'indigo', icon: 'calendar_today' },
                    { label: 'Monthly Spend', val: '$14.2k', mod: '+12%', color: 'emerald', icon: 'payments' }
                ] as stat}
                <div class="premium-card p-6 flex flex-col justify-between h-40 group relative overflow-hidden">
                    <div class="absolute -right-2 -top-2 p-6 opacity-[0.03] group-hover:opacity-[0.08] transition-opacity duration-500 group-hover:scale-110">
                        <span class="material-symbols-outlined text-8xl text-primary">{stat.icon}</span>
                    </div>
                    <div>
                        <p class="text-slate-400 text-xs font-black uppercase tracking-widest mb-1">{stat.label}</p>
                        <h3 class="text-3xl font-black text-slate-900 leading-none">{stat.val}</h3>
                    </div>
                    <div class="inline-flex items-center gap-1.5 w-fit px-2.5 py-1 rounded-lg bg-slate-50 text-[10px] font-black uppercase tracking-wider text-slate-500 group-hover:bg-primary/5 group-hover:text-primary transition-colors">
                        <span class="size-1.5 rounded-full bg-primary/40"></span>
                        {stat.mod}
                    </div>
                </div>
                {/each}
            </div>

            <!-- Main Dashboard Layout -->
            <div class="grid grid-cols-1 xl:grid-cols-3 gap-8">
                <!-- Data Table Section -->
                <div class="xl:col-span-2 flex flex-col gap-8">
                    <div class="premium-card overflow-hidden flex flex-col">
                        <div class="p-6 border-b border-slate-100 flex items-center justify-between bg-slate-50/30">
                            <h3 class="font-black text-xl text-slate-900 tracking-tight">Live Shipments</h3>
                            <a class="group text-primary text-xs font-black uppercase tracking-widest flex items-center gap-1.5 hover:gap-2 transition-all" href="/client/loads">
                                See All
                                <span class="material-symbols-outlined text-[16px]">arrow_forward</span>
                            </a>
                        </div>
                        <div class="overflow-x-auto px-2">
                            <table class="w-full text-left text-sm">
                                <thead class="text-slate-400 uppercase font-black text-[10px] tracking-widest">
                                    <tr>
                                        <th class="px-6 py-5">Shipment ID</th>
                                        <th class="px-6 py-5">Route</th>
                                        <th class="px-6 py-5 text-center">Status</th>
                                        <th class="px-6 py-5 text-right">Time Left</th>
                                    </tr>
                                </thead>
                                <tbody class="divide-y divide-slate-100">
                                    {#each [
                                        { id: '#LD-4921', from: 'NYC', to: 'BOS', status: 'In Transit', driver: 'Mike R.', eta: '2h 15m' },
                                        { id: '#LD-3382', from: 'LAX', to: 'SFO', status: 'Optimal', driver: 'Sarah J.', eta: '45m' },
                                        { id: '#LD-9921', from: 'MIA', to: 'ATL', status: 'Scheduled', driver: 'Assigning...', eta: 'Pending' }
                                    ] as row}
                                    <tr class="group hover:bg-slate-50/80 transition-all cursor-pointer">
                                        <td class="px-6 py-5">
                                            <div class="flex flex-col">
                                                <span class="font-black text-slate-900">{row.id}</span>
                                                <span class="text-[10px] font-bold text-slate-400 uppercase tracking-tighter">Verified</span>
                                            </div>
                                        </td>
                                        <td class="px-6 py-5">
                                            <div class="flex items-center gap-3">
                                                <div class="flex flex-col items-end">
                                                    <span class="text-xs font-black">{row.from}</span>
                                                    <span class="text-[9px] text-slate-400 uppercase">Origin</span>
                                                </div>
                                                <span class="material-symbols-outlined text-sm text-slate-200">east</span>
                                                <div class="flex flex-col">
                                                    <span class="text-xs font-black">{row.to}</span>
                                                    <span class="text-[9px] text-slate-400 uppercase">Dest</span>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="px-6 py-5">
                                            <div class="flex justify-center">
                                                <span class="inline-flex items-center gap-2 px-3 py-1.5 rounded-xl text-[10px] font-black uppercase tracking-wider {row.status === 'In Transit' ? 'bg-primary/10 text-primary shadow-sm shadow-primary/5' : 'bg-slate-100 text-slate-500'}">
                                                    {#if row.status === 'In Transit'}<span class="size-1.5 rounded-full bg-primary animate-pulse"></span>{/if}
                                                    {row.status}
                                                </span>
                                            </div>
                                        </td>
                                        <td class="px-6 py-5 text-right">
                                            <span class="text-xs font-black text-slate-700">{row.eta}</span>
                                        </td>
                                    </tr>
                                    {/each}
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <!-- Visual Assets Section -->
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-8 pb-8">
                        <div class="premium-card p-8 group overflow-hidden relative min-h-[280px]">
                            <div class="absolute inset-0 bg-[url('https://images.unsplash.com/photo-1519003722824-194d4455a60c?q=80&w=2075&auto=format&fit=crop')] bg-cover bg-center grayscale opacity-10 group-hover:scale-110 transition-transform duration-1000"></div>
                            <div class="relative z-10 h-full flex flex-col justify-between">
                                <div>
                                    <h3 class="text-2xl font-black tracking-tight mb-2">Driver Network</h3>
                                    <p class="text-sm text-slate-500 font-medium">Global access to 50k+ verified truckers.</p>
                                </div>
                                <button class="w-fit bg-slate-900 text-white px-6 py-3 rounded-xl font-bold text-sm micro-interaction">Explore Fleet</button>
                            </div>
                        </div>
                        <div class="premium-card p-8 bg-primary text-white overflow-hidden relative shadow-2xl shadow-primary/20">
                            <div class="absolute -right-10 -bottom-10 opacity-10 rotate-12">
                                <span class="material-symbols-outlined text-[200px]">shield</span>
                            </div>
                            <div class="relative z-10 flex flex-col h-full justify-between">
                                <div>
                                    <h3 class="text-2xl font-black tracking-tight mb-2">Safe Delivery™</h3>
                                    <p class="text-blue-100 text-sm font-medium">Integrated protection for every shipment.</p>
                                </div>
                                <div class="flex items-center gap-4 mt-8">
                                    <div class="flex -space-x-3">
                                        {#each [1,2,3] as i}
                                        <div class="size-8 rounded-full border-2 border-primary bg-blue-400"></div>
                                        {/each}
                                    </div>
                                    <span class="text-xs font-bold font-display">1.2M+ Secured Loads</span>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Connectivity & Integration Matrix -->
                    <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
                        <div class="p-6 rounded-3xl bg-emerald-50 border border-emerald-100 flex flex-col gap-4 group cursor-pointer hover:bg-emerald-100/50 transition-all">
                            <div class="size-12 rounded-2xl bg-emerald-500 text-white flex items-center justify-center shadow-lg shadow-emerald-200">
                                <span class="material-symbols-outlined">chat</span>
                            </div>
                            <div>
                                <h4 class="font-black text-slate-900">WhatsApp Booking</h4>
                                <p class="text-[10px] font-bold text-emerald-600 uppercase tracking-widest mt-1">WhatsApp Support</p>
                            </div>
                        </div>
                        <div class="p-6 rounded-3xl bg-indigo-50 border border-indigo-100 flex flex-col gap-4 group cursor-pointer hover:bg-indigo-100/50 transition-all">
                            <div class="size-12 rounded-2xl bg-indigo-600 text-white flex items-center justify-center shadow-lg shadow-indigo-200">
                                <span class="material-symbols-outlined">api</span>
                            </div>
                            <div>
                                <h4 class="font-black text-slate-900">Business API</h4>
                                <p class="text-[10px] font-bold text-indigo-600 uppercase tracking-widest mt-1">Link Your App</p>
                            </div>
                        </div>
                        <div class="p-6 rounded-3xl bg-slate-900 text-white flex flex-col gap-4 group cursor-pointer hover:bg-slate-800 transition-all">
                            <div class="size-12 rounded-2xl bg-primary text-white flex items-center justify-center shadow-lg shadow-primary/20">
                                <span class="material-symbols-outlined">sync_alt</span>
                            </div>
                            <div>
                                <h4 class="font-black text-white">ERP/CRM Sync</h4>
                                <p class="text-[10px] font-black text-slate-400 uppercase tracking-widest mt-1">Sync Your Data</p>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Sidebar Content Section -->
                <div class="flex flex-col gap-8">
                    <!-- High-Priority Bids -->
                    <div class="premium-card flex flex-col h-fit">
                        <div class="p-6 border-b border-slate-100 flex items-center justify-between bg-slate-50/30">
                            <h3 class="font-black text-lg tracking-tight">Bids on Your Shipments</h3>
                            <span class="bg-primary/10 text-primary text-[10px] font-black px-2.5 py-1 rounded-full uppercase tracking-wider animate-pulse">5 Live</span>
                        </div>
                        <div class="p-4 space-y-4">
                            {#each [
                                { id: '#442', route: 'CHI → DET', carrier: 'FastTrack', bid: '$800', expires: '2h' },
                                { id: '#442', route: 'CHI → DET', carrier: "Mike's Trucking", bid: '$950', expires: '4h', lower: true }
                            ] as bid}
                            <div class="p-5 rounded-2xl border border-slate-100 bg-white hover:border-primary/20 hover:shadow-lg hover:shadow-primary/5 transition-all duration-300 group">
                                <div class="flex justify-between items-start mb-4">
                                    <div>
                                        <p class="text-[10px] font-black text-slate-400 uppercase tracking-widest mb-1">Load {bid.id}</p>
                                        <h4 class="font-black text-slate-900 mb-0.5">{bid.route}</h4>
                                        <p class="text-[10px] text-slate-500 font-bold uppercase">{bid.carrier}</p>
                                    </div>
                                    <span class="text-xl font-black text-slate-900 group-hover:text-primary transition-colors">{bid.bid}</span>
                                </div>
                                <div class="flex items-center gap-3 pt-2">
                                    <button class="flex-1 bg-slate-900 text-white text-[11px] font-black py-3 rounded-xl micro-interaction shadow-lg shadow-slate-200">Accept</button>
                                    <button class="flex-1 bg-white border border-slate-200 text-slate-700 text-[11px] font-black py-3 rounded-xl hover:bg-slate-50 micro-interaction">Counter</button>
                                </div>
                            </div>
                            {/each}
                            <button class="w-full py-2 text-xs font-black text-slate-400 hover:text-primary transition-colors uppercase tracking-widest">View all activity</button>
                        </div>
                    </div>

                    <!-- Referral Program Widget -->
                    <div class="premium-card p-8 bg-gradient-to-br from-primary to-indigo-700 text-white relative overflow-hidden group shadow-2xl shadow-primary/30">
                        <div class="absolute -right-8 -top-8 p-6 opacity-[0.1] group-hover:scale-125 transition-transform duration-1000">
                            <span class="material-symbols-outlined text-[160px]">share_reviews</span>
                        </div>
                        <div class="relative z-10">
                            <h3 class="text-xl font-black tracking-tight mb-3">Invite & Earn</h3>
                            <p class="text-blue-100 text-sm font-medium mb-8 leading-relaxed">Invite a friend to our network and receive <span class="font-black text-white">$50 Shipping Credits</span>.</p>
                            <div class="flex gap-2">
                                <div class="flex-1 bg-white/10 backdrop-blur-md rounded-xl border border-white/20 px-4 py-3 text-xs font-mono truncate">LOGIPRO-NATHAN-2026</div>
                                <button class="bg-white text-primary px-4 py-3 rounded-xl font-black text-xs micro-interaction">Copy</button>
                            </div>
                        </div>
                    </div>

                    <!-- Fast Support Widget -->
                    <div class="premium-card p-8 bg-slate-900 text-white relative overflow-hidden group">
                        <div class="absolute -right-8 -top-8 p-6 opacity-[0.05] group-hover:opacity-[0.1] group-hover:rotate-12 transition-all duration-700">
                            <span class="material-symbols-outlined text-[160px]">support_agent</span>
                        </div>
                        <div class="relative z-10">
                            <h3 class="text-xl font-black tracking-tight mb-3">Priority Support</h3>
                            <p class="text-slate-400 text-sm font-medium mb-8 leading-relaxed">Dedicated logistics manager sync available 24/7.</p>
                            <div class="flex gap-3">
                                <button class="flex-1 py-4 rounded-xl bg-white text-slate-900 font-black text-[11px] micro-interaction flex items-center justify-center gap-2">
                                    <span class="material-symbols-outlined text-[16px]">chat_bubble</span>
                                    Chat Now
                                </button>
                                <button class="py-4 px-4 rounded-xl bg-red-600 text-white font-black text-[11px] micro-interaction flex items-center justify-center gap-2 shadow-lg shadow-red-900/20">
                                    <span class="material-symbols-outlined text-[16px] animate-pulse">sos</span>
                                    Emergency
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
</div>
