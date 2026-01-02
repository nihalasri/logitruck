<script>
 import '../../layout.css';
</script>

<div class="relative flex h-auto min-h-screen w-full flex-col overflow-x-hidden bg-background-light dark:bg-background-dark font-display text-slate-900 dark:text-white antialiased selection:bg-primary/30">
<!-- Top Navigation -->
<header class="flex items-center justify-between whitespace-nowrap border-b border-solid border-gray-200 dark:border-[#232f48] bg-white dark:bg-[#111722] px-10 py-3 sticky top-0 z-50">
<div class="flex items-center gap-4 text-gray-900 dark:text-white">
<div class="size-6 text-primary">
<svg class="w-full h-full" fill="none" viewbox="0 0 48 48" xmlns="http://www.w3.org/2000/svg">
<path d="M13.8261 17.4264C16.7203 18.1174 20.2244 18.5217 24 18.5217C27.7756 18.5217 31.2797 18.1174 34.1739 17.4264C36.9144 16.7722 39.9967 15.2331 41.3563 14.1648L24.8486 40.6391C24.4571 41.267 23.5429 41.267 23.1514 40.6391L6.64374 14.1648C8.00331 15.2331 11.0856 16.7722 13.8261 17.4264Z" fill="currentColor"></path>
<path clip-rule="evenodd" d="M39.998 12.236C39.9944 12.2537 39.9875 12.2845 39.9748 12.3294C39.9436 12.4399 39.8949 12.5741 39.8346 12.7175C39.8168 12.7597 39.7989 12.8007 39.7813 12.8398C38.5103 13.7113 35.9788 14.9393 33.7095 15.4811C30.9875 16.131 27.6413 16.5217 24 16.5217C20.3587 16.5217 17.0125 16.131 14.2905 15.4811C12.0012 14.9346 9.44505 13.6897 8.18538 12.8168C8.17384 12.7925 8.16216 12.767 8.15052 12.7408C8.09919 12.6249 8.05721 12.5114 8.02977 12.411C8.00356 12.3152 8.00039 12.2667 8.00004 12.2612C8.00004 12.261 8 12.2607 8.00004 12.2612C8.00004 12.2359 8.0104 11.9233 8.68485 11.3686C9.34546 10.8254 10.4222 10.2469 11.9291 9.72276C14.9242 8.68098 19.1919 8 24 8C28.8081 8 33.0758 8.68098 36.0709 9.72276C37.5778 10.2469 38.6545 10.8254 39.3151 11.3686C39.9006 11.8501 39.9857 12.1489 39.998 12.236ZM4.95178 15.2312L21.4543 41.6973C22.6288 43.5809 25.3712 43.5809 26.5457 41.6973L43.0534 15.223C43.0709 15.1948 43.0878 15.1662 43.104 15.1371L41.3563 14.1648C43.104 15.1371 43.1038 15.1374 43.104 15.1371L43.1051 15.135L43.1065 15.1325L43.1101 15.1261L43.1199 15.1082C43.1276 15.094 43.1377 15.0754 43.1497 15.0527C43.1738 15.0075 43.2062 14.9455 43.244 14.8701C43.319 14.7208 43.4196 14.511 43.5217 14.2683C43.6901 13.8679 44 13.0689 44 12.2609C44 10.5573 43.003 9.22254 41.8558 8.2791C40.6947 7.32427 39.1354 6.55361 37.385 5.94477C33.8654 4.72057 29.133 4 24 4C18.867 4 14.1346 4.72057 10.615 5.94478C8.86463 6.55361 7.30529 7.32428 6.14419 8.27911C4.99695 9.22255 3.99999 10.5573 3.99999 12.2609C3.99999 13.1275 4.29264 13.9078 4.49321 14.3607C4.60375 14.6102 4.71348 14.8196 4.79687 14.9689C4.83898 15.0444 4.87547 15.1065 4.9035 15.1529C4.91754 15.1762 4.92954 15.1957 4.93916 15.2111L4.94662 15.223L4.95178 15.2312ZM35.9868 18.996L24 38.22L12.0131 18.996C12.4661 19.1391 12.9179 19.2658 13.3617 19.3718C16.4281 20.1039 20.0901 20.5217 24 20.5217C27.9099 20.5217 31.5719 20.1039 34.6383 19.3718C35.082 19.2658 35.5339 19.1391 35.9868 18.996Z" fill="currentColor" fill-rule="evenodd"></path>
</svg>
</div>
<h2 class="text-gray-900 dark:text-white text-lg font-bold leading-tight tracking-[-0.015em]">LogisticsPro</h2>
</div>
<div class="flex flex-1 justify-end gap-8">
<div class="hidden lg:flex items-center gap-9">
<a class="text-gray-900 dark:text-white text-sm font-bold border-b-2 border-primary leading-normal" href="javascript:void(0)">Find Loads</a>
<a class="text-gray-500 dark:text-gray-400 hover:text-gray-900 dark:hover:text-white text-sm font-medium leading-normal" href="javascript:void(0)">My Bids</a>
<a class="text-gray-500 dark:text-gray-400 hover:text-gray-900 dark:hover:text-white text-sm font-medium leading-normal" href="javascript:void(0)">History</a>
<a class="text-gray-500 dark:text-gray-400 hover:text-gray-900 dark:hover:text-white text-sm font-medium leading-normal" href="javascript:void(0)">Payments</a>
</div>
<div class="flex gap-2">
<button class="flex min-w-[84px] max-w-[480px] cursor-pointer items-center justify-center overflow-hidden rounded-lg h-10 px-4 bg-primary text-white text-sm font-bold leading-normal tracking-[0.015em] hover:bg-blue-700 transition-colors">
<span class="truncate">Post Truck</span>
</button>
<a href="/driver/dashboard" class="flex max-w-[480px] cursor-pointer items-center justify-center overflow-hidden rounded-lg h-10 bg-gray-100 dark:bg-[#232f48] text-gray-900 dark:text-white gap-2 text-sm font-bold leading-normal tracking-[0.015em] min-w-0 px-2.5 hover:bg-gray-200 dark:hover:bg-[#2f3e5e] transition-colors">
<span class="material-symbols-outlined text-[20px]">dashboard</span>
</a>
<button class="flex max-w-[480px] cursor-pointer items-center justify-center overflow-hidden rounded-lg h-10 bg-gray-100 dark:bg-[#232f48] text-gray-900 dark:text-white gap-2 text-sm font-bold leading-normal tracking-[0.015em] min-w-0 px-2.5 hover:bg-gray-200 dark:hover:bg-[#2f3e5e] transition-colors">
<span class="material-symbols-outlined text-[20px]">notifications</span>
</button>
<button class="flex max-w-[480px] cursor-pointer items-center justify-center overflow-hidden rounded-lg h-10 bg-gray-100 dark:bg-[#232f48] text-gray-900 dark:text-white gap-2 text-sm font-bold leading-normal tracking-[0.015em] min-w-0 px-2.5 hover:bg-gray-200 dark:hover:bg-[#2f3e5e] transition-colors">
<span class="material-symbols-outlined text-[20px]">account_circle</span>
</button>
</div>
</div>
</header>
<main class="flex-1 px-4 lg:px-40 py-5 w-full flex justify-center">
<div class="flex flex-col max-w-[1200px] flex-1">
<!-- Page Header -->
<div class="flex flex-wrap justify-between gap-3 p-4">
<div class="flex min-w-72 flex-col gap-1">
<h1 class="text-gray-900 dark:text-white tracking-light text-[32px] font-bold leading-tight">Available Loads</h1>
<p class="text-gray-500 dark:text-[#92a4c9] text-sm font-normal leading-normal">142 Loads matching your criteria</p>
</div>
<button class="flex min-w-[84px] max-w-[480px] cursor-pointer items-center justify-center overflow-hidden rounded-lg h-10 px-4 bg-gray-100 dark:bg-[#232f48] text-gray-900 dark:text-white text-sm font-medium leading-normal hover:bg-gray-200 dark:hover:bg-[#2f3e5e] transition-colors border border-gray-200 dark:border-[#324467]">
<span class="material-symbols-outlined text-[20px] mr-2">bookmarks</span>
<span class="truncate">Saved Searches</span>
</button>
</div>
<!-- Search Filters -->
<div class="grid grid-cols-1 md:grid-cols-12 gap-4 px-4 py-3 items-end">
<label class="flex flex-col md:col-span-4">
<p class="text-gray-900 dark:text-white text-sm font-medium leading-normal pb-2">Origin</p>
<div class="relative">
<span class="absolute left-4 top-1/2 -translate-y-1/2 text-gray-500 dark:text-[#92a4c9] material-symbols-outlined">location_on</span>
<input class="form-input flex w-full min-w-0 flex-1 resize-none overflow-hidden rounded-lg text-gray-900 dark:text-white focus:outline-0 focus:ring-2 focus:ring-primary border border-gray-200 dark:border-[#324467] bg-white dark:bg-[#192233] focus:border-primary h-12 placeholder:text-gray-400 dark:placeholder:text-[#92a4c9] pl-11 pr-4 text-base font-normal leading-normal shadow-sm" placeholder="City or Zip Code" value=""/>
</div>
</label>
<label class="flex flex-col md:col-span-4">
<p class="text-gray-900 dark:text-white text-sm font-medium leading-normal pb-2">Destination</p>
<div class="relative">
<span class="absolute left-4 top-1/2 -translate-y-1/2 text-gray-500 dark:text-[#92a4c9] material-symbols-outlined">flag</span>
<input class="form-input flex w-full min-w-0 flex-1 resize-none overflow-hidden rounded-lg text-gray-900 dark:text-white focus:outline-0 focus:ring-2 focus:ring-primary border border-gray-200 dark:border-[#324467] bg-white dark:bg-[#192233] focus:border-primary h-12 placeholder:text-gray-400 dark:placeholder:text-[#92a4c9] pl-11 pr-4 text-base font-normal leading-normal shadow-sm" placeholder="City or Zip Code" value=""/>
</div>
</label>
<div class="flex md:col-span-4 gap-2">
<button class="flex h-12 w-full items-center justify-center gap-x-2 rounded-lg bg-primary text-white font-bold shadow-md hover:bg-blue-700 transition-colors">
<span class="material-symbols-outlined">search</span>
                        Search
                    </button>
