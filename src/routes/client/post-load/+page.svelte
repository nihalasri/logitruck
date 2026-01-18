<script>

  import { goto } from '$app/navigation';

  import { supabase } from '$lib/supabase';

  let pickup = $state('');
  let dropoff = $state('');
  let date = $state('');
  let shipmentType = $state('pallets');
  let isSubmitted = $state(false);
  let gettingLocation = $state(false);

  function getLiveLocation() {
    if (!navigator.geolocation) {
      alert('Geolocation is not supported by your browser');
      return;
    }

    gettingLocation = true;
    
    const options = {
      enableHighAccuracy: true,
      timeout: 10000,
      maximumAge: 0
    };

    navigator.geolocation.getCurrentPosition(async (position) => {
      const { latitude, longitude } = position.coords;
      
      try {
        // Reverse geocoding using OpenStreetMap Nominatim
        const response = await fetch(
          `https://nominatim.openstreetmap.org/reverse?format=json&lat=${latitude}&lon=${longitude}`
        );
        
        if (!response.ok) throw new Error('Geocoding failed');
        
        const data = await response.json();
        const addr = data.address;
        
        // prioritized location name
        const locationName = addr.city || addr.town || addr.village || addr.suburb || addr.municipality || data.display_name.split(',')[0];
        
        pickup = locationName;
        
      } catch (error) {
        console.error('Error fetching address:', error);
        pickup = `${latitude.toFixed(4)}, ${longitude.toFixed(4)}`;
      } finally {
        gettingLocation = false;
      }
    }, (error) => {
      console.error('Error getting location:', error);
      let msg = 'Unable to retrieve location.';
      if (error.code === 1) msg = 'Please enable location access.';
      
      alert(msg);
      gettingLocation = false;
    }, options);
  }

  async function handleSubmit(e) {
    if (e) e.preventDefault();
    
    // Get current user
    const { data: { user } } = await supabase.auth.getUser();
    
    if (!user) {
        alert('You must be logged in to post a shipment.');
        return;
    }

    const priceValue = 420.00; // In a real app, this would be dynamic

    // Construct payload - DO NOT INCLUDE 'id' (Let Postgres generate it)
    const newLoad = {
      client_id: user.id, 
      origin: pickup || 'Unknown',
      destination: dropoff || 'Unknown',
      cargo_type: shipmentType.charAt(0).toUpperCase() + shipmentType.slice(1),
      weight: 'Pending', 
      distance: 'Calculating...', 
      price: priceValue, 
      status: 'Open',
      pickup_date: date ? new Date(date).toISOString() : new Date().toISOString()
    };



    try {
        const { data, error } = await supabase
            .from('loads')
            .insert(newLoad)
            .select();

        if (error) {
            console.error("Supabase Insert Error:", error);
            throw error;
        }

        isSubmitted = true;
        setTimeout(() => {
           goto('/client/loads');
        }, 1500);
    } catch (error) {
        console.error('Error adding load:', error);
        alert(`Failed to post shipment: ${error.message}\nCheck console for details.`);
    }
  }
