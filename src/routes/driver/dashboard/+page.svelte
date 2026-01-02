<script>
  import '../../layout.css';
  import { goto } from '$app/navigation';

  function handleLogout() {
      goto('/login');
  }
</script>

<div class="bg-background-light dark:bg-background-dark text-slate-900 dark:text-white font-display antialiased overflow-hidden">
<div class="flex h-screen w-full overflow-hidden">
<!-- Sidebar Navigation -->
<aside class="flex w-64 flex-col bg-[#111722] border-r border-slate-800/50 flex-shrink-0 z-20">
<div class="flex flex-col h-full p-4 justify-between">
<div class="flex flex-col gap-8">
<!-- Brand -->
<div class="flex items-center gap-3 px-2">
<div class="flex items-center justify-center size-10 rounded-xl bg-primary/20 text-primary">
<span class="material-symbols-outlined text-3xl">local_shipping</span>
</div>
<div class="flex flex-col">
<h1 class="text-white text-lg font-bold leading-tight tracking-tight">LogiTruck</h1>
<p class="text-slate-400 text-xs font-medium">Driver Portal</p>
</div>
</div>
<!-- Navigation Items -->
<nav class="flex flex-col gap-2">
<a class="flex items-center gap-3 px-3 py-3 rounded-lg text-slate-400 hover:text-white hover:bg-white/5 transition-colors group" href="/">
<span class="material-symbols-outlined">home</span>
<span class="text-sm font-medium">Home</span>
</a>
<a class="flex items-center gap-3 px-3 py-3 rounded-lg bg-primary text-white group transition-colors" href="/driver/dashboard">
<span class="material-symbols-outlined fill">dashboard</span>
<span class="text-sm font-semibold">Dashboard</span>
</a>
<a class="flex items-center gap-3 px-3 py-3 rounded-lg text-slate-400 hover:text-white hover:bg-white/5 transition-colors group" href="/driver/loads">
<span class="material-symbols-outlined">package_2</span>
<span class="text-sm font-medium">Available Loads</span>
<span class="ml-auto bg-primary/20 text-primary text-xs font-bold px-2 py-0.5 rounded-full">12</span>
</a>
<a class="flex items-center gap-3 px-3 py-3 rounded-lg text-slate-400 hover:text-white hover:bg-white/5 transition-colors group" href="#">
<span class="material-symbols-outlined">gavel</span>
<span class="text-sm font-medium">My Bids</span>
</a>
<a class="flex items-center gap-3 px-3 py-3 rounded-lg text-slate-400 hover:text-white hover:bg-white/5 transition-colors group" href="#">
<span class="material-symbols-outlined">history</span>
<span class="text-sm font-medium">History</span>
</a>
<a class="flex items-center gap-3 px-3 py-3 rounded-lg text-slate-400 hover:text-white hover:bg-white/5 transition-colors group" href="#">
<span class="material-symbols-outlined">payments</span>
<span class="text-sm font-medium">Earnings</span>
</a>
</nav>
</div>
<!-- Bottom Actions -->
<div class="flex flex-col gap-2">
<a class="flex items-center gap-3 px-3 py-3 rounded-lg text-slate-400 hover:text-white hover:bg-white/5 transition-colors" href="#">
<span class="material-symbols-outlined">settings</span>
<span class="text-sm font-medium">Settings</span>
</a>
<button onclick={handleLogout} class="flex items-center w-full gap-3 px-3 py-3 rounded-lg text-red-500 hover:bg-red-500/10 transition-colors">
<span class="material-symbols-outlined">logout</span>
<span class="text-sm font-semibold">Logout</span>
</button>
<div class="mt-4 flex items-center gap-3 px-3 py-4 rounded-xl bg-[#1e293b] border border-slate-700/50">
<div class="size-10 rounded-full bg-cover bg-center shrink-0 border-2 border-slate-600" data-alt="Portrait of truck driver John" style="background-image: url('https://lh3.googleusercontent.com/aida-public/AB6AXuDAMpJmQsGIvkeyGLyKeUUi-kcF3NjT3ge3_ReTHQSLsXNEtuyHDZ5hyq4hieyugWLD1EvyMZnJoQIBcKvAZ3GbiETwU5lCS1UBVwK86-Vd9GDSxZfF7sXhe6GvOw4o2QGd52RrcXA-BaxKk_m6T5FachWL8bVzrzk-6rE-3C91oEWf62u_DeceVccQry6Uzt4xjZ5M0nqqYIw0O7vWhZ09qaD1UY2avOYPxa5-OqN_6i5buj3XwfTTtUXiXTuNuUc0XcLUc2d8JOo');"></div>
<div class="flex flex-col min-w-0">
<p class="text-white text-sm font-bold truncate">John Doe</p>
<p class="text-emerald-400 text-xs font-medium flex items-center gap-1">
<span class="size-2 rounded-full bg-emerald-500 block"></span> Online
                            </p>