</div>
</div>
<!-- Filter Chips -->
<div class="flex gap-3 px-4 py-2 flex-wrap items-center overflow-x-auto pb-4 scrollbar-hide">
<button class="flex h-9 shrink-0 items-center justify-center gap-x-2 rounded-lg border border-gray-200 dark:border-[#324467] bg-white dark:bg-[#232f48] pl-4 pr-3 hover:bg-gray-50 dark:hover:bg-[#2f3e5e] transition-colors shadow-sm">
<p class="text-gray-700 dark:text-white text-sm font-medium leading-normal">Pickup Date: All</p>
<span class="material-symbols-outlined text-[20px] text-gray-500 dark:text-white">keyboard_arrow_down</span>
</button>
<button class="flex h-9 shrink-0 items-center justify-center gap-x-2 rounded-lg border border-primary bg-primary/10 pl-4 pr-3 hover:bg-primary/20 transition-colors shadow-sm">
<p class="text-primary dark:text-blue-300 text-sm font-medium leading-normal">Trailer: Reefer</p>
<span class="material-symbols-outlined text-[20px] text-primary dark:text-blue-300">close</span>
</button>
<button class="flex h-9 shrink-0 items-center justify-center gap-x-2 rounded-lg border border-gray-200 dark:border-[#324467] bg-white dark:bg-[#232f48] pl-4 pr-3 hover:bg-gray-50 dark:hover:bg-[#2f3e5e] transition-colors shadow-sm">
<p class="text-gray-700 dark:text-white text-sm font-medium leading-normal">Weight: Any</p>
<span class="material-symbols-outlined text-[20px] text-gray-500 dark:text-white">keyboard_arrow_down</span>
</button>
<button class="flex h-9 shrink-0 items-center justify-center gap-x-2 rounded-lg border border-gray-200 dark:border-[#324467] bg-white dark:bg-[#232f48] pl-4 pr-3 hover:bg-gray-50 dark:hover:bg-[#2f3e5e] transition-colors shadow-sm">
<p class="text-gray-700 dark:text-white text-sm font-medium leading-normal">Price: $2k+</p>
<span class="material-symbols-outlined text-[20px] text-gray-500 dark:text-white">keyboard_arrow_down</span>
</button>
<div class="h-6 w-px bg-gray-300 dark:bg-[#324467] mx-2"></div>
<button class="flex h-9 shrink-0 items-center justify-center gap-x-2 rounded-lg border-0 bg-transparent pl-2 pr-2 hover:bg-gray-100 dark:hover:bg-[#232f48] transition-colors">
<span class="material-symbols-outlined text-[20px] text-gray-500 dark:text-white">sort</span>
<p class="text-gray-700 dark:text-white text-sm font-medium leading-normal">Sort: Newest</p>
</button>
</div>
<!-- Load Cards Grid -->
<div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4 px-4 py-3 pb-10">
<!-- Card 1 -->
<div class="flex flex-col gap-4 rounded-xl border border-solid border-gray-200 dark:border-[#324467] bg-white dark:bg-[#192233] p-6 shadow-sm hover:border-primary/50 transition-all duration-200 group relative">
<div class="flex flex-col gap-3">
<div class="flex items-start justify-between">
<div class="flex flex-col">
<h3 class="text-gray-900 dark:text-white text-lg font-bold leading-tight">Chicago, IL <span class="text-gray-400 mx-1">→</span> Miami, FL</h3>
<p class="text-gray-500 dark:text-[#92a4c9] text-xs font-normal mt-1">Ref #19384 • Posted 2h ago</p>
</div>
<span class="text-white text-[10px] uppercase font-bold tracking-wider rounded-full bg-red-500 px-2.5 py-1 text-center shadow-sm shadow-red-500/20">Hot Load</span>
</div>
<div class="h-px bg-gray-100 dark:bg-[#232f48] w-full my-1"></div>
<div class="flex flex-col gap-2">
<div class="flex items-center gap-3 text-sm text-gray-700 dark:text-gray-300">
<span class="material-symbols-outlined text-gray-400 dark:text-gray-500 text-[20px]">local_shipping</span>
<span class="font-medium">Reefer Trailer</span>
</div>
<div class="flex items-center gap-3 text-sm text-gray-700 dark:text-gray-300">
<span class="material-symbols-outlined text-gray-400 dark:text-gray-500 text-[20px]">straighten</span>
<span>1,300 miles</span>
<span class="text-gray-300 dark:text-gray-600">•</span>
<span>42,000 lbs</span>
</div>
<div class="flex items-center gap-3 text-sm text-gray-700 dark:text-gray-300">
<span class="material-symbols-outlined text-gray-400 dark:text-gray-500 text-[20px]">calendar_today</span>
<span>Pickup: Oct 24, 08:00 AM</span>
</div>
</div>
<div class="mt-2 bg-gray-50 dark:bg-[#111722] rounded-lg p-3 border border-gray-100 dark:border-[#232f48] flex items-center justify-between">
<div class="flex flex-col">
<span class="text-xs text-gray-500 dark:text-[#92a4c9] font-medium uppercase tracking-wider">Buy Now</span>
<span class="text-primary text-2xl font-black leading-tight tracking-tight">$3,200</span>
</div>
<div class="flex flex-col items-end">
<span class="text-xs text-gray-400 font-normal">$2.46/mi</span>
<span class="text-xs text-green-500 font-medium flex items-center gap-1">
<span class="material-symbols-outlined text-[14px]">check_circle</span> Instant Book
                                </span>
