<script>
  import '../../layout.css';
  import { goto } from '$app/navigation';
  import ClientSidebar from '$lib/components/ClientSidebar.svelte';

  function handleLogout() {
      goto('/login');
  }
</script>

<div class="bg-background-light dark:bg-background-dark text-slate-900 dark:text-white font-display antialiased overflow-hidden">
<div class="flex h-screen w-full overflow-hidden">
<ClientSidebar activePage="dashboard" />
<!-- Main Content -->
<main class="flex-1 flex flex-col h-full overflow-hidden bg-background-light dark:bg-background-dark relative">
<!-- Top Navbar -->
<header class="flex items-center justify-between border-b border-slate-200 dark:border-surface-dark-light bg-white dark:bg-background-dark px-6 py-4 h-18 shrink-0">
<div class="flex items-center gap-4 lg:hidden">
<button class="text-slate-500 dark:text-slate-400 hover:text-slate-900 dark:hover:text-white">
<span class="material-symbols-outlined">menu</span>
</button>
<span class="text-lg font-bold">Logistics Inc.</span>
</div>
<div class="hidden lg:flex flex-1 max-w-md">
<div class="relative w-full text-slate-500 dark:text-slate-400 focus-within:text-primary">
<div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
<span class="material-symbols-outlined">search</span>
</div>
<input class="block w-full pl-10 pr-3 py-2.5 border-none rounded-lg leading-5 bg-slate-100 dark:bg-surface-dark-light text-slate-900 dark:text-white placeholder-slate-500 dark:placeholder-slate-400 focus:outline-none focus:ring-2 focus:ring-primary sm:text-sm transition-shadow" placeholder="Search load ID, driver, or route..." type="text"/>
</div>
</div>
<div class="flex items-center gap-3">
<button class="relative p-2 rounded-full text-slate-500 dark:text-slate-400 hover:bg-slate-100 dark:hover:bg-surface-dark-light transition-colors">
<span class="material-symbols-outlined">notifications</span>
<span class="absolute top-1.5 right-1.5 h-2 w-2 rounded-full bg-red-500 border border-white dark:border-background-dark"></span>
</button>
<div class="h-8 w-8 rounded-full bg-slate-200 dark:bg-surface-dark-light overflow-hidden cursor-pointer border border-slate-300 dark:border-slate-600" data-alt="User profile avatar">
<img alt="User Avatar" class="h-full w-full object-cover" src="https://lh3.googleusercontent.com/aida-public/AB6AXuDk1CgNlJV18_q29KbXBf8ln6HSnqfA-YzBNnf7JKoU7dYliOHYJtFhXuqR5CI5oQ1xB4e5kRizYPL-8iXm_wyFef4hltUdYqo5GSwjctgtyC1KmU3iS2_A6MntpBhUW7m6Z-b6Iu4uGyXvJdlmrLZ5BMBXyYcvBY_huYGi6d1tRX6rBYClpLei-YhoYKwFau4HZbNs7dT54pPwLUPH3v3SvQm3b_Enxkkl_h_lG6UOUScmaPgmlbwF5BWk5ewswLMlj7VDUYYfVAw"/>
</div>
</div>
</header>
<!-- Scrollable Content Area -->
<div class="flex-1 overflow-y-auto p-4 md:p-8 space-y-6">
<!-- Page Heading & Actions -->
<div class="flex flex-col md:flex-row md:items-end justify-between gap-4">
<div>
<h2 class="text-3xl md:text-4xl font-extrabold text-slate-900 dark:text-white tracking-tight">Good morning, Logistics Inc.</h2>
<p class="text-slate-500 dark:text-slate-400 mt-1 font-medium">Tuesday, Oct 24 • Overview</p>
</div>
<a href="/client/post-load" class="flex items-center justify-center gap-2 bg-primary hover:bg-blue-600 text-white px-5 py-3 rounded-lg font-bold transition-all shadow-lg shadow-primary/25 active:scale-95">
<span class="material-symbols-outlined text-[20px]">add_circle</span>
                        Post New Load
                    </a>
