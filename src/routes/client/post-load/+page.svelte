<script>
 import '../../layout.css';
 import { goto } from '$app/navigation';
 import ClientSidebar from '$lib/components/ClientSidebar.svelte';

 let isSubmitted = $state(false);

 function handleSubmit(e) {
   if (e) e.preventDefault();
   isSubmitted = true;
   setTimeout(() => {
     goto('/client/loads');
   }, 1500);
 }
</script>

<div class="bg-background-light dark:bg-background-dark text-slate-900 dark:text-white font-display antialiased flex h-screen overflow-hidden">
    <ClientSidebar activePage="my loads" />

    <main class="flex-1 flex flex-col overflow-hidden">
        <!-- Scrollable Content Area -->
        <div class="flex-1 overflow-y-auto">
            <div class="flex flex-col items-center px-4 py-8 md:px-10">
                <div class="flex w-full max-w-[960px] flex-col gap-6">
<!-- Breadcrumbs -->
<div class="flex flex-wrap items-center gap-2">
<a class="text-[#92a4c9] hover:text-primary transition-colors text-sm font-medium" href="/client/dashboard">Home</a>
<span class="material-symbols-outlined text-[#92a4c9] text-[16px]">chevron_right</span>
<a class="text-[#92a4c9] hover:text-primary transition-colors text-sm font-medium" href="/client/loads">My Loads</a>
<span class="material-symbols-outlined text-[#92a4c9] text-[16px]">chevron_right</span>
<span class="text-white text-sm font-medium">New Post</span>
</div>
<!-- Page Header -->
<div class="flex flex-col gap-2">
<h1 class="text-white text-3xl md:text-4xl font-black leading-tight tracking-[-0.033em]">Post a New Load</h1>
<p class="text-[#92a4c9] text-base font-normal leading-normal max-w-2xl">Enter the route, cargo details, and any special instructions to connect with the right driver for your shipment.</p>
</div>
<form class="flex flex-col gap-8" onsubmit={handleSubmit}>
    {#if isSubmitted}
        <div class="rounded-xl bg-emerald-500/10 border border-emerald-500/20 p-4 text-emerald-500 flex items-center gap-3 animate-bounce">
            <span class="material-symbols-outlined">check_circle</span>
            <span class="font-bold">Load posted successfully! Redirecting...</span>
        </div>
    {/if}
<!-- Section 1: Route Information -->
<section class="flex flex-col gap-4 rounded-xl bg-[#192233] p-6 border border-[#232f48]">
<div class="flex items-center gap-3 border-b border-[#232f48] pb-4 mb-2">
<span class="material-symbols-outlined text-primary text-[24px]">map</span>
<h2 class="text-white text-xl font-bold">Route Information</h2>
</div>
<div class="grid grid-cols-1 gap-6 lg:grid-cols-2">
<!-- Pickup -->
<div class="flex flex-col gap-4">
<label class="flex flex-col gap-2">
<span class="text-white text-sm font-medium">Pickup Address</span>
<div class="relative">
<div class="absolute left-4 top-1/2 -translate-y-1/2 text-[#92a4c9]">
<span class="material-symbols-outlined text-[20px]">my_location</span>
</div>
<input class="w-full rounded-lg border border-[#324467] bg-[#111722] py-3 pl-11 pr-4 text-white placeholder-[#92a4c9] focus:border-primary focus:outline-none focus:ring-1 focus:ring-primary" placeholder="City, State or Zip Code" type="text"/>
</div>
</label>
<label class="flex flex-col gap-2">
<span class="text-white text-sm font-medium">Pickup Date &amp; Time</span>
<input class="w-full rounded-lg border border-[#324467] bg-[#111722] px-4 py-3 text-white placeholder-[#92a4c9] focus:border-primary focus:outline-none focus:ring-1 focus:ring-primary [color-scheme:dark]" type="datetime-local"/>
</label>
</div>
<!-- Drop-off -->
<div class="flex flex-col gap-4">
<label class="flex flex-col gap-2">
<span class="text-white text-sm font-medium">Drop-off Address</span>
<div class="relative">
<div class="absolute left-4 top-1/2 -translate-y-1/2 text-[#92a4c9]">
<span class="material-symbols-outlined text-[20px]">location_on</span>
</div>
<input class="w-full rounded-lg border border-[#324467] bg-[#111722] py-3 pl-11 pr-4 text-white placeholder-[#92a4c9] focus:border-primary focus:outline-none focus:ring-1 focus:ring-primary" placeholder="City, State or Zip Code" type="text"/>
</div>
</label>
<label class="flex flex-col gap-2">
<span class="text-white text-sm font-medium">Drop-off Date &amp; Time</span>
<input class="w-full rounded-lg border border-[#324467] bg-[#111722] px-4 py-3 text-white placeholder-[#92a4c9] focus:border-primary focus:outline-none focus:ring-1 focus:ring-primary [color-scheme:dark]" type="datetime-local"/>
</label>
</div>
</div>
</section>
<!-- Section 1.5: Service Category -->
<section class="flex flex-col gap-4 rounded-xl bg-[#192233] p-6 border border-[#232f48]">
<div class="flex items-center gap-3 border-b border-[#232f48] pb-4 mb-2">
<span class="material-symbols-outlined text-primary text-[24px]">category</span>
<h2 class="text-white text-xl font-bold">Service Category</h2>
</div>
<div class="grid grid-cols-1 gap-4 sm:grid-cols-2 lg:grid-cols-4">
    {#each ['Intra-city Delivery', 'Inter-city Transport', 'Packers & Movers', 'Enterprise Logistics'] as cat}
    <label class="flex items-center gap-3 p-4 rounded-xl border border-[#324467] bg-[#111722] cursor-pointer hover:border-primary/50 transition-colors has-[:checked]:border-primary has-[:checked]:bg-primary/10">
        <input type="radio" name="category" value={cat} class="accent-primary" checked={cat === 'Intra-city Delivery'} />
        <span class="text-sm font-medium">{cat}</span>
    </label>
    {/each}
</div>
</section>

<!-- Section 2: Load & Vehicle Details -->
<section class="flex flex-col gap-4 rounded-xl bg-[#192233] p-6 border border-[#232f48]">
<div class="flex items-center gap-3 border-b border-[#232f48] pb-4 mb-2">
<span class="material-symbols-outlined text-primary text-[24px]">local_shipping</span>
<h2 class="text-white text-xl font-bold">Vehicle & Cargo Details</h2>
</div>
<div class="grid grid-cols-1 gap-6 mb-4">
    <span class="text-white text-sm font-medium leading-none">Select Truck Type</span>
    <div class="grid grid-cols-1 gap-4 sm:grid-cols-3">
        {#each [{name: 'Mini Truck', icon: 'scooter'}, {name: 'Medium Truck', icon: 'local_shipping'}, {name: 'Heavy Truck', icon: 'conveyor_belt'}] as truck}
        <label class="flex flex-col items-center gap-3 p-6 rounded-xl border border-[#324467] bg-[#111722] cursor-pointer hover:border-primary/50 transition-colors has-[:checked]:border-primary has-[:checked]:bg-primary/10">
            <input type="radio" name="truckType" class="hidden" checked={truck.name === 'Medium Truck'} />
            <span class="material-symbols-outlined text-3xl text-primary">{truck.icon}</span>
            <span class="text-sm font-bold">{truck.name}</span>
            <span class="text-xs text-[#92a4c9]">Up to {truck.name === 'Mini Truck' ? '1.5' : truck.name === 'Medium Truck' ? '5' : '20'} Tons</span>
        </label>
        {/each}
    </div>
</div>
<div class="grid grid-cols-1 gap-6 md:grid-cols-2 lg:grid-cols-3">
<label class="flex flex-col gap-2">
<span class="text-white text-sm font-medium">Load Type</span>
<select class="w-full rounded-lg border border-[#324467] bg-[#111722] px-4 py-3 text-white focus:border-primary focus:outline-none focus:ring-1 focus:ring-primary">
<option disabled="" selected="" value="">Select type</option>
<option value="pallets">Pallets</option>
<option value="container">Container</option>
<option value="machinery">Heavy Machinery</option>
<option value="box">Boxed Goods</option>
<option value="vehicle">Vehicle</option>
</select>
</label>
<label class="flex flex-col gap-2">
<span class="text-white text-sm font-medium">Total Weight (lbs)</span>
<input class="w-full rounded-lg border border-[#324467] bg-[#111722] px-4 py-3 text-white placeholder-[#92a4c9] focus:border-primary focus:outline-none focus:ring-1 focus:ring-primary" placeholder="e.g. 4500" type="number"/>
</label>
<label class="flex flex-col gap-2">
<span class="text-white text-sm font-medium">Quantity</span>
<input class="w-full rounded-lg border border-[#324467] bg-[#111722] px-4 py-3 text-white placeholder-[#92a4c9] focus:border-primary focus:outline-none focus:ring-1 focus:ring-primary" placeholder="e.g. 5" type="number"/>
</label>
</div>
<div class="flex flex-col gap-2">
<span class="text-white text-sm font-medium">Dimensions (Optional)</span>
<div class="flex flex-wrap gap-4">
<div class="flex-1 min-w-[120px]">
<input class="w-full rounded-lg border border-[#324467] bg-[#111722] px-4 py-3 text-white placeholder-[#92a4c9] focus:border-primary focus:outline-none focus:ring-1 focus:ring-primary" placeholder="Length (ft)" type="text"/>
</div>
<div class="flex-1 min-w-[120px]">
<input class="w-full rounded-lg border border-[#324467] bg-[#111722] px-4 py-3 text-white placeholder-[#92a4c9] focus:border-primary focus:outline-none focus:ring-1 focus:ring-primary" placeholder="Width (ft)" type="text"/>
</div>
<div class="flex-1 min-w-[120px]">
<input class="w-full rounded-lg border border-[#324467] bg-[#111722] px-4 py-3 text-white placeholder-[#92a4c9] focus:border-primary focus:outline-none focus:ring-1 focus:ring-primary" placeholder="Height (ft)" type="text"/>
</div>
</div>
</div>
</section>
<!-- Section 3: Visuals & Instructions -->
<section class="flex flex-col gap-6 lg:flex-row">
<!-- File Upload -->
<div class="flex flex-1 flex-col gap-4 rounded-xl bg-[#192233] p-6 border border-[#232f48]">
<div class="flex items-center gap-3 border-b border-[#232f48] pb-4">
<span class="material-symbols-outlined text-primary text-[24px]">image</span>
<h2 class="text-white text-xl font-bold">Visuals</h2>
</div>
<div class="flex flex-1 flex-col items-center justify-center rounded-xl border-2 border-dashed border-[#324467] bg-[#111722] p-8 text-center transition-colors hover:border-primary/50 hover:bg-[#151b29]">
<div class="mb-3 flex size-12 items-center justify-center rounded-full bg-[#232f48]">
<span class="material-symbols-outlined text-[#92a4c9]">cloud_upload</span>
</div>
<p class="text-white font-medium mb-1">Click to upload or drag and drop</p>
<p class="text-[#92a4c9] text-sm">SVG, PNG, JPG or GIF (max. 800x400px)</p>
</div>
</div>
<!-- Instructions -->
<div class="flex flex-[1.5] flex-col gap-4 rounded-xl bg-[#192233] p-6 border border-[#232f48]">
<div class="flex items-center gap-3 border-b border-[#232f48] pb-4">
<span class="material-symbols-outlined text-primary text-[24px]">description</span>
<h2 class="text-white text-xl font-bold">Instructions & Protection</h2>
</div>
<label class="flex items-center gap-3 p-4 rounded-xl border border-emerald-500/20 bg-emerald-500/5 mb-4 cursor-pointer hover:bg-emerald-500/10 transition-colors">
    <input type="checkbox" class="size-5 accent-emerald-500" />
    <div class="flex flex-col">
        <span class="text-sm font-bold text-emerald-400">Add Goods Insurance</span>
        <span class="text-xs text-[#92a4c9]">Protect your shipment against damage or loss for just $15.00</span>
    </div>
    <span class="ml-auto text-emerald-400 font-bold">+$15</span>
</label>
<label class="flex flex-col gap-2 h-full">
<span class="text-white text-sm font-medium">Special Handling Instructions</span>
<textarea class="w-full flex-1 min-h-[140px] resize-none rounded-lg border border-[#324467] bg-[#111722] px-4 py-3 text-white placeholder-[#92a4c9] focus:border-primary focus:outline-none focus:ring-1 focus:ring-primary" placeholder="Enter details about gate codes, handling requirements, or specific contact info..."></textarea>
</label>
</div>
</section>
<!-- Action Bar -->
<div class="sticky bottom-0 z-10 -mx-4 md:-mx-10 lg:-mx-40 mt-4 border-t border-[#232f48] bg-[#111722]/95 backdrop-blur px-4 py-4 md:px-10 lg:px-40">
<div class="mx-auto flex max-w-[960px] items-center justify-between gap-4">
<div class="hidden sm:flex flex-col">
<span class="text-[#92a4c9] text-xs uppercase font-bold tracking-wider">Estimated Fare Breakdown</span>
<div class="flex items-center gap-4 mt-1">
    <div class="flex flex-col">
        <span class="text-white text-xl font-black">$450 - $600</span>
    </div>
    <div class="h-8 w-px bg-[#232f48]"></div>
    <div class="flex flex-col text-[10px] text-[#92a4c9]">
        <span>Base: $150</span>
        <span>Distance: $2.5/mi</span>
    </div>
</div>
</div>
<div class="flex flex-1 justify-end gap-4">
<button class="cursor-pointer rounded-lg px-6 py-3 text-sm font-bold text-white transition-colors hover:bg-[#232f48]" type="button">
                                    Save Draft
                                </button>
<button class="cursor-pointer rounded-lg bg-primary px-8 py-3 text-sm font-bold text-white shadow-lg shadow-primary/20 transition-all hover:bg-primary/90 hover:shadow-primary/40 disabled:opacity-50" type="submit" disabled={isSubmitted}>
    {isSubmitted ? 'Posting...' : 'Post Load'}
</button>
</div>
</div>
</div>
</form>
                </div>
            </div>
        </div>
    </main>
</div>