</div>
</div>
</div>
<div class="flex gap-3 mt-auto pt-2">
<button class="flex-1 h-10 rounded-lg bg-primary hover:bg-blue-700 text-white text-sm font-bold shadow-md shadow-blue-500/20 transition-colors">
                            Book Now
                        </button>
<button class="h-10 px-4 rounded-lg border border-gray-200 dark:border-[#324467] bg-transparent text-gray-700 dark:text-white text-sm font-bold hover:bg-gray-50 dark:hover:bg-[#232f48] transition-colors">
                            Details
                        </button>
</div>
</div>
<!-- Card 2 -->
<div class="flex flex-col gap-4 rounded-xl border border-solid border-gray-200 dark:border-[#324467] bg-white dark:bg-[#192233] p-6 shadow-sm hover:border-primary/50 transition-all duration-200 group relative">
<div class="flex flex-col gap-3">
<div class="flex items-start justify-between">
<div class="flex flex-col">
<h3 class="text-gray-900 dark:text-white text-lg font-bold leading-tight">Seattle, WA <span class="text-gray-400 mx-1">→</span> Portland, OR</h3>
<p class="text-gray-500 dark:text-[#92a4c9] text-xs font-normal mt-1">Ref #88221 • Ends in 15m</p>
</div>
<span class="text-white text-[10px] uppercase font-bold tracking-wider rounded-full bg-amber-500 px-2.5 py-1 text-center shadow-sm shadow-amber-500/20">Ending Soon</span>
</div>
<div class="h-px bg-gray-100 dark:bg-[#232f48] w-full my-1"></div>
<div class="flex flex-col gap-2">
<div class="flex items-center gap-3 text-sm text-gray-700 dark:text-gray-300">
<span class="material-symbols-outlined text-gray-400 dark:text-gray-500 text-[20px]">local_shipping</span>
<span class="font-medium">Dry Van</span>
</div>
<div class="flex items-center gap-3 text-sm text-gray-700 dark:text-gray-300">
<span class="material-symbols-outlined text-gray-400 dark:text-gray-500 text-[20px]">straighten</span>
<span>180 miles</span>
<span class="text-gray-300 dark:text-gray-600">•</span>
<span>12,000 lbs</span>
</div>
<div class="flex items-center gap-3 text-sm text-gray-700 dark:text-gray-300">
<span class="material-symbols-outlined text-gray-400 dark:text-gray-500 text-[20px]">calendar_today</span>
<span>Pickup: Today</span>
</div>
</div>
<div class="mt-2 bg-gray-50 dark:bg-[#111722] rounded-lg p-3 border border-gray-100 dark:border-[#232f48] flex items-center justify-between">
<div class="flex flex-col">
<span class="text-xs text-gray-500 dark:text-[#92a4c9] font-medium uppercase tracking-wider">Current Bid</span>
<span class="text-gray-900 dark:text-white text-2xl font-black leading-tight tracking-tight">$450</span>
</div>
<div class="flex flex-col items-end">
<span class="text-xs text-gray-400 font-normal">$2.50/mi</span>
<span class="text-xs text-amber-500 font-medium flex items-center gap-1">
<span class="material-symbols-outlined text-[14px]">gavel</span> 3 Bids
                                </span>
