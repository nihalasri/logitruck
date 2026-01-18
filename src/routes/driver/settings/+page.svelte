<script>


  let profile = {
    name: 'John Driver',
    rank: 'Elite Carrier',
    phone: '+1 (555) 0123-4567',
    email: 'john.d@logitruck.nexus'
  };

  let vehicle = {
    model: 'Tesla Semi Alpha',
    id: 'TRK-9902',
    capacity: '20 Metric Tons',
    type: 'Refrigerated Unit'
  };
</script>



    <main class="flex-1 flex flex-col h-screen overflow-hidden relative">
        <header class="flex items-center justify-between glass border-b border-slate-200 px-8 py-5 h-20 shrink-0 z-20">
            <div class="flex items-center gap-4">
                <a href="/driver/dashboard" class="p-2 rounded-xl text-slate-400 hover:text-primary transition-all micro-interaction">
                    <span class="material-symbols-outlined">arrow_back</span>
                </a>
                <div class="w-px h-6 bg-slate-200"></div>
                <div>
                    <h2 class="text-2xl font-black text-slate-900 tracking-tight leading-none">Protocol Settings</h2>
                    <p class="text-[10px] font-black text-slate-400 uppercase tracking-widest mt-1">System Config & User Identity</p>
                </div>
            </div>
            <div class="flex items-center gap-4">
                <button class="bg-primary hover:bg-primary-dark text-white px-6 py-2.5 rounded-xl text-xs font-black uppercase tracking-widest transition-all shadow-lg shadow-primary/20 micro-interaction">
                    Save Changes
                </button>
            </div>
        </header>

        <div class="flex-1 overflow-y-auto p-8 bg-[radial-gradient(40%_40%_at_50%_0%,rgba(29,78,216,0.02)_0%,transparent_100%)]">
            <div class="max-w-4xl mx-auto space-y-8">
                <!-- Identity Section -->
                <div class="premium-card p-10 bg-white">
                    <div class="flex items-start gap-10 mb-10">
                        <div class="relative group">
                            <div class="size-32 rounded-3xl bg-slate-100 overflow-hidden border-4 border-white shadow-xl">
                                <img src="https://images.unsplash.com/photo-1542385151-efd9000785a0?q=80&w=200&auto=format&fit=crop" class="w-full h-full object-cover" alt="Profile">
                            </div>
                            <button class="absolute -bottom-2 -right-2 size-10 rounded-xl bg-primary text-white flex items-center justify-center shadow-lg border-2 border-white hover:scale-110 transition-transform">
                                <span class="material-symbols-outlined text-[20px]">photo_camera</span>
                            </button>
                        </div>
                        <div class="flex-1">
                            <div class="flex justify-between items-start">
                                <div>
                                    <h3 class="text-3xl font-black text-slate-900 mb-1">{profile.name}</h3>
                                    <div class="flex items-center gap-2">
                                        <span class="px-2 py-0.5 rounded bg-emerald-50 text-emerald-600 text-[10px] font-black uppercase tracking-widest border border-emerald-100">
                                            {profile.rank}
                                        </span>
                                        <span class="text-slate-400 text-[10px] font-black uppercase tracking-widest">• Verified 2023</span>
                                    </div>
                                </div>
                                <div class="text-right">
                                    <p class="text-[10px] font-black text-slate-400 uppercase tracking-widest mb-1">Total Distance</p>
                                    <p class="text-xl font-black text-slate-900">42,500 km</p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="grid grid-cols-1 md:grid-cols-2 gap-8">
                        <div class="space-y-4">
                            <label class="block">
                                <span class="text-[10px] font-black text-slate-400 uppercase tracking-widest ml-1">Communication Channel (Email)</span>
                                <input type="email" bind:value={profile.email} class="mt-1 w-full px-4 py-3 rounded-xl bg-slate-50 border border-slate-200 focus:border-primary focus:ring-4 focus:ring-primary/5 transition-all text-sm font-bold">
                            </label>
                            <label class="block">
                                <span class="text-[10px] font-black text-slate-400 uppercase tracking-widest ml-1">Tactical Link (Phone)</span>
                                <input type="tel" bind:value={profile.phone} class="mt-1 w-full px-4 py-3 rounded-xl bg-slate-50 border border-slate-200 focus:border-primary focus:ring-4 focus:ring-primary/5 transition-all text-sm font-bold">
                            </label>
                        </div>
                        <div class="space-y-4">
                            <label class="block">
                                <span class="text-[10px] font-black text-slate-400 uppercase tracking-widest ml-1">Current Base Location</span>
                                <input type="text" value="Chicago Logistics Hub" class="mt-1 w-full px-4 py-3 rounded-xl bg-slate-50 border border-slate-200 focus:border-primary focus:ring-4 focus:ring-primary/5 transition-all text-sm font-bold">
                            </label>
                            <label class="block">
                                <span class="text-[10px] font-black text-slate-400 uppercase tracking-widest ml-1">Timezone Alpha</span>
                                <select class="mt-1 w-full px-4 py-3 rounded-xl bg-slate-50 border border-slate-200 focus:border-primary focus:ring-4 focus:ring-primary/5 transition-all text-sm font-bold">
                                    <option>UTC -6 (Central Standard)</option>
                                    <option>UTC -5 (Eastern Standard)</option>
                                </select>
                            </label>
                        </div>
                    </div>
                </div>

                <!-- Vehicle Configuration -->
                <div class="premium-card p-10 bg-white">
                    <h3 class="text-xl font-black text-slate-900 mb-8 flex items-center gap-3">
                        <span class="material-symbols-outlined text-primary">local_shipping</span>
                        Vehicle Configuration
                    </h3>
                    
                    <div class="grid grid-cols-1 md:grid-cols-3 gap-6 mb-10">
                        <div class="p-6 rounded-2xl bg-slate-50 border border-slate-100">
                            <p class="text-[10px] font-black text-slate-400 uppercase tracking-widest mb-1">Unit Model</p>
                            <p class="text-sm font-black text-slate-900">{vehicle.model}</p>
                        </div>
                        <div class="p-6 rounded-2xl bg-slate-50 border border-slate-100">
                            <p class="text-[10px] font-black text-slate-400 uppercase tracking-widest mb-1">Payload Limit</p>
                            <p class="text-sm font-black text-slate-900">{vehicle.capacity}</p>
                        </div>
                        <div class="p-6 rounded-2xl bg-slate-50 border border-slate-100">
                            <p class="text-[10px] font-black text-slate-400 uppercase tracking-widest mb-1">Asset ID</p>
                            <p class="text-sm font-black text-slate-900">{vehicle.id}</p>
                        </div>
                    </div>

                    <div class="space-y-6">
                        <div class="flex items-center justify-between p-4 rounded-xl border border-slate-200 group hover:border-primary/20 transition-all">
                            <div class="flex items-center gap-4">
                                <div class="size-10 rounded-lg bg-blue-50 text-blue-600 flex items-center justify-center">
                                    <span class="material-symbols-outlined text-[20px]">ac_unit</span>
                                </div>
                                <div>
                                    <p class="text-sm font-black text-slate-900">Refrigeration Override</p>
                                    <p class="text-[10px] font-bold text-slate-500 uppercase">Allow remote temperature telemetry</p>
                                </div>
                            </div>
                            <div class="w-12 h-6 bg-primary rounded-full relative cursor-pointer">
                                <div class="absolute right-1 top-1 size-4 bg-white rounded-full"></div>
                            </div>
                        </div>

                        <div class="flex items-center justify-between p-4 rounded-xl border border-slate-200 group hover:border-primary/20 transition-all">
                            <div class="flex items-center gap-4">
                                <div class="size-10 rounded-lg bg-yellow-50 text-yellow-600 flex items-center justify-center">
                                    <span class="material-symbols-outlined text-[20px]">warning</span>
                                </div>
                                <div>
                                    <p class="text-sm font-black text-slate-900">Hazmat Protocol</p>
                                    <p class="text-[10px] font-bold text-slate-500 uppercase">Certified for Class 1-9 transport</p>
                                </div>
                            </div>
                            <div class="w-12 h-6 bg-slate-200 rounded-full relative cursor-pointer">
                                <div class="absolute left-1 top-1 size-4 bg-white rounded-full"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>

