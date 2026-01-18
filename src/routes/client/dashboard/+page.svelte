<script>
  import { goto } from '$app/navigation';
  import { onMount } from 'svelte';
  import { fade } from 'svelte/transition';
  import { walletBalance, formatCurrency } from '$lib/stores/wallet';

  import { supabase } from '$lib/supabase';

  let currentDate = $state('');
  let showToast = $state(false);
  let toastMessage = $state('');
  let isLoading = $state(true);

  // Data
  let liveShipments = $state([]);
  let activeBids = $state([]); // Would fetch specific bids in real impl
  let userProfile = $state(null);
  
  // Dashboard Stats
  let dashboardStats = $derived([
      { label: 'Live Shipments', val: liveShipments.length.toString(), mod: 'Active', color: 'primary', icon: 'local_shipping' },
      { label: 'Active Bids', val: activeBids.length.toString(), mod: 'Pending', color: 'blue', icon: 'gavel' },
      { label: 'Scheduled', val: liveShipments.filter(l => l.status === 'Scheduled').length.toString(), mod: 'Next: 8h', color: 'indigo', icon: 'calendar_today' },
      { label: 'Wallet Balance', val: formatCurrency($walletBalance), mod: 'Available', color: 'emerald', icon: 'account_balance_wallet' }
  ]);

  let referralCode = 'LOGIPRO-NATHAN-2026';

  onMount(async () => {
      updateDate();
      const dateInterval = setInterval(updateDate, 60000);
      
      await fetchDashboardData();

      return () => clearInterval(dateInterval);
  });

  async function fetchDashboardData() {
      try {
          const { data: { user } } = await supabase.auth.getUser();
          if (!user) return;

          // Default Profile from Auth Data (Fallbacks)
          const meta = user.user_metadata || {};
          userProfile = {
              id: user.id,
              full_name: meta.full_name || meta.name || user.email?.split('@')[0] || 'User',
              avatar_url: meta.avatar_url || meta.picture || null,
              role: meta.role || 'client'
          };

          // Try to fetch detailed profile from DB
          const { data: profileData } = await supabase
            .from('profiles')
            .select('*')
            .eq('id', user.id)
            .maybeSingle(); // Use maybeSingle to avoid error on 0 rows
          
          // If DB profile exists, it takes precedence
          if (profileData) {
              userProfile = { ...userProfile, ...profileData };
          }

          // Fetch Client's Loads
          const { data: loads, error } = await supabase
              .from('loads')
              .select('*')
              .eq('client_id', user.id)
              .order('created_at', { ascending: false });

          if (error) throw error;

          // Transform for UI
          liveShipments = loads.map(load => ({
              id: `#${load.id.slice(0, 8).toUpperCase()}`, // Short UUID
              from: load.origin,
              to: load.destination,
              status: load.status,
              driver: load.driver_id ? 'Assigned' : 'Finding...',
              eta: load.delivery_date ? new Date(load.delivery_date).toLocaleDateString() : 'Pending',
              rating: 5.0 // Placeholder
          }));

      } catch (err) {
          console.error("Error fetching dashboard data:", err);
          triggerToast("Failed to load dashboard data");
      } finally {
          isLoading = false;
      }
  }

  function updateDate() {
      const now = new Date();
      const day = now.getDate();
      const suffix = (d) => {
          if (d > 3 && d < 21) return 'th';
          switch (d % 10) {
              case 1: return "st";
              case 2: return "nd";
              case 3: return "rd";
              default: return "th";
          }
      };
      
      const weekday = now.toLocaleDateString('en-US', { weekday: 'long' });
      const month = now.toLocaleDateString('en-US', { month: 'long' });
      
      currentDate = `${weekday}, ${month} ${day}${suffix(day)}`;
  }

  function handleLogout() {
      goto('/login');
  }

  function triggerToast(message) {
      toastMessage = message;
      showToast = true;
      setTimeout(() => showToast = false, 3000);
  }

  function handleAcceptBid(id) {
      const cleanId = id.replace('#', '');
      triggerToast(`Opening verification for Load ${id}...`);
      goto(`/client/bids?verify=${cleanId}`);
  }

  function handleCounterBid(id) {
      triggerToast(`Counter-offer sent for Load ${id}. Waiting for carrier response.`);
  }

  function copyReferral() {
      navigator.clipboard.writeText(referralCode);
      triggerToast('Referral code copied to clipboard!');
  }

  function handleChat() {
      goto('/client/support');
  }