</div>
<!-- Stats Grid -->
<div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-4">
<!-- Active Loads -->
<div class="bg-white dark:bg-surface-dark rounded-xl p-5 border border-slate-200 dark:border-surface-dark-light shadow-sm flex flex-col justify-between h-32 relative overflow-hidden group">
<div class="absolute right-0 top-0 p-4 opacity-10 group-hover:opacity-20 transition-opacity">
<span class="material-symbols-outlined text-6xl text-primary">local_shipping</span>
</div>
<p class="text-slate-500 dark:text-slate-400 text-sm font-semibold">Active Loads</p>
<div>
<span class="text-3xl font-bold text-slate-900 dark:text-white">12</span>
<span class="ml-2 text-sm font-medium text-emerald-500 bg-emerald-500/10 px-1.5 py-0.5 rounded">+2 new</span>
</div>
</div>
<!-- Open Bids -->
<div class="bg-white dark:bg-surface-dark rounded-xl p-5 border border-slate-200 dark:border-surface-dark-light shadow-sm flex flex-col justify-between h-32 relative overflow-hidden group">
<div class="absolute right-0 top-0 p-4 opacity-10 group-hover:opacity-20 transition-opacity">
<span class="material-symbols-outlined text-6xl text-blue-400">gavel</span>
</div>
<p class="text-slate-500 dark:text-slate-400 text-sm font-semibold">Open Bids</p>
<div>
<span class="text-3xl font-bold text-primary">5</span>
<span class="ml-2 text-sm font-medium text-slate-500 dark:text-slate-400">Action required</span>
</div>
</div>
<!-- Scheduled -->
<div class="bg-white dark:bg-surface-dark rounded-xl p-5 border border-slate-200 dark:border-surface-dark-light shadow-sm flex flex-col justify-between h-32 relative overflow-hidden group">
<div class="absolute right-0 top-0 p-4 opacity-10 group-hover:opacity-20 transition-opacity">
<span class="material-symbols-outlined text-6xl text-indigo-400">calendar_month</span>
</div>
<p class="text-slate-500 dark:text-slate-400 text-sm font-semibold">Scheduled</p>
<div>
<span class="text-3xl font-bold text-slate-900 dark:text-white">3</span>
<span class="ml-2 text-sm font-medium text-slate-500 dark:text-slate-400">Next: Tomorrow</span>
</div>
</div>
<!-- Spent MTD -->
<div class="bg-white dark:bg-surface-dark rounded-xl p-5 border border-slate-200 dark:border-surface-dark-light shadow-sm flex flex-col justify-between h-32 relative overflow-hidden group">
<div class="absolute right-0 top-0 p-4 opacity-10 group-hover:opacity-20 transition-opacity">
<span class="material-symbols-outlined text-6xl text-emerald-400">attach_money</span>
</div>
<p class="text-slate-500 dark:text-slate-400 text-sm font-semibold">Spent MTD</p>
<div>
<span class="text-3xl font-bold text-slate-900 dark:text-white">$14.5k</span>
<span class="ml-2 text-sm font-medium text-emerald-500">+12% vs last mo</span>
</div>
</div>
</div>
<!-- Main Layout Grid -->
<div class="grid grid-cols-1 xl:grid-cols-3 gap-6">
<!-- Left Column: Active Loads Table (Takes up 2 cols on large screens) -->
<div class="xl:col-span-2 flex flex-col gap-6">
<!-- Active Loads Card -->
<div class="bg-white dark:bg-surface-dark rounded-xl border border-slate-200 dark:border-surface-dark-light shadow-sm overflow-hidden flex flex-col">
<div class="p-5 border-b border-slate-200 dark:border-surface-dark-light flex items-center justify-between">
<h3 class="font-bold text-lg text-slate-900 dark:text-white">Active Loads</h3>
<a class="text-primary text-sm font-semibold hover:underline" href="#">View All</a>
</div>
<div class="overflow-x-auto">
<table class="w-full text-left text-sm">
<thead class="bg-slate-50 dark:bg-surface-dark-light text-slate-500 dark:text-slate-400 uppercase font-semibold text-xs">
<tr>
<th class="px-6 py-4">Load ID</th>
<th class="px-6 py-4">Route</th>
<th class="px-6 py-4">Status</th>
<th class="px-6 py-4">Driver</th>
<th class="px-6 py-4 text-right">ETA</th>
</tr>
</thead>
<tbody class="divide-y divide-slate-200 dark:divide-surface-dark-light">
<!-- Row 1 -->
<tr class="hover:bg-slate-50 dark:hover:bg-surface-dark-light/50 transition-colors">
<td class="px-6 py-4 font-medium text-slate-900 dark:text-white">#LD-4921</td>
<td class="px-6 py-4 text-slate-600 dark:text-slate-300">
<div class="flex items-center gap-2">
<span>NYC</span>
<span class="material-symbols-outlined text-xs text-slate-400">arrow_forward</span>
<span>BOS</span>
</div>
</td>
<td class="px-6 py-4">
<span class="inline-flex items-center gap-1.5 px-2.5 py-1 rounded-full text-xs font-medium bg-blue-100 text-blue-800 dark:bg-blue-900/30 dark:text-blue-300">
<span class="w-1.5 h-1.5 rounded-full bg-blue-500 animate-pulse"></span>
                                                    In Transit
                                                </span>