</div>
</div>
</div>
<div class="flex gap-3 mt-auto pt-2">
<button class="flex-1 h-10 rounded-lg bg-gray-900 dark:bg-white text-white dark:text-gray-900 hover:bg-gray-800 dark:hover:bg-gray-100 text-sm font-bold shadow-md transition-colors">
                            Place Bid
                        </button>
<button class="h-10 px-4 rounded-lg border border-gray-200 dark:border-[#324467] bg-transparent text-gray-700 dark:text-white text-sm font-bold hover:bg-gray-50 dark:hover:bg-[#232f48] transition-colors">
                            Details
                        </button>
</div>
</div>
<!-- Card 3 -->
<div class="flex flex-col gap-4 rounded-xl border border-solid border-gray-200 dark:border-[#324467] bg-white dark:bg-[#192233] p-6 shadow-sm hover:border-primary/50 transition-all duration-200 group relative">
<div class="flex flex-col gap-3">
<div class="flex items-start justify-between">
<div class="flex flex-col">
<h3 class="text-gray-900 dark:text-white text-lg font-bold leading-tight">Austin, TX <span class="text-gray-400 mx-1">→</span> Dallas, TX</h3>
<p class="text-gray-500 dark:text-[#92a4c9] text-xs font-normal mt-1">Ref #77321 • Just now</p>
</div>
<span class="text-white text-[10px] uppercase font-bold tracking-wider rounded-full bg-green-500 px-2.5 py-1 text-center shadow-sm shadow-green-500/20">New</span>
</div>
<div class="h-px bg-gray-100 dark:bg-[#232f48] w-full my-1"></div>
<div class="flex flex-col gap-2">
<div class="flex items-center gap-3 text-sm text-gray-700 dark:text-gray-300">
<span class="material-symbols-outlined text-gray-400 dark:text-gray-500 text-[20px]">local_shipping</span>
<span class="font-medium">Flatbed</span>
</div>
<div class="flex items-center gap-3 text-sm text-gray-700 dark:text-gray-300">
<span class="material-symbols-outlined text-gray-400 dark:text-gray-500 text-[20px]">straighten</span>
<span>200 miles</span>
<span class="text-gray-300 dark:text-gray-600">•</span>
<span>45,000 lbs</span>
</div>
<div class="flex items-center gap-3 text-sm text-gray-700 dark:text-gray-300">
<span class="material-symbols-outlined text-gray-400 dark:text-gray-500 text-[20px]">calendar_today</span>
<span>Pickup: Oct 25</span>
</div>
</div>
<div class="mt-2 bg-gray-50 dark:bg-[#111722] rounded-lg p-3 border border-gray-100 dark:border-[#232f48] flex items-center justify-between">
<div class="flex flex-col">
<span class="text-xs text-gray-500 dark:text-[#92a4c9] font-medium uppercase tracking-wider">Fixed Rate</span>
<span class="text-gray-900 dark:text-white text-2xl font-black leading-tight tracking-tight">$600</span>
</div>
<div class="flex flex-col items-end">
<span class="text-xs text-gray-400 font-normal">$3.00/mi</span>
<span class="text-xs text-blue-400 font-medium flex items-center gap-1">
<span class="material-symbols-outlined text-[14px]">verified</span> Trusted Broker
                                </span>