</div>
</div>
</div>
</div>
</aside>
<!-- Main Content Scrollable Area -->
<main class="flex-1 overflow-y-auto bg-background-dark relative">
<!-- Page Heading -->
<header class="sticky top-0 z-10 bg-background-dark/95 backdrop-blur border-b border-slate-800/50 px-8 py-6">
<div class="flex flex-wrap items-center justify-between gap-4 max-w-[1400px] mx-auto">
<div class="flex flex-col gap-1">
<h2 class="text-white text-3xl font-black tracking-tight">Welcome back, John</h2>
<p class="text-slate-400 text-sm">Here's what's happening on your route today.</p>
</div>
<div class="flex items-center gap-4">
<button class="relative p-2 text-slate-400 hover:text-white transition-colors rounded-lg hover:bg-white/5">
<span class="material-symbols-outlined">notifications</span>
<span class="absolute top-2 right-2 size-2.5 rounded-full bg-red-500 border-2 border-background-dark"></span>
</button>
<button class="flex items-center justify-center gap-2 h-10 px-4 bg-surface-dark border border-slate-700 text-white text-sm font-semibold rounded-lg hover:bg-slate-700 transition-colors">
<span class="size-2 rounded-full bg-emerald-500"></span>
<span>Go Offline</span>
</button>
</div>
</div>
</header>
<!-- Dashboard Content -->
<div class="p-8 max-w-[1400px] mx-auto space-y-6">
<!-- Top Row: Active Load & Earnings -->
<div class="grid grid-cols-1 lg:grid-cols-12 gap-6">
<!-- Current Load Card (Hero) -->
<div class="lg:col-span-8 bg-[#192233] rounded-xl border border-slate-800 shadow-xl overflow-hidden flex flex-col">
<div class="p-6 border-b border-slate-800/50 flex justify-between items-center">
<div>
<div class="flex items-center gap-2 mb-1">
<span class="px-2 py-0.5 rounded text-[10px] font-bold uppercase tracking-wider bg-primary/20 text-primary border border-primary/20">In Progress</span>
<h3 class="text-white text-lg font-bold">Load #L-8942</h3>
</div>
<div class="flex items-center gap-2 text-slate-400 text-sm">
<span>Electronic Hardware</span>
<span>•</span>
<span>42,000 lbs</span>
</div>
</div>
<button class="flex items-center gap-2 px-4 py-2 bg-primary hover:bg-blue-600 text-white text-sm font-semibold rounded-lg transition-colors shadow-lg shadow-blue-900/20">
<span class="material-symbols-outlined text-[18px]">edit_location</span>
                                Update Status
                            </button>