</td>
<td class="px-6 py-4">
<div class="flex items-center gap-2">
<div class="h-6 w-6 rounded-full bg-slate-200 dark:bg-slate-700 overflow-hidden" data-alt="Driver portrait">
<img alt="Driver" class="h-full w-full object-cover" src="https://lh3.googleusercontent.com/aida-public/AB6AXuDUd9LAr8BFnZzQzSesDHX-XKtCf-T6G1riGsPPV69mudlZNIWx29zjGfrjZztjjpzuGIefIS3RjOZXlZSy1YhsQfD-xJZkGGYWHUXpIxIN9_LfdG-UMvKt00SxXY66FsfhLw3vHLvMjSAEArRBc2TUv8XUWMh-xcbXkPuyLxPJzoOj1cVqcQCn-dwLAnoVe4mllw7upP-CBbl-Bl56TQNPpUXOJolQiPNEvtnB-gyQpr3DLJC5ahqULmHzuCzCNUXo1ugVm4cMotw"/>
</div>
<span class="text-slate-600 dark:text-slate-300">Mike R.</span>
</div>
</td>
<td class="px-6 py-4 text-right text-slate-600 dark:text-slate-300">2h 15m</td>
</tr>
<!-- Row 2 -->
<tr class="hover:bg-slate-50 dark:hover:bg-surface-dark-light/50 transition-colors">
<td class="px-6 py-4 font-medium text-slate-900 dark:text-white">#LD-3382</td>
<td class="px-6 py-4 text-slate-600 dark:text-slate-300">
<div class="flex items-center gap-2">
<span>LAX</span>
<span class="material-symbols-outlined text-xs text-slate-400">arrow_forward</span>
<span>SFO</span>
</div>
</td>
<td class="px-6 py-4">
<span class="inline-flex items-center gap-1.5 px-2.5 py-1 rounded-full text-xs font-medium bg-amber-100 text-amber-800 dark:bg-amber-900/30 dark:text-amber-300">
<span class="w-1.5 h-1.5 rounded-full bg-amber-500"></span>
                                                    Delayed
                                                </span>
</td>
<td class="px-6 py-4">
<div class="flex items-center gap-2">
<div class="h-6 w-6 rounded-full bg-slate-200 dark:bg-slate-700 overflow-hidden" data-alt="Driver portrait">
<img alt="Driver" class="h-full w-full object-cover" src="https://lh3.googleusercontent.com/aida-public/AB6AXuDJfu-Br0hqCSqYYi2YkuK3y70BH6IHdD8hr2lONcUua5yVhbrl8pqLKhhSpas2gB98IE3bsMqYP5iVK3Z1ATIbtt0LkxlLZluoYFiC4On2-YSHZ4CvK62aj_W3KVPoPAQxzRJ-JGN5D6GbZ7sm9nyMcwrNZvrri1uvIrsAqbQKsM1Dho5WA-xqT92P8hHHmiz0Mr1qaaE1-FP94Iwd0O5veNR83585_W8IAthrXEjnA-Ib53yj694kWdPCUZ3HZnNduLeYnnoFNNM"/>
</div>
<span class="text-slate-600 dark:text-slate-300">Sarah J.</span>
</div>
</td>
<td class="px-6 py-4 text-right text-slate-600 dark:text-slate-300">45m</td>
</tr>
<!-- Row 3 -->
<tr class="hover:bg-slate-50 dark:hover:bg-surface-dark-light/50 transition-colors">
<td class="px-6 py-4 font-medium text-slate-900 dark:text-white">#LD-9921</td>
<td class="px-6 py-4 text-slate-600 dark:text-slate-300">
<div class="flex items-center gap-2">
<span>MIA</span>
<span class="material-symbols-outlined text-xs text-slate-400">arrow_forward</span>
<span>ATL</span>
</div>
</td>
<td class="px-6 py-4">
<span class="inline-flex items-center gap-1.5 px-2.5 py-1 rounded-full text-xs font-medium bg-emerald-100 text-emerald-800 dark:bg-emerald-900/30 dark:text-emerald-300">
<span class="w-1.5 h-1.5 rounded-full bg-emerald-500"></span>
                                                    Scheduled
                                                </span>