</div>
</div>
</div>
<div class="flex gap-3 mt-auto pt-2">
<button class="flex-1 h-10 rounded-lg bg-primary hover:bg-blue-700 text-white text-sm font-bold shadow-md shadow-blue-500/20 transition-colors">
                            Accept Load
                        </button>
<button class="h-10 px-4 rounded-lg border border-gray-200 dark:border-[#324467] bg-transparent text-gray-700 dark:text-white text-sm font-bold hover:bg-gray-50 dark:hover:bg-[#232f48] transition-colors">
                            Details
                        </button>
</div>
</div>
<!-- Card 4 -->
<div class="flex flex-col gap-4 rounded-xl border border-solid border-gray-200 dark:border-[#324467] bg-white dark:bg-[#192233] p-6 shadow-sm hover:border-primary/50 transition-all duration-200 group relative opacity-80 hover:opacity-100">
<div class="flex flex-col gap-3">
<div class="flex items-start justify-between">
<div class="flex flex-col">
<h3 class="text-gray-900 dark:text-white text-lg font-bold leading-tight">Denver, CO <span class="text-gray-400 mx-1">→</span> Phoenix, AZ</h3>
<p class="text-gray-500 dark:text-[#92a4c9] text-xs font-normal mt-1">Ref #11294 • Posted 5h ago</p>
</div>
<span class="text-gray-600 dark:text-gray-300 text-[10px] uppercase font-bold tracking-wider rounded-full bg-gray-200 dark:bg-gray-700 px-2.5 py-1 text-center">Open</span>
</div>
<div class="h-px bg-gray-100 dark:bg-[#232f48] w-full my-1"></div>
<div class="flex flex-col gap-2">
<div class="flex items-center gap-3 text-sm text-gray-700 dark:text-gray-300">
<span class="material-symbols-outlined text-gray-400 dark:text-gray-500 text-[20px]">local_shipping</span>
<span class="font-medium">Dry Van</span>
</div>
<div class="flex items-center gap-3 text-sm text-gray-700 dark:text-gray-300">
<span class="material-symbols-outlined text-gray-400 dark:text-gray-500 text-[20px]">straighten</span>
<span>850 miles</span>
<span class="text-gray-300 dark:text-gray-600">•</span>
<span>38,000 lbs</span>
</div>
<div class="flex items-center gap-3 text-sm text-gray-700 dark:text-gray-300">
<span class="material-symbols-outlined text-gray-400 dark:text-gray-500 text-[20px]">calendar_today</span>
<span>Pickup: Oct 26</span>
</div>
</div>
<div class="mt-2 bg-gray-50 dark:bg-[#111722] rounded-lg p-3 border border-gray-100 dark:border-[#232f48] flex items-center justify-between">
<div class="flex flex-col">
<span class="text-xs text-gray-500 dark:text-[#92a4c9] font-medium uppercase tracking-wider">Target Rate</span>
<span class="text-gray-700 dark:text-gray-200 text-2xl font-black leading-tight tracking-tight">$1,900</span>
</div>
<div class="flex flex-col items-end">
<span class="text-xs text-gray-400 font-normal">$2.23/mi</span>
<span class="text-xs text-gray-500 font-medium flex items-center gap-1">
                                    Make an offer
                                </span>