</script>

    <main class="flex-1 flex flex-col h-full overflow-hidden relative">
        <!-- Glassmorphism Section Header -->
        <header class="flex items-center justify-between glass border-b border-slate-200 px-8 py-5 h-20 shrink-0 z-20">
            <div class="flex items-center gap-2 text-sm font-medium text-slate-400 pl-14 lg:pl-0 transition-all">
                <a class="hover:text-primary transition-colors" href="/client/dashboard">Home</a>
                <span class="material-symbols-outlined text-[16px]">chevron_right</span>
                <span class="text-slate-900 font-bold">New Shipment</span>
            </div>
            <div class="flex items-center gap-4">
                <button class="text-slate-400 hover:text-slate-600 micro-interaction">
                    <span class="material-symbols-outlined">help</span>
                </button>
            </div>
        </header>

        <!-- Scrollable Form Area -->
        <div class="flex-1 overflow-y-auto bg-[radial-gradient(35%_35%_at_50%_0%,rgba(29,78,216,0.02)_0%,transparent_100%)]">
            <div class="max-w-4xl mx-auto px-6 py-12">
                <div class="mb-12">
                    <h1 class="text-5xl font-black text-slate-900 tracking-tight leading-none mb-4">Post new shipment</h1>
                    <p class="text-text-muted text-lg font-medium max-w-2xl leading-relaxed">Post your shipment details for our drivers. We'll help you find the best match.</p>
                </div>

                <form class="space-y-8" onsubmit={handleSubmit}>
                    {#if isSubmitted}
                        <div class="premium-card bg-emerald-50 border-emerald-100 p-6 text-emerald-700 flex items-center gap-4 animate-fade-in">
                            <div class="size-10 rounded-full bg-emerald-500 text-white flex items-center justify-center">
                                <span class="material-symbols-outlined font-bold">done_all</span>
                            </div>
                            <div>
                                <p class="font-black text-lg leading-none">Shipment Posted</p>
                                <p class="text-sm font-medium opacity-80">Looking for drivers... redirecting.</p>
                            </div>
                        </div>
                    {/if}

                    <!-- Trajectory Information -->
                    <section class="premium-card p-10 overflow-hidden relative">
                        <div class="flex items-center gap-4 mb-10">
                            <div class="size-12 rounded-2xl bg-primary/10 text-primary flex items-center justify-center">
                                <span class="material-symbols-outlined text-2xl">route</span>
                            </div>
                            <h2 class="text-2xl font-black text-slate-900 tracking-tight">Pickup & Drop-off</h2>
                        </div>

                        <div class="grid grid-cols-1 md:grid-cols-2 gap-10">
                            <div class="space-y-6">
                                <label class="block">
                                    <div class="flex justify-between items-end mb-2">
                                        <span class="block text-[10px] font-black uppercase tracking-widest text-slate-400">Pickup Area</span>
                                        <button type="button" class="text-[9px] font-black text-primary uppercase tracking-wider hover:underline">Select Saved Location</button>
                                    </div>
      <div class="relative group">
                                        <div class="absolute left-4 top-1/2 -translate-y-1/2 text-slate-300 group-focus-within:text-primary transition-colors pointer-events-none">
                                            <span class="material-symbols-outlined text-[20px]">trip_origin</span>
                                        </div>
                                        <input bind:value={pickup} class="w-full pl-12 pr-14 py-4 rounded-2xl bg-slate-50 border-none placeholder-slate-300 text-sm font-bold focus:bg-white focus:ring-2 focus:ring-primary/20 transition-all shadow-inner" placeholder="Pickup City or Zip" type="text"/>
                                        
                                        <button 
                                            type="button" 
                                            onclick={getLiveLocation}
                                            class="absolute right-2 top-1/2 -translate-y-1/2 p-2 rounded-xl hover:bg-white hover:shadow-sm text-slate-400 hover:text-primary transition-all active:scale-95"
                                            title="Use my current location">
                                            {#if gettingLocation}
                                                <span class="material-symbols-outlined text-[20px] animate-spin">progress_activity</span>
                                            {:else}
                                                <span class="material-symbols-outlined text-[20px] {pickup ? 'text-emerald-500' : ''}">my_location</span>
                                            {/if}
                                        </button>
                                    </div>
                                </label>
                                <div class="grid grid-cols-2 gap-4">
                                    <label class="block">
                                        <span class="block text-[10px] font-black uppercase tracking-widest text-slate-400 mb-2">Pickup Date</span>
                                        <input bind:value={date} class="w-full px-5 py-4 rounded-2xl bg-slate-50 border-none text-sm font-bold focus:bg-white focus:ring-2 focus:ring-primary/20 transition-all shadow-inner" type="date"/>
                                    </label>
                                    <label class="block">
                                        <span class="block text-[10px] font-black uppercase tracking-widest text-slate-400 mb-2">Preferred Window</span>
                                        <select class="w-full px-5 py-4 rounded-2xl bg-slate-50 border-none text-sm font-bold focus:bg-white focus:ring-2 focus:ring-primary/20 outline-none">
                                            <option>Morning (08:00 - 12:00)</option>
                                            <option>Afternoon (12:00 - 17:00)</option>
                                            <option>Evening (17:00 - 21:00)</option>
                                            <option>Night (21:00 - 05:00)</option>
                                        </select>
                                    </label>
                                </div>
                            </div>

                            <div class="space-y-6">
                                <label class="block">
                                    <div class="flex justify-between items-end mb-2">
                                        <span class="block text-[10px] font-black uppercase tracking-widest text-slate-400">Drop-off Area</span>
                                        <button type="button" class="text-[9px] font-black text-primary uppercase tracking-wider hover:underline">Select Saved Location</button>
                                    </div>
                                    <div class="relative group">
                                        <div class="absolute left-4 top-1/2 -translate-y-1/2 text-slate-300 group-focus-within:text-primary transition-colors">
                                            <span class="material-symbols-outlined text-[20px]">location_on</span>
                                        </div>
                                        <input bind:value={dropoff} class="w-full pl-12 pr-4 py-4 rounded-2xl bg-slate-50 border-none placeholder-slate-300 text-sm font-bold focus:bg-white focus:ring-2 focus:ring-primary/20 transition-all shadow-inner" placeholder="Drop-off City or Zip" type="text"/>
                                    </div>
                                </label>
                                <label class="block">
                                    <span class="block text-[10px] font-black uppercase tracking-widest text-slate-400 mb-2">Extra Stops</span>
                                    <button type="button" class="w-full py-4 rounded-2xl bg-slate-50 border-2 border-dashed border-slate-200 text-xs font-black text-slate-400 hover:border-primary hover:text-primary transition-all flex items-center justify-center gap-2">
                                        <span class="material-symbols-outlined text-[18px]">add_location_alt</span>
                                        Add Stop
                                    </button>
                                </label>
                            </div>
                        </div>
                    </section>

                    <!-- Tactical Matrix: Service & Assets -->
                    <section class="premium-card p-10">
                        <div class="flex items-center gap-4 mb-10">
                            <div class="size-12 rounded-2xl bg-blue-50 text-blue-600 flex items-center justify-center">
                                <span class="material-symbols-outlined text-2xl">dataset</span>
                            </div>
                            <h2 class="text-2xl font-black text-slate-900 tracking-tight">Load Details</h2>
                        </div>

                        <div class="mb-10">
                            <span class="block text-[10px] font-black uppercase tracking-widest text-slate-400 mb-4">Service Type</span>
                            <div class="grid grid-cols-2 md:grid-cols-4 gap-4">
                                {#each ['Intra-city', 'Inter-city', 'Packers', 'Enterprise'] as cat}
                                <label class="group cursor-pointer">
                                    <input type="radio" name="category" value={cat} class="peer hidden" checked={cat === 'Intra-city'} />
                                    <div class="p-4 rounded-2xl border border-slate-100 bg-slate-50 peer-checked:bg-primary/5 peer-checked:border-primary/30 peer-checked:ring-2 peer-checked:ring-primary/10 transition-all">
                                        <span class="block text-center text-xs font-black text-slate-500 peer-checked:text-primary">{cat}</span>
                                    </div>
                                </label>
                                {/each}
                            </div>
                        </div>

                        <div class="space-y-10">
                            <div>
                                <div class="flex items-center gap-3 mb-4">
                                    <span class="block text-[10px] font-black uppercase tracking-widest text-slate-400">Choose a Vehicle</span>
                                    <div class="px-2 py-0.5 rounded-full bg-primary/5 border border-primary/10 text-[8px] font-black uppercase text-primary animate-pulse">AI Suggested</div>
                                </div>
                                <div class="grid grid-cols-1 md:grid-cols-4 gap-6">
                                    {#each [
                                        {name: 'Electric Mini', icon: 'electric_rickshaw', cap: '0.8T', green: true}, 
                                        {name: 'Mini Truck', icon: 'scooter', cap: '1.5T'}, 
                                        {name: 'Logistics Pro', icon: 'local_shipping', cap: '5T'}, 
                                        {name: 'Industrial', icon: 'conveyor_belt', cap: '20T'}
                                    ] as truck}
                                    <label class="group cursor-pointer">
                                        <input type="radio" name="truckType" class="peer hidden" checked={truck.name === 'Logistics Pro'} />
                                        <div class="p-6 rounded-[2rem] border border-slate-100 bg-white text-center transition-all duration-300 peer-checked:border-primary peer-checked:bg-primary/5 peer-checked:shadow-2xl peer-checked:shadow-primary/10 hover:shadow-xl relative overflow-hidden">
                                            {#if truck.green}
                                                <div class="absolute top-3 right-3">
                                                    <span class="material-symbols-outlined text-emerald-500 text-sm font-black">eco</span>
                                                </div>
                                            {/if}
                                            <span class="material-symbols-outlined text-4xl block mb-3 text-slate-300 peer-checked:text-primary transition-colors">{truck.icon}</span>
                                            <span class="block font-black text-slate-900 peer-checked:text-primary mb-1 text-sm">{truck.name}</span>
                                            <span class="block text-[10px] font-bold text-slate-400 uppercase tracking-widest">{truck.cap} Capacity</span>
                                        </div>
                                    </label>
                                    {/each}
                                </div>
                            </div>

                            <div class="grid grid-cols-1 md:grid-cols-2 gap-8">
                                <label class="block">
                                    <span class="block text-[10px] font-black uppercase tracking-widest text-slate-400 mb-2">Shipment Type</span>
                                    <select bind:value={shipmentType} class="w-full px-5 py-4 rounded-2xl bg-slate-50 border-none text-sm font-bold focus:bg-white focus:ring-2 focus:ring-primary/20 outline-none">
                                        <option value="pallets">Standard Pallets</option>
                                        <option value="container">FCL Container</option>
                                        <option value="machinery">Large Machinery</option>
                                        <option value="fragile">Fragile Goods (Add-on Protection)</option>
                                    </select>
                                </label>
                                <div class="block">
                                    <span class="block text-[10px] font-black uppercase tracking-widest text-slate-400 mb-2">Check Prices</span>
                                    <div class="p-4 rounded-2xl bg-slate-900 text-white flex items-center justify-between">
                                        <div class="flex items-center gap-3">
                                            <span class="material-symbols-outlined text-emerald-400">trending_down</span>
                                            <span class="text-[10px] font-black uppercase tracking-widest">Off-peak pricing active</span>
                                        </div>
                                        <span class="text-xs font-black text-emerald-400">-15% Savings</span>
                                    </div>
                                </div>
                            </div>

                            <label class="block">
                                <span class="block text-[10px] font-black uppercase tracking-widest text-slate-400 mb-2">Driver Instructions</span>
                                <textarea class="w-full px-6 py-4 rounded-[2rem] bg-slate-50 border-none placeholder-slate-300 text-sm font-bold focus:bg-white focus:ring-2 focus:ring-primary/20 transition-all shadow-inner h-32 resize-none" placeholder="e.g. 'Handle with extreme care', 'Call 10 mins before arrival', 'Gate code: 1234'"></textarea>
                            </label>
                        </div>
                    </section>

                    <!-- Instructions & Vault -->
                    <section class="grid grid-cols-1 lg:grid-cols-2 gap-8">
                        <div class="premium-card p-8 flex flex-col items-center justify-center text-center group transition-colors hover:border-primary/20">
                            <div class="size-16 rounded-[2rem] bg-slate-50 flex items-center justify-center text-slate-400 mb-4 group-hover:bg-primary/10 group-hover:text-primary transition-all">
                                <span class="material-symbols-outlined text-3xl">upload_file</span>
                            </div>
                            <h3 class="font-black text-lg mb-1">Visual Documentation</h3>
                            <p class="text-xs text-slate-500 font-medium mb-6">Manifests, packing lists or photos.</p>
                            <button type="button" class="px-6 py-3 rounded-xl bg-slate-900 text-white text-xs font-black shadow-xl micro-interaction">Select Files</button>
                        </div>

                        <div class="premium-card p-10 bg-slate-900 text-white flex flex-col justify-between relative overflow-hidden">
                            <!-- Glow decoration -->
                            <div class="absolute -right-10 top-1/2 -translate-y-1/2 size-40 bg-emerald-500/10 blur-[60px] rounded-full"></div>
                            
                            <div class="relative z-10">
                                <h3 class="text-2xl font-black mb-4 flex items-center gap-3">
                                    Green Offset
                                    <span class="material-symbols-outlined text-emerald-500">eco</span>
                                </h3>
                                <p class="text-slate-400 text-sm font-medium mb-8">Contribute to tree planting projects to neutralize the carbon footprint of this journey.</p>
                                
                                <label class="flex items-center gap-4 cursor-pointer group">
                                    <input type="checkbox" class="size-6 accent-emerald-500 rounded-lg" checked />
                                    <div class="flex flex-col">
                                        <span class="text-sm font-black group-hover:text-emerald-500 transition-colors">Neutralize Transit</span>
                                        <span class="text-[10px] font-black text-emerald-500 uppercase">Contribution: $2.00</span>
                                    </div>
                                </label>
                            </div>
                        </div>
                    </section>

                    <!-- Footer Action Control -->
                    <div class="pt-8 flex items-center justify-between border-t border-slate-100 mt-12">
                        <div class="hidden sm:block">
                            <span class="block text-[10px] font-black text-slate-400 uppercase tracking-widest mb-1">Estimated Cost</span>
                            <div class="flex items-baseline gap-2">
                                <span class="text-3xl font-black text-slate-900">$420.00</span>
                                <span class="text-xs font-bold text-slate-400">Guide Price</span>
                            </div>
                        </div>
                        <div class="flex gap-4">
                            <button type="button" class="px-10 py-5 rounded-[2rem] bg-white border border-slate-200 text-sm font-black hover:bg-slate-50 transition-all micro-interaction">Discard</button>
                            <button type="submit" class="px-12 py-5 rounded-[2rem] bg-primary text-white text-sm font-black shadow-2xl shadow-primary/30 transition-all hover:scale-105 active:scale-95 disabled:opacity-50" disabled={isSubmitted}>
                                {isSubmitted ? 'Posting...' : 'Post Shipment'}
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </main>