</td>
<td class="px-6 py-4">
<div class="flex items-center gap-2">
<div class="h-6 w-6 rounded-full bg-slate-200 dark:bg-slate-700 overflow-hidden" data-alt="Driver placeholder">
<span class="material-symbols-outlined text-slate-400 text-sm p-1">person</span>
</div>
<span class="text-slate-400 dark:text-slate-500 italic">Assigning...</span>
</div>
</td>
<td class="px-6 py-4 text-right text-slate-600 dark:text-slate-300">Tomorrow</td>
</tr>
</tbody>
</table>
</div>
</div>
<!-- Map Overview Section -->
<a href="/client/tracking" class="block bg-white dark:bg-surface-dark rounded-xl border border-slate-200 dark:border-surface-dark-light shadow-sm p-5 h-80 relative overflow-hidden group">
<div class="absolute inset-0 bg-cover bg-center opacity-60 dark:opacity-40 hover:opacity-100 transition-opacity duration-700" data-alt="Map of United States with route lines" style="background-image: url('https://lh3.googleusercontent.com/aida-public/AB6AXuDIEesvOwLKbLXGCmPhmHPRNohXhLlxxm4VauQEIHzC_8172L2NxuTT_zI5K2SMz7Fa4UY9AdBWKUj8cP01p880_K29h1DVKm9OqYUFGh7WOv6MiVKVMKK875ZnSBt0-2v4bazGX_DFf7Xo0dBy59_nkgZ7w0gXDA2wb9vy7xD5oOYE51wGGQT5qZryJ51mw8J8hQJwwIQHCEjlOdS5421infgRawQmO2ciXgUghJZerPMtJkuZds2itYSSkwyP8mH6-9zDTmts-Eg');">
</div>
<div class="absolute top-5 left-5 z-10">
<h3 class="font-bold text-lg text-slate-900 dark:text-white bg-white/80 dark:bg-black/60 px-3 py-1 rounded backdrop-blur-sm">Live Fleet Map</h3>
</div>
<div class="absolute bottom-5 right-5 z-10">
<button class="bg-surface-dark-light hover:bg-slate-700 text-white px-4 py-2 rounded-lg text-sm font-semibold shadow-lg flex items-center gap-2">
<span class="material-symbols-outlined text-sm">open_in_full</span>
                                    Expand Map
                                </button>