</div>
</div>
</div>
<div class="flex gap-3 mt-auto pt-2">
<button class="flex-1 h-10 rounded-lg bg-gray-100 dark:bg-[#232f48] text-gray-900 dark:text-white hover:bg-gray-200 dark:hover:bg-[#2f3e5e] text-sm font-bold shadow-sm transition-colors border border-gray-200 dark:border-transparent">
                            Offer Rate
                        </button>
<button class="h-10 px-4 rounded-lg border border-gray-200 dark:border-[#324467] bg-transparent text-gray-700 dark:text-white text-sm font-bold hover:bg-gray-50 dark:hover:bg-[#232f48] transition-colors">
                            Details
                        </button>
</div>
</div>
<!-- Card 5 -->
<div class="flex flex-col gap-4 rounded-xl border border-solid border-gray-200 dark:border-[#324467] bg-white dark:bg-[#192233] p-6 shadow-sm hover:border-primary/50 transition-all duration-200 group relative">
<div class="flex flex-col gap-3">
<div class="flex items-start justify-between">
<div class="flex flex-col">
<h3 class="text-gray-900 dark:text-white text-lg font-bold leading-tight">Nashville, TN <span class="text-gray-400 mx-1">→</span> Atlanta, GA</h3>
<p class="text-gray-500 dark:text-[#92a4c9] text-xs font-normal mt-1">Ref #33921 • Posted 10m ago</p>
</div>
<span class="text-white text-[10px] uppercase font-bold tracking-wider rounded-full bg-green-500 px-2.5 py-1 text-center shadow-sm shadow-green-500/20">New</span>
</div>
<div class="h-px bg-gray-100 dark:bg-[#232f48] w-full my-1"></div>
<div class="flex flex-col gap-2">
<div class="flex items-center gap-3 text-sm text-gray-700 dark:text-gray-300">
<span class="material-symbols-outlined text-gray-400 dark:text-gray-500 text-[20px]">local_shipping</span>
<span class="font-medium">Power Only</span>
</div>
<div class="flex items-center gap-3 text-sm text-gray-700 dark:text-gray-300">
<span class="material-symbols-outlined text-gray-400 dark:text-gray-500 text-[20px]">straighten</span>
<span>250 miles</span>
<span class="text-gray-300 dark:text-gray-600">•</span>
<span>30,000 lbs</span>
</div>
<div class="flex items-center gap-3 text-sm text-gray-700 dark:text-gray-300">
<span class="material-symbols-outlined text-gray-400 dark:text-gray-500 text-[20px]">calendar_today</span>
<span>Pickup: Oct 25</span>
</div>
</div>
<div class="mt-2 bg-gray-50 dark:bg-[#111722] rounded-lg p-3 border border-gray-100 dark:border-[#232f48] flex items-center justify-between">
<div class="flex flex-col">
<span class="text-xs text-gray-500 dark:text-[#92a4c9] font-medium uppercase tracking-wider">Buy Now</span>
<span class="text-primary text-2xl font-black leading-tight tracking-tight">$850</span>
</div>
<div class="flex flex-col items-end">
<span class="text-xs text-gray-400 font-normal">$3.40/mi</span>
<span class="text-xs text-blue-400 font-medium flex items-center gap-1">
<span class="material-symbols-outlined text-[14px]">flash_on</span> Fast Pay
                                </span>