</div>
<div class="flex-1 flex flex-col md:flex-row">
<!-- Route Details -->
<div class="p-6 flex-1 flex flex-col justify-between gap-6 relative">
<!-- Timeline Decoration -->
<div class="absolute left-[39px] top-10 bottom-24 w-0.5 bg-slate-700"></div>
<div class="flex flex-col gap-6">
<!-- Pickup -->
<div class="flex gap-4 relative z-0">
<div class="size-8 rounded-full bg-slate-700 border-2 border-slate-600 flex items-center justify-center shrink-0">
<span class="material-symbols-outlined text-slate-400 text-sm">inventory_2</span>
</div>
<div>
<p class="text-xs text-slate-400 font-semibold uppercase tracking-wider">Pickup • Completed</p>
<p class="text-white font-bold text-lg">Chicago, IL</p>
<p class="text-slate-500 text-sm">Oct 24, 08:00 AM</p>
</div>
</div>
<!-- Dropoff -->
<div class="flex gap-4 relative z-0">
<div class="size-8 rounded-full bg-primary border-4 border-[#192233] shadow-[0_0_0_2px_#135bec] flex items-center justify-center shrink-0 animate-pulse">
<span class="material-symbols-outlined text-white text-sm">flag</span>
</div>
<div>
<p class="text-xs text-primary font-semibold uppercase tracking-wider">Dropoff • Est. 6h 30m</p>
<p class="text-white font-bold text-lg">Dallas, TX</p>
<p class="text-slate-500 text-sm">Oct 25, 04:30 PM</p>
</div>
</div>
</div>
<!-- Progress Bar -->
<div class="bg-slate-800/50 rounded-lg p-4 border border-slate-700/50">
<div class="flex justify-between items-end mb-2">
<div>
<p class="text-slate-400 text-xs">Distance Remaining</p>
<p class="text-white font-bold text-xl">450 mi</p>
</div>
<span class="text-primary font-bold text-sm">65%</span>
</div>
<div class="h-2 w-full bg-slate-700 rounded-full overflow-hidden">
<div class="h-full bg-primary rounded-full" style="width: 65%"></div>
</div>
</div>
</div>
<!-- Map Visualization -->
<div class="w-full md:w-1/2 min-h-[250px] bg-slate-800 relative">
<div class="absolute inset-0 bg-cover bg-center opacity-80" data-alt="Dark themed map showing route from Chicago to Dallas" data-location="USA Map" style="background-image: url('https://lh3.googleusercontent.com/aida-public/AB6AXuDwWM1aF3CKM1-octSkNq14ANewtWZQAnJt4SDoGTsSDK1tJ2eT-gH70LnPMpIjwXnDGjeKVqIBKAFzR_XBOMz_M5TOf6oxX2mW5rIHSHzO5Bzv1NX-RiQipS7wdBuq2S_pa3ka-7Hk4uVePXFvoh-P-OglAhvwyq0kS5Hd2drjrrR_6pHn4MCtwEjhM7aFWQpc6BGho2TV16rcxycxFX39Anww-iqfuXP9hJnjFvBEkJWXJeWgp-kDKsN1im6YtExBpVAuhE4HAx0'); background-color: #242f45;">
<!-- Fallback Visual if Image fails or for design intent -->
<div class="w-full h-full bg-gradient-to-br from-slate-900 to-slate-800 flex items-center justify-center">
<!-- Simulated Map Elements -->
<svg class="w-full h-full opacity-30" preserveaspectratio="none" viewbox="0 0 100 100">
<path d="M20 20 Q 50 10 80 80" fill="none" stroke="#334155" stroke-width="2"></path>
<path d="M20 20 L 80 80" fill="none" stroke="#135bec" stroke-dasharray="4" stroke-width="2"></path>
<circle cx="20" cy="20" fill="#94a3b8" r="2"></circle>
<circle cx="80" cy="80" fill="#135bec" r="2"></circle>
</svg>
</div>
</div>
<div class="absolute bottom-4 right-4 bg-black/80 backdrop-blur text-white text-xs px-3 py-1.5 rounded-md border border-white/10 flex items-center gap-2">
<span class="material-symbols-outlined text-sm text-primary">navigation</span>
                                    On Route
                                </div>
</div>
</div>
</div>
<!-- Earnings Widget -->
<div class="lg:col-span-4 bg-[#192233] rounded-xl border border-slate-800 shadow-xl p-6 flex flex-col">
<div class="flex justify-between items-start mb-6">
<div>
<h3 class="text-slate-400 text-sm font-medium">Weekly Earnings</h3>
<div class="flex items-baseline gap-2 mt-1">
<span class="text-3xl font-black text-white">$4,250</span>
<span class="text-emerald-400 text-xs font-bold flex items-center">
<span class="material-symbols-outlined text-sm">trending_up</span>
                                        +12%
                                    </span>