</script>

    <!-- Main Content -->
    <main class="flex-1 flex flex-col h-full overflow-hidden relative">
        <!-- Glassmorphism Top Navbar -->
        <header class="flex items-center justify-between glass border-b border-slate-200 px-8 py-5 h-20 shrink-0 z-20">
            <div class="flex items-center gap-4 lg:hidden">
                <!-- Hamburger handled by Layout -->
                <span class="text-xl font-black tracking-tight pl-12">LogiTruck</span>
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
                <button onclick={() => goto('/client/notifications')} class="relative p-2.5 rounded-xl text-slate-500 hover:bg-slate-100 hover:text-primary transition-all micro-interaction cursor-pointer">
                    <span class="material-symbols-outlined text-[22px]">notifications</span>
                    <span class="absolute top-2.5 right-2.5 h-2 w-2 rounded-full bg-primary ring-2 ring-white"></span>
                </button>
                <div 
                    class="flex items-center gap-3 pl-4 border-l border-slate-200 group cursor-pointer"
                    onclick={() => goto('/client/profile')}
                    role="button"
                    tabindex="0"
                    onkeydown={(e) => e.key === 'Enter' && goto('/client/profile')}
                >
                    <div class="flex flex-col items-end hidden sm:flex">
                        <span class="text-sm font-bold leading-tight group-hover:text-primary transition-colors">{userProfile?.full_name || 'Loading...'}</span>
                        <span class="text-xs font-black text-slate-400 uppercase tracking-widest">{userProfile?.role === 'client' ? 'Client Account' : (userProfile?.role || 'User')}</span>
                    </div>
                    <div class="h-10 w-10 rounded-xl overflow-hidden ring-2 ring-slate-100 group-hover:ring-primary/20 transition-all shadow-sm">
                        <img 
                            alt="User Avatar" 
                            class="h-full w-full object-cover" 
                            src={userProfile?.avatar_url || 'https://www.gravatar.com/avatar/00000000000000000000000000000000?d=mp&f=y'}
                        />
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

                    </div>
                    <div class="flex items-center gap-4 mt-2">
                        <p class="text-text-muted font-medium">{currentDate} • System Status: <span class="text-emerald-500 font-bold">Good</span></p>
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
                {#each dashboardStats as stat}
                <div class="premium-card p-6 flex flex-col justify-between h-40 group relative overflow-hidden">
                    <div class="absolute -right-2 -top-2 p-6 opacity-[0.1] group-hover:opacity-[0.2] transition-opacity duration-500 group-hover:scale-110">
                        <span class="material-symbols-outlined text-8xl {stat.color === 'emerald' ? 'text-emerald-500' : stat.color === 'indigo' ? 'text-indigo-500' : stat.color === 'blue' ? 'text-blue-500' : 'text-primary'}">{stat.icon}</span>
                    </div>
                    <div>
                        <p class="text-slate-600 text-xs font-black uppercase tracking-widest mb-1">{stat.label}</p>
                        <h3 class="text-3xl font-black text-slate-900 leading-none">{stat.val}</h3>
                    </div>
                    <div class="inline-flex items-center gap-1.5 w-fit px-2.5 py-1 rounded-lg bg-slate-50 text-[10px] font-black uppercase tracking-wider text-slate-700 group-hover:bg-primary/5 group-hover:text-primary transition-colors">
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
                                        <th class="px-6 py-5 text-center">Performance Index</th>
                                        <th class="px-6 py-5 text-right">Time Left</th>
                                    </tr>
                                </thead>
                                <tbody class="divide-y divide-slate-100">
                                    {#each liveShipments as row}
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
                                                <span class="material-symbols-outlined text-sm text-slate-400">east</span>
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
                                        <td class="px-6 py-5">
                                            <div class="flex justify-center">
                                                <div class="inline-flex items-center gap-1.5 px-4 py-1.5 rounded-full bg-amber-50 border border-amber-100/50 shadow-sm shadow-amber-500/10">
                                                    <span class="material-symbols-outlined text-sm text-amber-500">star</span>
                                                    <span class="text-xs font-black text-amber-700">{row.rating.toFixed(1)}</span>
                                                </div>
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
                            </div>
                        </div>
                        <div class="premium-card p-8 bg-white overflow-hidden relative shadow-2xl shadow-slate-200/50">
                            <div class="absolute -right-10 -bottom-10 opacity-[0.05] rotate-12 pointer-events-none">
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" class="w-64 h-64 text-primary">
                                    <path fill-rule="evenodd" d="M12.516 2.17a.75.75 0 0 0-1.032 0 11.209 11.209 0 0 1-7.877 3.08.75.75 0 0 0-.722.515A12.74 12.74 0 0 0 2.25 9.75c0 5.942 4.064 10.933 9.563 12.348a.749.749 0 0 0 .374 0c5.499-1.415 9.563-6.406 9.563-12.348 0-1.352-.272-2.636-.759-3.985a.75.75 0 0 0-.722-.516l-.143.001c-2.996 0-5.717-1.17-7.734-3.08Zm3.094 8.016a.75.75 0 1 0-1.22-.872l-3.236 4.53L9.53 12.22a.75.75 0 0 0-1.06 1.06l2.25 2.25a.75.75 0 0 0 1.14-.094l3.75-5.25Z" clip-rule="evenodd" />
                                </svg>
                            </div>
                            <div class="relative z-10 flex flex-col h-full justify-between">
                                <div>
                                    <h3 class="text-2xl font-black tracking-tight mb-2 text-primary">Safe Delivery™</h3>
                                    <p class="text-slate-500 text-sm font-medium">Integrated protection for every shipment.</p>
                                </div>
                                <div class="flex items-center gap-4 mt-8">
                                    <div class="flex -space-x-3">
                                        {#each [1,2,3] as i}
                                        <div class="size-8 rounded-full border-2 border-white bg-blue-100"></div>
                                        {/each}
                                    </div>
                                    <span class="text-xs font-bold font-display text-slate-700">1.2M+ Secured Loads</span>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Sustainability Impact Tracker (New 2025 Feature) -->
                    <div class="premium-card p-8 bg-gradient-to-r from-teal-900 to-emerald-900 text-white relative overflow-hidden group shadow-2xl shadow-emerald-900/20 mb-8">
                        <div class="absolute inset-0 bg-[url('https://images.unsplash.com/photo-1542601906990-b4d3fb778b09?q=80&w=2074&auto=format&fit=crop')] bg-cover bg-center opacity-10 mix-blend-overlay"></div>
                        <div class="relative z-10 flex flex-col md:flex-row items-center justify-between gap-8">
                            <div class="flex-1">
                                <div class="flex items-center gap-3 mb-2">
                                    <div class="size-10 rounded-xl bg-emerald-500/20 flex items-center justify-center border border-emerald-500/30">
                                        <span class="material-symbols-outlined text-emerald-400">forest</span>
                                    </div>
                                    <p class="text-[10px] font-black uppercase tracking-[0.2em] text-emerald-400">Sustainability Intelligence</p>
                                </div>
                                <h3 class="text-3xl font-black tracking-tight mb-2">Eco-Logistics Tracker</h3>
                                <p class="text-emerald-100/80 text-sm font-medium leading-relaxed max-w-lg">Your commitment to sustainable logistics is making a real difference! Continue prioritizing eco-friendly options to help build a greener, healthier future for everyone.</p>
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
                            <span class="bg-primary/10 text-primary text-[10px] font-black px-2.5 py-1 rounded-full uppercase tracking-wider animate-pulse">2 Live</span>
                        </div>
                        <div class="p-4 space-y-4">
                            {#each activeBids as bid}
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
                                    <button onclick={() => handleAcceptBid(bid.id)} class="flex-1 bg-slate-900 text-white text-[11px] font-black py-3 rounded-xl micro-interaction shadow-lg shadow-slate-200 hover:bg-slate-800 transition-colors">Accept</button>
                                    <button onclick={() => handleCounterBid(bid.id)} class="flex-1 bg-white border border-slate-200 text-slate-700 text-[11px] font-black py-3 rounded-xl hover:bg-slate-50 micro-interaction">Counter</button>
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
                                <div class="flex-1 bg-white/10 backdrop-blur-md rounded-xl border border-white/20 px-4 py-3 text-xs font-mono truncate">{referralCode}</div>
                                <button onclick={copyReferral} class="bg-white text-primary px-4 py-3 rounded-xl font-black text-xs micro-interaction hover:bg-blue-50 transition-colors">Copy</button>
                            </div>
                        </div>
                    </div>

                    <!-- Fast Support Widget -->
                    <div class="premium-card p-8 bg-white relative overflow-hidden group">
                        <div class="absolute -right-8 -top-8 p-6 opacity-[0.05] group-hover:opacity-[0.1] group-hover:rotate-12 transition-all duration-700">
                            <span class="material-symbols-outlined text-[160px] text-slate-900">support_agent</span>
                        </div>
                        <div class="relative z-10">
                            <h3 class="text-xl font-black tracking-tight mb-3 text-slate-900">Priority Support</h3>
                            <p class="text-slate-600 text-sm font-medium mb-8 leading-relaxed">Dedicated logistics manager sync available 24/7.</p>
                            <div class="flex gap-3">
                                <button onclick={handleChat} class="flex-1 py-4 rounded-xl bg-slate-900 text-white font-black text-[11px] micro-interaction flex items-center justify-center gap-2 shadow-lg shadow-slate-200 hover:bg-slate-800 transition-colors">
                                    <span class="material-symbols-outlined text-[16px]">chat_bubble</span>
                                    Chat Now
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        {#if showToast}
            <div 
                transition:fade
                class="fixed bottom-6 right-6 bg-slate-900 text-white px-6 py-4 rounded-2xl shadow-2xl flex items-center gap-4 z-50 max-w-sm"
            >
                <div class="size-8 rounded-full bg-emerald-500/20 text-emerald-400 flex items-center justify-center">
                    <span class="material-symbols-outlined text-lg">check_circle</span>
                </div>
                <p class="text-sm font-bold">{toastMessage}</p>
            </div>
        {/if}
    </main>