</div>
</div>
</div>
<div class="flex gap-3 mt-auto pt-2">
<button class="flex-1 h-10 rounded-lg bg-primary hover:bg-blue-700 text-white text-sm font-bold shadow-md shadow-blue-500/20 transition-colors">
                            Book Now
                        </button>
<button class="h-10 px-4 rounded-lg border border-gray-200 dark:border-[#324467] bg-transparent text-gray-700 dark:text-white text-sm font-bold hover:bg-gray-50 dark:hover:bg-[#232f48] transition-colors">
                            Details
                        </button>
</div>
</div>
<!-- Card 6 -->
<div class="flex flex-col gap-4 rounded-xl border border-solid border-gray-200 dark:border-[#324467] bg-white dark:bg-[#192233] p-6 shadow-sm hover:border-primary/50 transition-all duration-200 group relative">
<div class="flex flex-col gap-3">
<div class="flex items-start justify-between">
<div class="flex flex-col">
<h3 class="text-gray-900 dark:text-white text-lg font-bold leading-tight">Las Vegas, NV <span class="text-gray-400 mx-1">→</span> Reno, NV</h3>
<p class="text-gray-500 dark:text-[#92a4c9] text-xs font-normal mt-1">Ref #48291 • Posted 1d ago</p>
</div>
<span class="text-gray-600 dark:text-gray-300 text-[10px] uppercase font-bold tracking-wider rounded-full bg-gray-200 dark:bg-gray-700 px-2.5 py-1 text-center">Open</span>
</div>
<div class="h-px bg-gray-100 dark:bg-[#232f48] w-full my-1"></div>
<div class="flex flex-col gap-2">
<div class="flex items-center gap-3 text-sm text-gray-700 dark:text-gray-300">
<span class="material-symbols-outlined text-gray-400 dark:text-gray-500 text-[20px]">local_shipping</span>
<span class="font-medium">Flatbed</span>
</div>
<div class="flex items-center gap-3 text-sm text-gray-700 dark:text-gray-300">
<span class="material-symbols-outlined text-gray-400 dark:text-gray-500 text-[20px]">straighten</span>
<span>450 miles</span>
<span class="text-gray-300 dark:text-gray-600">•</span>
<span>40,000 lbs</span>
</div>
<div class="flex items-center gap-3 text-sm text-gray-700 dark:text-gray-300">
<span class="material-symbols-outlined text-gray-400 dark:text-gray-500 text-[20px]">calendar_today</span>
<span>Pickup: Oct 28</span>
</div>
</div>
<div class="mt-2 bg-gray-50 dark:bg-[#111722] rounded-lg p-3 border border-gray-100 dark:border-[#232f48] flex items-center justify-between">
<div class="flex flex-col">
<span class="text-xs text-gray-500 dark:text-[#92a4c9] font-medium uppercase tracking-wider">Current Bid</span>
<span class="text-gray-900 dark:text-white text-2xl font-black leading-tight tracking-tight">$1,100</span>
</div>
<div class="flex flex-col items-end">
<span class="text-xs text-gray-400 font-normal">$2.44/mi</span>
<span class="text-xs text-amber-500 font-medium flex items-center gap-1">
<span class="material-symbols-outlined text-[14px]">timer</span> 2h left
                                </span>
