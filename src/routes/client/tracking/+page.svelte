<script>
  import '../../layout.css';
</script>

<div class="bg-background-light dark:bg-background-dark text-slate-900 dark:text-white h-screen flex flex-col overflow-hidden">
<!-- Top Navigation Bar -->
<header class="flex items-center justify-between whitespace-nowrap border-b border-solid border-border-dark bg-[#111722] px-6 py-3 shrink-0 z-30">
<div class="flex items-center gap-4 text-white">
<div class="size-8 bg-primary/20 rounded flex items-center justify-center text-primary">
<span class="material-symbols-outlined text-[20px]">local_shipping</span>
</div>
<h2 class="text-white text-lg font-bold leading-tight tracking-[-0.015em]">LogisticsPro</h2>
</div>
<div class="flex flex-1 justify-end gap-8 items-center">
<div class="hidden md:flex items-center gap-9">
<a class="text-white text-sm font-medium leading-normal hover:text-primary transition-colors" href="/client/dashboard">Dashboard</a>
<a class="text-primary text-sm font-medium leading-normal" href="javascript:void(0)">Shipments</a>
<a class="text-white text-sm font-medium leading-normal hover:text-primary transition-colors" href="javascript:void(0)">Drivers</a>
<a class="text-white text-sm font-medium leading-normal hover:text-primary transition-colors" href="javascript:void(0)">Reports</a>
</div>
<div class="bg-center bg-no-repeat aspect-square bg-cover rounded-full size-10 ring-2 ring-border-dark" data-alt="User profile picture" style='background-image: url("https://lh3.googleusercontent.com/aida-public/AB6AXuA7dOdkMzOnCjPqdvUbQjRACyW8NkX9g-bRm1edSoCJe_Px2egDaOqIcEF8XU_XH7tgEb0_dF97Hrp0FWahf8RRquh5p3pzRJyKcz6M_hfFgUR5MaSr5I70z8Ck-oTd0W3g4Eu7ubMR1dOm4vt0JWHnsRpO-Vdft0LrK_7f9Mj7PJMUW7ZfHWhaZeym2SV022EUNJRY7K7PPBCuoCgMj4ADaI8g8nNtxV10Djyi1XctygvcYDJFte-wlw8EzvJTAxHzDaP6w4vV6F4");'></div>
</div>
</header>
<!-- Main Content Area -->
<div class="flex flex-1 overflow-hidden relative">
<!-- Interactive Map Area -->
<main class="flex-1 relative bg-[#0f1521] overflow-hidden group/map">
<!-- Map Background Image -->
<div class="absolute inset-0 w-full h-full bg-cover bg-center opacity-80" data-alt="Dark themed map showing roads and terrain" data-location="Midwest USA" style='background-image: url("https://lh3.googleusercontent.com/aida-public/AB6AXuBEAvV0MB5wsR3BOJUWVqwAVS0DxkzAf80hrWizMZxFqcMO8Wn4qdzaxbFEG61lGaSDaGJUJFjlp-0EqXxPJqAFiaACeDVti0eg5kWTvY8xSRxEQXhZfUZoCZgI-sI9oouq7RDKwRWJmYjqimKVQsqeIatfZKSuV6suLtn7HWg2RlqhXMNOKGqrIxhiHo3mwQ-ThW8s1KPXe8dBzItR3ReLib2VXTjs0zul8t_zUC1sbmixdNo9Mj7FfpY9OiONOaLVvtbPBN7zzuc"); filter: grayscale(100%) invert(85%) contrast(150%) hue-rotate(180deg) brightness(85%);'>
</div>
<!-- Map Overlay Gradient -->
<div class="absolute inset-0 bg-[#111722]/30 pointer-events-none"></div>
<!-- Floating Search Bar -->
<div class="absolute top-6 left-6 z-20 w-full max-w-md shadow-xl">
<label class="flex flex-col h-12">
<div class="flex w-full flex-1 items-stretch rounded-xl h-full shadow-lg ring-1 ring-white/10">
<div class="text-text-secondary flex border-none bg-panel-dark/95 backdrop-blur-md items-center justify-center pl-4 rounded-l-xl border-r-0">
<span class="material-symbols-outlined">search</span>
</div>
<input class="form-input flex w-full min-w-0 flex-1 resize-none overflow-hidden rounded-xl text-white focus:outline-0 focus:ring-0 border-none bg-panel-dark/95 backdrop-blur-md focus:border-none h-full placeholder:text-text-secondary px-4 rounded-l-none border-l-0 pl-2 text-base font-normal leading-normal" placeholder="Search location, Depot or Shipment ID..." value=""/>
</div>
</label>
</div>
<!-- Map Markers (Simulated) -->
<!-- Truck Icon -->
<div class="absolute top-[45%] left-[55%] -translate-x-1/2 -translate-y-1/2 z-10 flex flex-col items-center group cursor-pointer">
<div class="bg-primary text-white p-2 rounded-full shadow-lg shadow-primary/40 animate-pulse">
<span class="material-symbols-outlined text-[24px]">local_shipping</span>
</div>
<!-- Tooltip -->
<div class="absolute bottom-full mb-2 bg-panel-dark text-white text-xs px-3 py-1.5 rounded-lg shadow-xl opacity-0 group-hover:opacity-100 transition-opacity whitespace-nowrap border border-border-dark">
                    Speed: 65mph
                </div>