</div>
</a>
</div>
<!-- Right Column: Bids & Support -->
<div class="xl:col-span-1 flex flex-col gap-6">
<!-- Live Bidding Widget -->
<div class="bg-white dark:bg-surface-dark rounded-xl border border-slate-200 dark:border-surface-dark-light shadow-sm overflow-hidden flex flex-col h-full max-h-[500px]">
<div class="p-5 border-b border-slate-200 dark:border-surface-dark-light flex items-center justify-between">
<div class="flex items-center gap-2">
<span class="material-symbols-outlined text-primary">notifications_active</span>
<h3 class="font-bold text-lg text-slate-900 dark:text-white">Recent Bids</h3>
</div>
<span class="bg-primary/20 text-primary text-xs font-bold px-2 py-1 rounded-full">5 New</span>
</div>
<div class="overflow-y-auto p-4 space-y-4">
<!-- Bid Item 1 -->
<div class="p-3 rounded-lg border border-slate-200 dark:border-surface-dark-light bg-slate-50 dark:bg-surface-dark-light/30">
<div class="flex justify-between items-start mb-2">
<div>
<p class="text-sm font-bold text-slate-900 dark:text-white">Load #442 (CHI -&gt; DET)</p>
<p class="text-xs text-slate-500 dark:text-slate-400">Carrier: FastTrack Logistics</p>
</div>
<p class="text-lg font-bold text-emerald-500">$800</p>
</div>
<div class="flex gap-2 mt-2">
<button class="flex-1 bg-primary text-white text-xs font-bold py-2 rounded hover:bg-blue-600 transition-colors">Accept</button>
<button class="flex-1 bg-white dark:bg-surface-dark-light text-slate-700 dark:text-slate-300 border border-slate-200 dark:border-slate-600 text-xs font-bold py-2 rounded hover:bg-slate-50 dark:hover:bg-surface-dark-light transition-colors">Counter</button>
</div>
</div>
<!-- Bid Item 2 -->
<div class="p-3 rounded-lg border border-slate-200 dark:border-surface-dark-light bg-slate-50 dark:bg-surface-dark-light/30">
<div class="flex justify-between items-start mb-2">
<div>
<p class="text-sm font-bold text-slate-900 dark:text-white">Load #442 (CHI -&gt; DET)</p>
<p class="text-xs text-slate-500 dark:text-slate-400">Carrier: Mike's Trucking</p>
</div>
<p class="text-lg font-bold text-slate-600 dark:text-slate-400 line-through decoration-red-500 decoration-2 text-sm mr-2">$950</p>
</div>
<div class="flex justify-between items-center mt-1">
<span class="text-xs text-slate-400">Offer expires in 2h</span>
<button class="text-primary text-xs font-bold hover:underline">View Details</button>
</div>
</div>
<div class="text-center pt-2">
<button class="text-sm text-slate-500 dark:text-slate-400 hover:text-primary font-medium">View all 5 bids</button>
</div>
</div>
</div>
<!-- Support Card -->
<div class="bg-gradient-to-br from-indigo-900 to-slate-900 rounded-xl p-6 text-white relative overflow-hidden shadow-lg">
<div class="absolute -right-4 -top-4 opacity-10">
<span class="material-symbols-outlined text-[120px]">support_agent</span>
</div>
<h3 class="font-bold text-lg mb-2 relative z-10">Need Assistance?</h3>
<p class="text-indigo-200 text-sm mb-4 relative z-10">Our logistics experts are available 24/7 to help with your shipments.</p>
<button class="w-full bg-white text-indigo-900 font-bold py-2.5 rounded-lg hover:bg-indigo-50 transition-colors flex items-center justify-center gap-2 relative z-10">
<span class="material-symbols-outlined text-sm">chat</span>
                                Contact Support
                            </button>
</div>
</div>
</div>
<!-- Recent History (Footer-like area) -->
<div class="pt-4 border-t border-slate-200 dark:border-surface-dark-light">
<h3 class="text-sm font-bold text-slate-500 dark:text-slate-400 uppercase tracking-wider mb-4">Recently Completed</h3>
<div class="grid grid-cols-1 md:grid-cols-3 gap-4">
<div class="flex items-center gap-3 p-3 rounded-lg border border-slate-200 dark:border-surface-dark-light bg-slate-50 dark:bg-surface-dark/40 opacity-70 hover:opacity-100 transition-opacity cursor-pointer">
<div class="h-10 w-10 rounded-full bg-emerald-100 dark:bg-emerald-900/30 flex items-center justify-center text-emerald-600 dark:text-emerald-400">
<span class="material-symbols-outlined">check</span>
</div>
<div>
<p class="text-sm font-bold text-slate-900 dark:text-white">Load #1029</p>
<p class="text-xs text-slate-500 dark:text-slate-400">Delivered Yesterday</p>
</div>
</div>
<div class="flex items-center gap-3 p-3 rounded-lg border border-slate-200 dark:border-surface-dark-light bg-slate-50 dark:bg-surface-dark/40 opacity-70 hover:opacity-100 transition-opacity cursor-pointer">
<div class="h-10 w-10 rounded-full bg-emerald-100 dark:bg-emerald-900/30 flex items-center justify-center text-emerald-600 dark:text-emerald-400">
<span class="material-symbols-outlined">check</span>
</div>
<div>
<p class="text-sm font-bold text-slate-900 dark:text-white">Load #1028</p>
<p class="text-xs text-slate-500 dark:text-slate-400">Delivered Oct 22</p>
</div>
</div>
<div class="flex items-center gap-3 p-3 rounded-lg border border-slate-200 dark:border-surface-dark-light bg-slate-50 dark:bg-surface-dark/40 opacity-70 hover:opacity-100 transition-opacity cursor-pointer">
<div class="h-10 w-10 rounded-full bg-emerald-100 dark:bg-emerald-900/30 flex items-center justify-center text-emerald-600 dark:text-emerald-400">
<span class="material-symbols-outlined">check</span>
</div>
<div>
<p class="text-sm font-bold text-slate-900 dark:text-white">Load #1015</p>
<p class="text-xs text-slate-500 dark:text-slate-400">Delivered Oct 20</p>
</div>
</div>
</div>
</div>
</div>
</main>
</div>
</div>
