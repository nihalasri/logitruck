<script>
  import { goto } from '$app/navigation';
  import DriverSidebar from '$lib/components/DriverSidebar.svelte';
  import { activeJob } from '$lib/stores/job.js';
  import { supabase } from '$lib/supabase';
  import { onMount } from 'svelte';

  let showDeliveryForm = $state(false);
  let deliveryLocation = $state(null);
  let deliveryPhoto = $state(null);
  let isDeliveryComplete = $state(false);
  let formattedLocation = $state('');
  let deliveryOtp = $state('');
  let currentUser = $state(null);

  onMount(async () => {
      const { data: { user } } = await supabase.auth.getUser();
      if (user) {
          currentUser = user;
          fetchActiveJob(user.id);
      }
  });

  async function fetchActiveJob(userId) {
      // Find a load assigned to this driver that is In Transit
      const { data, error } = await supabase
          .from('loads')
          .select('*')
          .eq('driver_id', userId)
          .eq('status', 'In Transit') 
          .single();

      if (data) {
          activeJob.set({
              id: `#${data.id.slice(0, 8).toUpperCase()}`,
              id_raw: data.id,
              type: data.cargo_type,
              weight: data.weight || 'N/A',
              origin: data.origin,
              dest: data.destination,
              dist: data.distance || 'Calculating...',
              price: data.price
          });
      }
  }

  function handleLogout() {
      goto('/login');
  }

  function initiateDelivery() {
      showDeliveryForm = true;
  }

  let locationError = $state('');

  function captureLocation() {
      if (!navigator.geolocation) {
          locationError = "Geolocation is not supported by your device.";
          return;
      }
      formattedLocation = "Requesting permission...";
      locationError = ""; // Clear previous errors
      
      const options = {
          enableHighAccuracy: true,
          timeout: 10000,
          maximumAge: 0
      };

      navigator.geolocation.getCurrentPosition((position) => {
          deliveryLocation = position;
          formattedLocation = `${position.coords.latitude.toFixed(6)}, ${position.coords.longitude.toFixed(6)}`;
      }, (error) => {
          formattedLocation = "";
          if (error.code === error.PERMISSION_DENIED) {
              locationError = "Location blocked. Please allow access in your browser address bar (lock icon) or device settings.";
          } else if (error.code === error.POSITION_UNAVAILABLE) {
               locationError = "Location unavailable. Check if OS Location Services are enabled.";
          } else if (error.code === error.TIMEOUT) {
              locationError = "Location request timed out. Please try again.";
          } else {
              locationError = "Unable to retrieve location. Please try again.";
          }
      }, options);
  }

  function handlePhotoUpload(e) {
      const file = e.target.files[0];
      if (file) {
          const reader = new FileReader();
          reader.onload = (e) => {
              deliveryPhoto = e.target.result;
          };
          reader.readAsDataURL(file);
      }
  }

  async function finalizeDelivery() {
      if (!currentUser || !$activeJob) return;

      try {
        // 1. Log GPS Location
        await supabase.from('gps_tracking').insert({
            load_id: $activeJob.id_raw,
            driver_id: currentUser.id,
            latitude: deliveryLocation.coords.latitude,
            longitude: deliveryLocation.coords.longitude,
            speed: deliveryLocation.coords.speed || 0,
            heading: deliveryLocation.coords.heading || 0
        });

        // 2. Update Load Status
        const { error } = await supabase
            .from('loads')
            .update({ status: 'Delivered', delivery_date: new Date().toISOString() })
            .eq('id', $activeJob.id_raw);

        if (error) throw error;

        isDeliveryComplete = true;
        activeJob.set(null); // Clear active job logic locally
        
      } catch (err) {
          console.error('Delivery failed:', err);
          alert('Failed to complete delivery. Check console.');
      }
  }

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
                {#if $activeJob}
                <div class="lg:col-span-8 premium-card overflow-hidden flex flex-col relative">
                    {#if isDeliveryComplete}
                        <div class="absolute inset-0 z-50 bg-white/90 backdrop-blur-md flex flex-col items-center justify-center animate-fade-in">
                            <div class="size-24 rounded-full bg-emerald-100 flex items-center justify-center mb-6 animate-bounce">
                                <span class="material-symbols-outlined text-5xl text-emerald-600">verified</span>
                            </div>
                            <h2 class="text-3xl font-black text-slate-900 mb-2">Load Successfully Delivered</h2>
                            <p class="text-slate-500 font-bold uppercase tracking-widest text-xs mb-8">Confirmation Sent to Client</p>
                            
                            <div class="bg-white p-4 rounded-2xl shadow-xl border border-slate-100 max-w-sm w-full mx-6">
                                <img src={deliveryPhoto} alt="Proof of Delivery" class="w-full h-48 object-cover rounded-xl mb-4" />
                                <div class="flex items-center gap-3 text-slate-500">
                                    <span class="material-symbols-outlined text-lg">location_on</span>
                                    <p class="text-[10px] font-black uppercase tracking-widest">{deliveryLocation?.coords?.latitude.toFixed(4)}, {deliveryLocation?.coords?.longitude.toFixed(4)}</p>
                                </div>
                            </div>
                            
                            <button onclick={() => activeJob.set(null)} class="mt-8 px-8 py-3 bg-slate-900 text-white rounded-xl font-black text-xs hover:scale-105 transition-transform">
                                Close Job
                            </button>
                        </div>
                    {/if}

                    <div class="p-8 border-b border-slate-100 flex justify-between items-center bg-slate-50/50">
                        <div>
                            <div class="flex items-center gap-3 mb-2">
                                <span class="bg-primary text-white text-[10px] font-black px-2.5 py-1 rounded-full uppercase tracking-widest">Current Trip</span>
                                <h3 class="text-xl font-black text-slate-900 tracking-tight leading-none">{$activeJob.id}</h3>
                            </div>
                            <div class="flex items-center gap-2 text-slate-500 text-[10px] font-black uppercase tracking-widest">
                                <span>{$activeJob.type}</span>
                                <span>•</span>
                                <span>{$activeJob.weight}</span>
                            </div>
                        </div>
                        
                        {#if !showDeliveryForm}
                        <button onclick={initiateDelivery} class="bg-emerald-500 text-white h-12 px-6 rounded-xl shadow-lg shadow-emerald-500/30 hover:bg-emerald-600 transition-all flex items-center gap-2 font-black text-xs uppercase tracking-wider micro-interaction">
                            <span class="material-symbols-outlined text-lg">verified</span>
                            Complete Delivery
                        </button>
                        {:else}
                        <button onclick={() => showDeliveryForm = false} class="text-slate-400 hover:text-slate-600 font-bold text-xs uppercase tracking-wider">
                            Cancel
                        </button>
                        {/if}
                    </div>
                    
                    {#if showDeliveryForm}
                        <div class="p-8 bg-slate-50 animate-fade-in flex-1">
                            <h3 class="text-xl font-black text-slate-900 mb-6 flex items-center gap-2">
                                <span class="material-symbols-outlined">inventory_2</span>
                                Proof of Delivery
                            </h3>

                            <div class="grid grid-cols-1 md:grid-cols-2 gap-8">
                                <div class="space-y-6">
                                    <!-- Step 1: Location -->
                                    <div class="p-4 bg-white rounded-2xl border border-slate-200 shadow-sm transition-all {deliveryLocation ? 'border-emerald-500/50 bg-emerald-50/10' : ''}">
                                        <div class="flex justify-between items-start mb-4">
                                            <span class="text-[10px] font-black uppercase tracking-widest text-slate-500">Step 1: Location Verification</span>
                                            {#if deliveryLocation}
                                                <span class="text-emerald-500 material-symbols-outlined text-lg">check_circle</span>
                                            {/if}
                                        </div>
                                        
                                        {#if !deliveryLocation}
                                            <button onclick={captureLocation} disabled={formattedLocation === 'Requesting permission...'} class="w-full py-3 border-2 border-dashed border-slate-300 rounded-xl text-slate-400 font-black text-xs uppercase hover:border-primary hover:text-primary transition-colors flex items-center justify-center gap-2">
                                                {#if formattedLocation === 'Requesting permission...'}
                                                    <span class="size-3 border-2 border-slate-400 border-t-transparent rounded-full animate-spin"></span>
                                                    Acquiring Satellites...
                                                {:else}
                                                    <span class="material-symbols-outlined">my_location</span>
                                                    Verify GPS Location
                                                {/if}
                                            </button>
                                            {#if locationError}
                                                <div class="mt-2 p-3 bg-red-50 text-red-600 rounded-lg text-[10px] font-bold border border-red-100 flex gap-2 items-start animate-shake">
                                                    <span class="material-symbols-outlined text-sm mt-0.5">error</span>
                                                    {locationError}
                                                </div>
                                            {/if}
                                        {:else}
                                            <div class="flex items-center gap-3 text-slate-700 font-bold font-mono text-xs">
                                                <span class="material-symbols-outlined text-emerald-500">pin_drop</span>
                                                {deliveryLocation.coords.latitude.toFixed(6)}, {deliveryLocation.coords.longitude.toFixed(6)}
                                            </div>
                                        {/if}
                                    </div>

                                    <!-- Step 2: Photo -->
                                    <div class="p-4 bg-white rounded-2xl border border-slate-200 shadow-sm transition-all {deliveryPhoto ? 'border-emerald-500/50 bg-emerald-50/10' : ''}">
                                        <div class="flex justify-between items-start mb-4">
                                            <span class="text-[10px] font-black uppercase tracking-widest text-slate-500">Step 2: Package Photo</span>
                                            {#if deliveryPhoto}
                                                <span class="text-emerald-500 material-symbols-outlined text-lg">check_circle</span>
                                            {/if}
                                        </div>

                                        {#if !deliveryPhoto}
                                            <label class="w-full h-32 border-2 border-dashed border-slate-300 rounded-xl flex flex-col items-center justify-center cursor-pointer hover:border-primary hover:bg-primary/5 transition-all group relative overflow-hidden">
                                                <input type="file" accept="image/*" capture="environment" onchange={handlePhotoUpload} class="absolute inset-0 opacity-0 cursor-pointer" />
                                                <span class="material-symbols-outlined text-3xl text-slate-300 group-hover:text-primary mb-2 transition-colors">photo_camera</span>
                                                <span class="text-[10px] font-black uppercase tracking-widest text-slate-400 group-hover:text-primary transition-colors">Capture Loading Dock</span>
                                            </label>
                                        {:else}
                                            <div class="relative rounded-xl overflow-hidden h-32 group">
                                                <img src={deliveryPhoto} alt="Evidence" class="w-full h-full object-cover" />
                                                <button onclick={() => deliveryPhoto = null} class="absolute top-2 right-2 p-1.5 bg-black/50 text-white rounded-lg hover:bg-red-500 transition-colors backdrop-blur-md">
                                                    <span class="material-symbols-outlined text-sm">refresh</span>
                                                </button>
                                            </div>
                                        {/if}
                                    </div>
                                    <!-- Step 2: Photo ends above -->
                                    
                                    <!-- Step 3: Client OTP -->
                                    <div class="p-4 bg-white rounded-2xl border border-slate-200 shadow-sm transition-all {deliveryOtp.length === 4 ? 'border-emerald-500/50 bg-emerald-50/10' : ''}">
                                        <div class="flex justify-between items-start mb-4">
                                            <span class="text-[10px] font-black uppercase tracking-widest text-slate-500">Step 3: Verification</span>
                                            {#if deliveryOtp.length === 4}
                                                <span class="text-emerald-500 material-symbols-outlined text-lg">check_circle</span>
                                            {/if}
                                        </div>

                                        <div class="relative">
                                            <input 
                                                type="text" 
                                                bind:value={deliveryOtp} 
                                                maxlength="4" 
                                                placeholder="Enter Client OTP" 
                                                class="w-full text-center text-2xl font-black tracking-[1em] py-3 rounded-xl border-2 border-slate-100 focus:border-primary focus:ring-0 uppercase placeholder:tracking-normal placeholder:text-sm placeholder:font-bold placeholder:text-slate-300 transition-all"
                                            />
                                            {#if deliveryOtp.length === 4}
                                                <div class="absolute right-4 top-1/2 -translate-y-1/2 text-emerald-500 animate-fade-in">
                                                    <span class="material-symbols-outlined">lock_open</span>
                                                </div>
                                            {/if}
                                        </div>
                                    </div>
                                </div>

                                <div class="flex flex-col justify-end">
                                    <button 
                                        onclick={finalizeDelivery} 
                                        disabled={!deliveryLocation || !deliveryPhoto || deliveryOtp.length !== 4}
                                        class="w-full py-4 rounded-xl font-black text-sm shadow-xl flex items-center justify-center gap-3 transition-all
                                        {!deliveryLocation || !deliveryPhoto || deliveryOtp.length !== 4
                                            ? 'bg-slate-200 text-slate-400 cursor-not-allowed' 
                                            : 'bg-emerald-500 text-white shadow-emerald-500/30 hover:scale-105 active:scale-95'}"
                                    >
                                        <span class="material-symbols-outlined">payments</span>
                                        Confirm & Request Pay
                                    </button>
                                    <p class="text-[10px] text-center text-slate-400 font-bold mt-4 uppercase">
                                        Payment will be securely transferred within 1hr
                                    </p>
                                </div>
                            </div>
                        </div>
                    {:else}
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
                                        <p class="text-lg font-black text-slate-900 leading-none">{$activeJob.origin}</p>
                                        <p class="text-[10px] font-bold text-slate-500 mt-1 uppercase">Finalized: 08:30 UTC</p>
                                    </div>
                                </div>
                                <div class="flex gap-6 items-start relative z-10">
                                    <div class="size-10 rounded-xl bg-primary shadow-lg shadow-primary/20 flex items-center justify-center shrink-0">
                                        <span class="material-symbols-outlined text-white text-[18px]">flag</span>
                                    </div>
                                    <div>
                                        <p class="text-[10px] font-black text-primary uppercase tracking-widest mb-1 font-display">Drop-off</p>
                                        <p class="text-lg font-black text-slate-900 leading-none">{$activeJob.dest}</p>
                                        <p class="text-[10px] font-bold text-slate-500 mt-1 uppercase">ETA: 14.5 Hours</p>
                                    </div>
                                </div>
                            </div>

                            <div class="bg-slate-50 rounded-2xl p-6 border border-slate-100">
                                <div class="flex justify-between items-end mb-3">
                                    <div>
                                        <p class="text-[10px] font-black text-slate-400 uppercase tracking-widest mb-1">Trip Progress</p>
                                        <p class="text-2xl font-black text-slate-900 leading-none">{$activeJob.dist} <span class="text-slate-400 text-sm">REMAINING</span></p>
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
                                {#if $activeJob}
                                    <iframe 
                                        width="100%" 
                                        height="100%" 
                                        frameborder="0" 
                                        style="border:0"
                                        title="Route Map"
                                        scrolling="no" 
                                        marginheight="0" 
                                        marginwidth="0" 
                                        src="https://maps.google.com/maps?saddr={encodeURIComponent($activeJob.origin)}&daddr={encodeURIComponent($activeJob.dest)}&output=embed">
                                    </iframe>
                                {:else}
                                    <div class="w-full h-full flex items-center justify-center bg-slate-100 text-slate-400">
                                        <span class="flex flex-col items-center gap-2">
                                            <span class="material-symbols-outlined text-4xl">map</span>
                                            <span class="text-xs font-black uppercase tracking-widest">No Active Route</span>
                                        </span>
                                    </div>
                                {/if}
                                
                                <div class="absolute top-4 left-4 glass px-3 py-1.5 rounded-lg border border-white/50 flex items-center gap-2 pointer-events-none">
                                    <span class="size-2 rounded-full bg-emerald-500 animate-pulse"></span>
                                    <span class="text-[9px] font-black uppercase tracking-widest text-slate-900">Live Traffic</span>
                                </div>

                                <div class="absolute bottom-4 right-4 flex gap-2">
                                    <button class="size-8 bg-white rounded-lg shadow-lg flex items-center justify-center text-slate-600 hover:text-primary transition-colors micro-interaction border border-slate-100" title="Zoom In">
                                        <span class="material-symbols-outlined text-lg">add</span>
                                    </button>
                                    <button class="size-8 bg-white rounded-lg shadow-lg flex items-center justify-center text-slate-600 hover:text-primary transition-colors micro-interaction border border-slate-100" title="Recenter GPS">
                                        <span class="material-symbols-outlined text-lg">my_location</span>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                    {/if}
                </div>
                {/if}

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