</div>
<!-- Start Point -->
<div class="absolute top-[35%] left-[40%] z-0 text-text-secondary opacity-80">
<span class="material-symbols-outlined text-[32px]">trip_origin</span>
</div>
<!-- End Point -->
<div class="absolute top-[60%] left-[70%] z-0 text-red-500 drop-shadow-md">
<span class="material-symbols-outlined text-[32px] fill">location_on</span>
</div>
<!-- Map Controls (Bottom Right) -->
<div class="absolute bottom-6 right-6 flex flex-col gap-3 z-20">
<!-- Layers -->
<button class="flex size-10 items-center justify-center rounded-lg bg-panel-dark hover:bg-border-dark text-white shadow-lg ring-1 ring-white/10 transition-colors">
<span class="material-symbols-outlined">layers</span>
</button>
<!-- Zoom Controls -->
<div class="flex flex-col rounded-lg bg-panel-dark shadow-lg ring-1 ring-white/10 overflow-hidden">
<button class="flex size-10 items-center justify-center hover:bg-border-dark text-white border-b border-white/5 transition-colors">
<span class="material-symbols-outlined">add</span>
</button>
<button class="flex size-10 items-center justify-center hover:bg-border-dark text-white transition-colors">
<span class="material-symbols-outlined">remove</span>
</button>
</div>
<!-- Navigation Centering -->
<button class="flex size-10 items-center justify-center rounded-lg bg-primary text-white shadow-lg shadow-primary/30 transition-transform active:scale-95">
<span class="material-symbols-outlined">navigation</span>
</button>
</div>
<!-- Map Attribution (Bottom Left) -->
<div class="absolute bottom-2 left-2 px-2 py-1 bg-black/40 backdrop-blur-sm rounded text-[10px] text-white/60 pointer-events-none">
                © Mapbox © OpenStreetMap
            </div>