</div>
</div>
<button class="p-2 hover:bg-white/5 rounded-lg text-slate-400 transition-colors">
<span class="material-symbols-outlined">more_horiz</span>
</button>
</div>
<!-- Chart Visualization (CSS Only) -->
<div class="flex-1 flex items-end justify-between gap-2 min-h-[160px] pb-2 border-b border-slate-700/50">
<!-- Bars -->
<div class="w-full flex flex-col justify-end gap-2 group cursor-pointer">
<div class="w-full bg-slate-700 rounded-t-sm h-[40%] group-hover:bg-primary/50 transition-colors"></div>
<span class="text-[10px] text-center text-slate-500 font-medium">Mon</span>
</div>
<div class="w-full flex flex-col justify-end gap-2 group cursor-pointer">
<div class="w-full bg-slate-700 rounded-t-sm h-[65%] group-hover:bg-primary/50 transition-colors"></div>
<span class="text-[10px] text-center text-slate-500 font-medium">Tue</span>
</div>
<div class="w-full flex flex-col justify-end gap-2 group cursor-pointer">
<div class="w-full bg-slate-700 rounded-t-sm h-[50%] group-hover:bg-primary/50 transition-colors"></div>
<span class="text-[10px] text-center text-slate-500 font-medium">Wed</span>
</div>
<div class="w-full flex flex-col justify-end gap-2 group cursor-pointer">
<div class="w-full bg-slate-700 rounded-t-sm h-[80%] group-hover:bg-primary/50 transition-colors"></div>
<span class="text-[10px] text-center text-slate-500 font-medium">Thu</span>
</div>
<div class="w-full flex flex-col justify-end gap-2 group cursor-pointer">
<div class="w-full bg-primary shadow-[0_0_15px_rgba(19,91,236,0.3)] rounded-t-sm h-[95%]"></div>
<span class="text-[10px] text-center text-white font-bold">Fri</span>
</div>
<div class="w-full flex flex-col justify-end gap-2 group cursor-pointer">
<div class="w-full bg-slate-700 rounded-t-sm h-[30%] group-hover:bg-primary/50 transition-colors"></div>
<span class="text-[10px] text-center text-slate-500 font-medium">Sat</span>
</div>
<div class="w-full flex flex-col justify-end gap-2 group cursor-pointer">
<div class="w-full bg-slate-700 rounded-t-sm h-[20%] group-hover:bg-primary/50 transition-colors"></div>
<span class="text-[10px] text-center text-slate-500 font-medium">Sun</span>
</div>
</div>
<div class="mt-4 flex justify-between items-center">
<p class="text-xs text-slate-400">Goal: <span class="text-white">$5,000</span></p>
<a class="text-xs text-primary font-bold hover:underline" href="#">View Details</a>
</div>
</div>
</div>
<!-- Bottom Row: Bids & Recommendations -->
<div class="grid grid-cols-1 lg:grid-cols-2 gap-6">
<!-- Active Bids -->
<div class="bg-[#192233] rounded-xl border border-slate-800 p-6 flex flex-col gap-4">
<div class="flex justify-between items-center">
<h3 class="text-white text-lg font-bold flex items-center gap-2">
<span class="material-symbols-outlined text-primary">gavel</span>
                                Active Bids
                            </h3>