</div>
</div>
</div>
<div class="flex gap-3 mt-auto pt-2">
<button class="flex-1 h-10 rounded-lg bg-gray-900 dark:bg-white text-white dark:text-gray-900 hover:bg-gray-800 dark:hover:bg-gray-100 text-sm font-bold shadow-md transition-colors">
                            Place Bid
                        </button>
<button class="h-10 px-4 rounded-lg border border-gray-200 dark:border-[#324467] bg-transparent text-gray-700 dark:text-white text-sm font-bold hover:bg-gray-50 dark:hover:bg-[#232f48] transition-colors">
                            Details
                        </button>
</div>
</div>
</div>
<!-- Pagination (Optional for polish) -->
<div class="flex justify-center pb-8">
<nav class="flex items-center gap-2">
<button class="p-2 rounded-lg border border-gray-200 dark:border-[#324467] text-gray-500 dark:text-gray-400 hover:bg-gray-100 dark:hover:bg-[#232f48]">
<span class="material-symbols-outlined">chevron_left</span>
</button>
<button class="w-9 h-9 flex items-center justify-center rounded-lg bg-primary text-white font-bold text-sm">1</button>
<button class="w-9 h-9 flex items-center justify-center rounded-lg border border-gray-200 dark:border-[#324467] text-gray-700 dark:text-white hover:bg-gray-100 dark:hover:bg-[#232f48] font-medium text-sm">2</button>
<button class="w-9 h-9 flex items-center justify-center rounded-lg border border-gray-200 dark:border-[#324467] text-gray-700 dark:text-white hover:bg-gray-100 dark:hover:bg-[#232f48] font-medium text-sm">3</button>
<span class="text-gray-500 dark:text-gray-400">...</span>
<button class="w-9 h-9 flex items-center justify-center rounded-lg border border-gray-200 dark:border-[#324467] text-gray-700 dark:text-white hover:bg-gray-100 dark:hover:bg-[#232f48] font-medium text-sm">12</button>
<button class="p-2 rounded-lg border border-gray-200 dark:border-[#324467] text-gray-500 dark:text-gray-400 hover:bg-gray-100 dark:hover:bg-[#232f48]">
<span class="material-symbols-outlined">chevron_right</span>
</button>
</nav>
</div>
</div>
</main>
</div>