</main>
<!-- Sidebar / Route Info Panel -->
<aside class="w-96 bg-[#111722] border-l border-border-dark flex flex-col z-30 shadow-2xl overflow-y-auto scrollbar-hide">
<!-- Header Status -->
<div class="pt-6 pb-2 px-6">
<div class="flex justify-between items-start mb-2">
<h2 class="text-white tracking-light text-[24px] font-bold leading-tight">Shipment #12345</h2>
<button class="text-text-secondary hover:text-white">
<span class="material-symbols-outlined">more_horiz</span>
</button>
</div>
<div class="flex gap-2 flex-wrap">
<div class="flex h-7 shrink-0 items-center justify-center gap-x-1.5 rounded-full bg-primary/20 border border-primary/30 pl-2 pr-3">
<span class="material-symbols-outlined text-primary text-[16px]">fiber_manual_record</span>
<p class="text-primary text-xs font-semibold uppercase tracking-wide">In Transit</p>
</div>
<div class="flex h-7 shrink-0 items-center justify-center gap-x-1.5 rounded-full bg-emerald-500/10 border border-emerald-500/20 pl-2 pr-3">
<span class="material-symbols-outlined text-emerald-500 text-[16px]">schedule</span>
<p class="text-emerald-500 text-xs font-semibold uppercase tracking-wide">On Time</p>
</div>
</div>
</div>
<hr class="border-border-dark my-4 mx-6"/>
<!-- Trip Summary Stats -->
<div class="px-6 grid grid-cols-2 gap-4 mb-4">
<div class="bg-panel-dark rounded-lg p-3 border border-white/5">
<p class="text-text-secondary text-xs uppercase font-medium mb-1">Dist. Remaining</p>
<p class="text-white text-lg font-bold">142 mi</p>
</div>
<div class="bg-panel-dark rounded-lg p-3 border border-white/5">
<p class="text-text-secondary text-xs uppercase font-medium mb-1">Est. Arrival</p>
<p class="text-white text-lg font-bold">2:30 PM</p>
</div>
</div>
<!-- Timeline -->
<div class="flex-1 px-2 pb-6">
<h3 class="text-white text-sm font-bold px-4 mb-3 uppercase tracking-wider opacity-80">Route Progress</h3>
<div class="grid grid-cols-[40px_1fr] gap-x-2 px-4">
<!-- Step 1: Past -->
<div class="flex flex-col items-center gap-1 pt-1.5">
<span class="material-symbols-outlined text-text-secondary text-[20px]">trip_origin</span>
<div class="w-[2px] bg-border-dark h-full grow rounded-full"></div>
</div>
<div class="flex flex-1 flex-col pb-6">
<p class="text-white text-base font-medium leading-normal">Chicago, IL</p>
<p class="text-text-secondary text-sm font-normal leading-normal">Departed 8:00 AM</p>
</div>
<!-- Step 2: Current -->
<div class="flex flex-col items-center gap-1">
<div class="w-[2px] bg-border-dark h-4 rounded-full"></div>
<div class="bg-primary rounded-full p-1 shadow-[0_0_12px_rgba(19,91,236,0.6)] z-10">
<span class="material-symbols-outlined text-white text-[16px]">local_shipping</span>
</div>
<div class="w-[2px] bg-primary h-full grow rounded-full shadow-[0_0_8px_rgba(19,91,236,0.4)]"></div>
</div>
<div class="flex flex-1 flex-col py-1 pb-6">
<div class="flex justify-between items-center">
<p class="text-primary text-base font-bold leading-normal">Gary, IN (Current)</p>
<span class="animate-pulse flex h-2 w-2 rounded-full bg-primary"></span>
</div>
<p class="text-text-secondary text-sm font-normal leading-normal">I-90 E • Traffic Moderate</p>
</div>
<!-- Step 3: Future -->
<div class="flex flex-col items-center gap-1">
<div class="w-[2px] bg-primary h-4 rounded-full"></div>
<span class="material-symbols-outlined text-white text-[20px] opacity-50">location_on</span>
<div class="w-[2px] bg-transparent h-2 grow"></div>
</div>
<div class="flex flex-1 flex-col pt-1">
<p class="text-white/60 text-base font-medium leading-normal">Detroit, MI</p>
<p class="text-text-secondary text-sm font-normal leading-normal">Scheduled 2:30 PM</p>
</div>
</div>
</div>
<!-- Driver & Cargo Info -->
<div class="bg-panel-dark border-t border-border-dark p-6 mt-auto">
<h3 class="text-text-secondary text-xs font-bold mb-4 uppercase tracking-wider">Driver Details</h3>
<div class="flex items-center gap-4 mb-4">
<div class="relative">
<div class="bg-center bg-no-repeat bg-cover rounded-full size-12 ring-2 ring-white/10" data-alt="Driver portrait" style='background-image: url("https://lh3.googleusercontent.com/aida-public/AB6AXuDvY6NA1xfg60utO3O9kW-yRhrw2gL-KemE36uFvv1ATdZUv1mNpDqMcKBR_S_jzd2SZL6n05rvk8MGG0XBBBLiVGn4fHMgFt8A4Z78C2AP1W3G4ulcfT-dTZ7IlZw_Rep0xsZ8j4FatCJ4rTiEhIEZCc-VwL9vHUZblR6udzvUnBp5zUGIMfmzLCcIQlkSa7EnXS33EWC9ZBDjWBSUD6WuxG3e4tRc41otKVIa7LveQl0IIASALNOqrj1uE7ixGcd_uknTlLVASAw");'></div>
<div class="absolute bottom-0 right-0 size-3 bg-emerald-500 rounded-full border-2 border-panel-dark"></div>
</div>
<div class="flex-1">
<p class="text-white font-medium text-base">Michael Chen</p>
<div class="flex items-center gap-2 text-text-secondary text-sm">
<span class="flex items-center gap-1"><span class="material-symbols-outlined text-[14px]">star</span> 4.9</span>
<span>•</span>
<span>Volvo VNL 860</span>
</div>
</div>
<button class="text-primary hover:bg-primary/10 p-2 rounded-full transition-colors">
<span class="material-symbols-outlined">chat</span>
</button>
</div>
<div class="grid grid-cols-2 gap-3">
<button class="flex-1 bg-white/5 hover:bg-white/10 text-white font-medium py-2.5 px-4 rounded-lg text-sm transition-colors border border-white/5 flex items-center justify-center gap-2">
<span class="material-symbols-outlined text-[18px]">description</span>
                        Manifest
                    </button>
<button class="flex-1 bg-primary hover:bg-primary/90 text-white font-medium py-2.5 px-4 rounded-lg text-sm transition-colors flex items-center justify-center gap-2">
<span class="material-symbols-outlined text-[18px]">call</span>
                        Contact
                    </button>
</div>
</div>
</aside>
</div>
</div>