<a class="text-sm text-slate-400 hover:text-white transition-colors" href="#">View All</a>
</div>
<div class="flex flex-col gap-3">
<!-- Bid Item 1 -->
<div class="flex items-center justify-between p-3 rounded-lg bg-slate-800/30 hover:bg-slate-800/50 border border-slate-800 hover:border-slate-700 transition-all cursor-pointer">
<div class="flex items-center gap-4">
<div class="size-10 rounded bg-slate-700 flex items-center justify-center">
<span class="material-symbols-outlined text-slate-400">local_shipping</span>
</div>
<div class="flex flex-col">
<span class="text-white text-sm font-bold">#L-9921 • Miami, FL</span>
<span class="text-slate-500 text-xs">$3.20/mile • 1,200 mi</span>
</div>
</div>
<div class="flex flex-col items-end gap-1">
<span class="text-white font-bold">$3,840</span>
<span class="px-2 py-0.5 rounded text-[10px] font-bold uppercase bg-yellow-500/10 text-yellow-500 border border-yellow-500/20">Pending</span>
</div>
</div>
<!-- Bid Item 2 -->
<div class="flex items-center justify-between p-3 rounded-lg bg-slate-800/30 hover:bg-slate-800/50 border border-slate-800 hover:border-slate-700 transition-all cursor-pointer">
<div class="flex items-center gap-4">
<div class="size-10 rounded bg-slate-700 flex items-center justify-center">
<span class="material-symbols-outlined text-slate-400">local_shipping</span>
</div>
<div class="flex flex-col">
<span class="text-white text-sm font-bold">#L-9844 • Seattle, WA</span>
<span class="text-slate-500 text-xs">$2.95/mile • 2,100 mi</span>
</div>
</div>
<div class="flex flex-col items-end gap-1">
<span class="text-white font-bold">$6,195</span>
<span class="px-2 py-0.5 rounded text-[10px] font-bold uppercase bg-slate-700 text-slate-400 border border-slate-600">Reviewing</span>
</div>
</div>
<!-- Bid Item 3 -->
<div class="flex items-center justify-between p-3 rounded-lg bg-slate-800/30 hover:bg-slate-800/50 border border-slate-800 hover:border-slate-700 transition-all cursor-pointer">
<div class="flex items-center gap-4">
<div class="size-10 rounded bg-slate-700 flex items-center justify-center">
<span class="material-symbols-outlined text-slate-400">local_shipping</span>
</div>
<div class="flex flex-col">
<span class="text-white text-sm font-bold">#L-9550 • Austin, TX</span>
<span class="text-slate-500 text-xs">$3.50/mile • 800 mi</span>
</div>
</div>
<div class="flex flex-col items-end gap-1">
<span class="text-white font-bold">$2,800</span>
<span class="px-2 py-0.5 rounded text-[10px] font-bold uppercase bg-red-500/10 text-red-500 border border-red-500/20">Outbid</span>
</div>
</div>
</div>
</div>
<!-- Recommended Loads -->
<div class="bg-[#192233] rounded-xl border border-slate-800 p-6 flex flex-col gap-4">
<div class="flex justify-between items-center">
<h3 class="text-white text-lg font-bold flex items-center gap-2">
<span class="material-symbols-outlined text-primary">bolt</span>
                                Recommended for Return
                            </h3>
<div class="flex gap-2">
<button class="size-8 flex items-center justify-center rounded bg-slate-800 text-slate-400 hover:text-white hover:bg-slate-700">
<span class="material-symbols-outlined text-lg">chevron_left</span>
</button>
<button class="size-8 flex items-center justify-center rounded bg-slate-800 text-slate-400 hover:text-white hover:bg-slate-700">
<span class="material-symbols-outlined text-lg">chevron_right</span>
</button>
</div>
</div>
<div class="grid grid-cols-1 sm:grid-cols-2 gap-4 h-full">
<!-- Recommendation 1 -->
<div class="bg-slate-800/50 p-4 rounded-lg border border-slate-700 hover:border-primary/50 hover:shadow-[0_0_15px_rgba(19,91,236,0.1)] transition-all group flex flex-col justify-between">
<div class="flex justify-between items-start mb-2">
<div class="bg-slate-900 rounded px-2 py-1 text-xs text-slate-400 font-mono">#L-1029</div>
<span class="text-emerald-400 text-xs font-bold">High Match</span>
</div>
<div class="mb-4">
<p class="text-white font-bold">Dallas, TX <span class="text-slate-500">→</span> Chicago, IL</p>
<p class="text-sm text-slate-400 mt-1">Dry Van • 38k lbs</p>
</div>
<div class="flex items-center justify-between pt-3 border-t border-slate-700">
<p class="text-white font-bold">$2,900</p>
<button class="text-primary text-sm font-bold group-hover:underline">Bid Now</button>
</div>
</div>
<!-- Recommendation 2 -->
<div class="bg-slate-800/50 p-4 rounded-lg border border-slate-700 hover:border-primary/50 hover:shadow-[0_0_15px_rgba(19,91,236,0.1)] transition-all group flex flex-col justify-between">
<div class="flex justify-between items-start mb-2">
<div class="bg-slate-900 rounded px-2 py-1 text-xs text-slate-400 font-mono">#L-1045</div>
<span class="text-slate-500 text-xs font-bold">Standard</span>
</div>
<div class="mb-4">
<p class="text-white font-bold">Dallas, TX <span class="text-slate-500">→</span> St. Louis, MO</p>
<p class="text-sm text-slate-400 mt-1">Reefer • 40k lbs</p>
</div>
<div class="flex items-center justify-between pt-3 border-t border-slate-700">
<p class="text-white font-bold">$1,850</p>
<button class="text-primary text-sm font-bold group-hover:underline">Bid Now</button>
</div>
</div>
</div>
</div>
</div>
</div>
</main>
</div>
</div>
