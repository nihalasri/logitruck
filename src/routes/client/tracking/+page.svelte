<script>

  import { goto } from '$app/navigation';
</script>

<div class="bg-bg-main text-slate-900 font-display min-h-screen flex flex-col selection:bg-primary/10 overflow-hidden">
    <!-- Top Navigation Bar -->
    <header class="flex items-center justify-between glass border-b border-slate-200 px-8 py-4 h-20 shrink-0 z-40">
        <a href="/" class="flex items-center gap-3 group cursor-pointer">
            <div class="size-10 text-primary flex items-center justify-center bg-slate-50 rounded-xl border border-primary/5 transition-transform group-hover:scale-110">
                <span class="material-symbols-outlined text-2xl font-black">deployed_code</span>
            </div>
            <span class="text-2xl font-black tracking-tight text-slate-900 font-display group-hover:text-primary transition-colors">LogiPro</span>
        </a>
        <div class="flex items-center gap-6">
            <div class="hidden md:flex items-center gap-8">
                <button onclick={() => goto('/client/dashboard')} class="text-xs font-black uppercase tracking-widest text-slate-400 hover:text-primary transition-colors">Satellite Terminal</button>
                <button class="text-xs font-black uppercase tracking-widest text-primary border-b-2 border-primary py-1">Active Manifests</button>
            </div>
                <button onclick={() => alert('Tracking Link Copied to Clipboard!')} class="size-10 rounded-xl bg-white border border-slate-200 text-slate-400 hover:text-primary transition-all flex items-center justify-center shadow-sm">
                    <span class="material-symbols-outlined text-[20px]">ios_share</span>
                </button>
                <div class="flex items-center gap-3 pl-6 border-l border-slate-200">
                    <div class="text-right hidden sm:block">
                        <p class="text-[10px] font-black text-slate-900 leading-none">Institutional Account</p>
                        <p class="text-[9px] font-black text-slate-400 uppercase tracking-widest mt-0.5">Global Node 42</p>
                    </div>
                    <div class="size-10 rounded-xl bg-cover bg-center border-2 border-white shadow-sm" style="background-image: url('https://images.unsplash.com/photo-1542156822-6924d1a71ace?q=80&w=200&auto=format&fit=crop');"></div>
                </div>
            </div>
        </header>

        <div class="flex-1 flex overflow-hidden relative">
            <!-- Intelligent Map Interface -->
            <main class="flex-1 relative bg-slate-50 overflow-hidden">
                <!-- Live Satellite Map Layer -->
                <div class="absolute inset-0 w-full h-full pointer-events-auto">
                    <iframe 
                        width="100%" 
                        height="100%" 
                        frameborder="0" 
                        title="Live Tracking Map"
                        style="border:0;"
                        src="https://maps.google.com/maps?q=41.8781,-87.6298&z=11&output=embed"
                        class="w-full h-full opacity-100">
                    </iframe>
                </div>
                <!-- Gradient Overlay (lighter for visibility) -->
                <div class="absolute inset-0 bg-gradient-to-br from-primary/5 via-transparent to-slate-900/5 pointer-events-none"></div>

                <!-- Floating Intelligence HUD (Search) -->
                <div class="absolute top-8 left-8 z-30 w-full max-w-lg">
                    <div class="premium-card p-2 flex items-center gap-1 shadow-2xl shadow-slate-200/50 bg-white/90 backdrop-blur-xl border border-white/40">
                        <div class="flex items-center justify-center size-12 text-slate-400">
                            <span class="material-symbols-outlined font-black">satellite_alt</span>
                        </div>
                        <input type="text" placeholder="Search Node Ref, Driver ID, or Geo-Coordinates..." class="flex-1 bg-transparent border-none text-sm font-bold focus:ring-0 placeholder:text-slate-400" />
                        <button class="size-12 rounded-xl bg-slate-900 text-white flex items-center justify-center micro-interaction hover:bg-primary">
                            <span class="material-symbols-outlined text-sm">search</span>
                        </button>
                    </div>
                </div>

                <!-- AI Predictive Analysis Module -->
                <div class="absolute top-8 right-8 z-30 flex flex-col gap-4">
                    <div class="premium-card p-5 bg-white/90 backdrop-blur-xl border border-white/40 shadow-2xl w-72 animate-fade-in">
                        <div class="flex items-center gap-3 mb-4">
                            <div class="size-8 rounded-lg bg-indigo-50 text-primary flex items-center justify-center">
                                <span class="material-symbols-outlined text-lg">psychology</span>
                            </div>
                            <div>
                                <h3 class="text-xs font-black text-slate-900 uppercase tracking-wider">AI Route Guard</h3>
                                <p class="text-[9px] font-bold text-slate-400">Real-time Interference Scans</p>
                            </div>
                        </div>
                        
                        <div class="space-y-3">
                             <div class="flex justify-between items-center bg-slate-50 p-2 rounded-lg border border-slate-100">
                                <span class="text-[10px] font-bold text-slate-500 uppercase tracking-wide">Weather Impact</span>
                                <span class="text-[10px] font-black text-emerald-600 bg-emerald-50 px-2 py-0.5 rounded border border-emerald-100">Benign</span>
                            </div>
                            <div class="flex justify-between items-center bg-slate-50 p-2 rounded-lg border border-slate-100">
                                 <span class="text-[10px] font-bold text-slate-500 uppercase tracking-wide">Congestion Risk</span>
                                 <span class="text-[10px] font-black text-emerald-600 bg-emerald-50 px-2 py-0.5 rounded border border-emerald-100">Low (12%)</span>
                            </div>
                            <div class="flex justify-between items-center bg-slate-50 p-2 rounded-lg border border-slate-100">
                                 <span class="text-[10px] font-bold text-slate-500 uppercase tracking-wide">Safety Score</span>
                                 <span class="text-[10px] font-black text-primary bg-blue-50 px-2 py-0.5 rounded border border-blue-100">98/100</span>
                            </div>
                        </div>
                    </div>

                    <!-- Cargo Telemetry Widget -->
                    <div class="premium-card p-5 bg-white/90 backdrop-blur-xl border border-white/40 shadow-2xl w-72 animate-fade-in" style="animation-delay: 0.1s;">
                         <div class="flex items-center gap-3 mb-4">
                            <div class="size-8 rounded-lg bg-emerald-50 text-emerald-600 flex items-center justify-center">
                                <span class="material-symbols-outlined text-lg">sensors</span>
                            </div>
                            <div>
                                <h3 class="text-xs font-black text-slate-900 uppercase tracking-wider">Cargo Telemetry</h3>
                                <p class="text-[9px] font-bold text-slate-400">Live Sensor Array</p>
                            </div>
                        </div>
                        <div class="grid grid-cols-2 gap-2">
                            <div class="text-center p-2 bg-slate-50 rounded-lg border border-slate-100">
                                <p class="text-[9px] font-bold text-slate-400 uppercase">Temp</p>
                                <p class="text-xs font-black text-slate-900">-18.2°C</p>
                            </div>
                            <div class="text-center p-2 bg-slate-50 rounded-lg border border-slate-100">
                                <p class="text-[9px] font-bold text-slate-400 uppercase">Humidity</p>
                                <p class="text-xs font-black text-slate-900">45%</p>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Dynamic Assets (Markers) -->
                <div class="absolute top-[45%] left-[55%] -translate-x-1/2 -translate-y-1/2 z-20 group cursor-pointer">
                    <!-- Vehicle Shadow -->
                    <div class="absolute inset-0 bg-primary/20 blur-xl rounded-full scale-150 group-hover:scale-200 transition-transform duration-1000 animate-pulse"></div>
                    <!-- Main Marker -->
                    <div class="relative bg-primary text-white size-14 rounded-2xl flex items-center justify-center shadow-2xl shadow-primary/40 border border-white/20 hover:scale-110 transition-transform">
                        <span class="material-symbols-outlined text-3xl font-black">local_shipping</span>
                        <!-- Direction Vector -->
                        <div class="absolute -top-4 left-1/2 -translate-x-1/2 flex flex-col items-center">
                            <span class="material-symbols-outlined text-xs text-primary font-black animate-bounce">keyboard_double_arrow_up</span>
                        </div>
                    </div>
                    <!-- HUD Data -->
                    <div class="absolute top-1/2 left-full ml-4 -translate-y-1/2 opacity-0 group-hover:opacity-100 transition-all duration-300 pointer-events-none z-50">
                        <div class="glass p-4 rounded-2xl border border-white min-w-[200px] shadow-2xl bg-white/90 backdrop-blur-xl">
                            <div class="flex items-center gap-2 mb-3 pb-3 border-b border-slate-100">
                                 <div class="size-8 rounded-full bg-slate-100 overflow-hidden">
                                    <img src="https://ui-avatars.com/api/?name=Michael+Chen&background=random" alt="Driver" class="w-full h-full object-cover" />
                                 </div>
                                 <div>
                                    <p class="text-[10px] font-black text-slate-900 uppercase">Unit #8842</p>
                                    <p class="text-[8px] font-bold text-green-600 uppercase tracking-wider">● Online</p>
                                 </div>
                            </div>
                            <p class="text-[9px] font-black text-slate-400 uppercase tracking-[0.2em] mb-1">Live Telemetry</p>
                            <div class="flex justify-between items-end mb-2">
                                <h4 class="text-sm font-black text-slate-900">Speed</h4>
                                <span class="text-[10px] font-bold text-primary">104.6 KM/H</span>
                            </div>
                            <div class="h-1 w-full bg-slate-100 rounded-full overflow-hidden mb-2">
                                <div class="h-full bg-primary relative overflow-hidden" style="width: 75%">
                                    <div class="absolute inset-0 bg-white/30 animate-[shimmer_1s_infinite]"></div>
                                </div>
                            </div>
                            <p class="text-[8px] font-bold text-slate-400">Updating @ 50ms latency</p>
                        </div>
                    </div>
                </div>

                <!-- Path Vector Overlay (Stylized) -->
                <svg class="absolute inset-0 w-full h-full pointer-events-none opacity-40 mix-blend-overlay" viewbox="0 0 100 100" preserveaspectratio="none">
                    <path d="M40 35 L 55 45 L 70 60" fill="none" stroke="#2563eb" stroke-width="0.5" stroke-dasharray="2,2">
                        <animate attributeName="stroke-dashoffset" from="100" to="0" dur="10s" repeatCount="indefinite" />
                    </path>
                </svg>

                <!-- Map Interface Controls -->
                <div class="absolute bottom-10 right-10 flex flex-col gap-4 z-30">
                    <div class="flex flex-col rounded-2xl overflow-hidden glass border border-white shadow-2xl bg-white/80 backdrop-blur-md">
                        <button class="size-12 flex items-center justify-center hover:bg-slate-100 text-slate-500 hover:text-primary transition-all"><span class="material-symbols-outlined font-black">add</span></button>
                        <div class="h-px bg-slate-200"></div>
                        <button class="size-12 flex items-center justify-center hover:bg-slate-100 text-slate-500 hover:text-primary transition-all"><span class="material-symbols-outlined font-black">remove</span></button>
                    </div>
                    <button class="size-12 rounded-2xl bg-slate-900 text-white flex items-center justify-center shadow-2xl micro-interaction hover:scale-110 transition-transform">
                        <span class="material-symbols-outlined text-[20px]">my_location</span>
                    </button>
                </div>
            </main>
            
            <!-- Operational Intel Panel -->
            <aside class="w-[420px] bg-white border-l border-slate-100 flex flex-col shrink-0 z-40 relative shadow-[-20px_0_40px_rgba(0,0,0,0.02)]">
                <div class="flex flex-col h-full overflow-y-auto">
                    <div class="p-10 border-b border-slate-50">
                        <div class="flex justify-between items-start mb-6">
                            <div>
                                <p class="text-[10px] font-black text-slate-400 uppercase tracking-widest mb-1 leading-none">Consignment Node</p>
                                <h2 class="text-3xl font-black text-slate-900 tracking-tight leading-none">Ref #12345</h2>
                            </div>
                            <button class="p-2.5 rounded-xl bg-slate-50 text-slate-400 hover:text-primary transition-all">
                                <span class="material-symbols-outlined">more_vert</span>
                            </button>
                        </div>
                        
                        <div class="flex gap-2">
                            <div class="px-3 py-1.5 rounded-full bg-primary/5 border border-primary/10 text-[9px] font-black uppercase tracking-widest text-primary flex items-center gap-1.5 leading-none">
                                <span class="size-1.5 rounded-full bg-primary animate-pulse"></span> Synchronizing
                            </div>
                            <div class="px-3 py-1.5 rounded-full bg-emerald-50 border border-emerald-100 text-[9px] font-black uppercase tracking-widest text-emerald-600 flex items-center gap-1.5 leading-none">
                                <span class="material-symbols-outlined text-[10px] font-black">check_circle</span> Optimized
                            </div>
                        </div>
                    </div>

                    <!-- Live Metrics -->
                    <div class="p-10 grid grid-cols-2 gap-6 pb-2">
                        <div class="premium-card p-6 bg-slate-50/50 border-none shadow-none">
                            <p class="text-[9px] font-black text-slate-400 uppercase tracking-widest mb-3">Est. Delivery</p>
                            <p class="text-2xl font-black text-slate-900 leading-none">14:30 <span class="text-xs text-slate-400 font-bold uppercase ml-1">UTC</span></p>
                        </div>
                        <div class="premium-card p-6 bg-slate-50/50 border-none shadow-none">
                            <p class="text-[9px] font-black text-slate-400 uppercase tracking-widest mb-3">Dist. Egress</p>
                            <p class="text-2xl font-black text-slate-900 leading-none">228.4 <span class="text-xs text-slate-400 font-bold uppercase ml-1">KM</span></p>
                        </div>
                    </div>

                    <!-- Timeline Egress -->
                    <div class="p-10 flex-1">
                        <h3 class="text-[10px] font-black text-slate-400 uppercase tracking-[0.2em] mb-10">Transit Trajectory</h3>
                        <div class="space-y-12 relative px-4">
                            <div class="absolute left-[31px] top-2 bottom-2 w-px bg-slate-100"></div>
                            
                            {#each [
                                { point: 'Industrial Hub, IL', status: 'Egress Verified', time: '08:00 UTC', active: false },
                                { point: 'Node #42, IN', status: 'In Transit • I-90 E', time: 'LIVE NODE', active: true },
                                { point: 'Logistics Gate East, MI', status: 'Ingress Scheduled', time: '14:30 UTC', active: false }
                            ] as step}
                                <div class="flex gap-8 relative z-10 transition-all {step.active ? 'scale-105' : 'opacity-60'}">
                                    <div class="size-9 rounded-xl flex items-center justify-center shrink-0 border-4 border-white shadow-xl {step.active ? 'bg-primary text-white' : 'bg-slate-100 text-slate-300'}">
                                        <span class="material-symbols-outlined text-[14px] font-black">{step.active ? 'expand_more' : (step.time.includes('UTC') ? 'radio_button_checked' : 'pending')}</span>
                                    </div>
                                    <div class="flex-1">
                                        <div class="flex justify-between items-baseline mb-1">
                                            <p class="text-sm font-black {step.active ? 'text-slate-900' : 'text-slate-500'}">{step.point}</p>
                                            <p class="text-[9px] font-black {step.active ? 'text-primary' : 'text-slate-400'} uppercase tracking-tight">{step.time}</p>
                                        </div>
                                        <p class="text-[10px] font-bold text-slate-400 uppercase tracking-widest">{step.status}</p>
                                    </div>
                                </div>
                            {/each}
                        </div>
                    </div>

                        <div class="p-10 bg-slate-50/50 border-t border-slate-100 mt-auto">
                            <div class="flex justify-between items-center mb-6">
                                <h3 class="text-[10px] font-black text-slate-400 uppercase tracking-widest leading-none">Chain of Custody</h3>
                                <span class="text-[9px] font-black text-primary uppercase animate-pulse">Pending Arrival</span>
                            </div>
                            
                            <div class="grid grid-cols-2 gap-4 mb-8">
                                <div class="p-4 rounded-xl bg-white border border-slate-200 flex flex-col items-center text-center group transition-all hover:border-primary/20 cursor-pointer">
                                    <span class="material-symbols-outlined text-slate-300 group-hover:text-primary transition-colors mb-2">add_a_photo</span>
                                    <p class="text-[9px] font-black text-slate-500 uppercase">Egress Photo</p>
                                </div>
                                <div class="p-4 rounded-xl bg-white border border-slate-200 flex flex-col items-center text-center group transition-all hover:border-primary/20 cursor-pointer">
                                    <span class="material-symbols-outlined text-slate-300 group-hover:text-primary transition-colors mb-2">draw</span>
                                    <p class="text-[9px] font-black text-slate-500 uppercase">Digital Sig</p>
                                </div>
                            </div>

                            <h3 class="text-[10px] font-black text-slate-400 uppercase tracking-widest mb-6">Partner Terminal</h3>
                            <div class="flex items-center gap-5 mb-8">
                                <div class="relative">
                                    <div class="size-14 rounded-2xl bg-cover bg-center border-2 border-white shadow-xl" style="background-image: url('https://images.unsplash.com/photo-1542385151-efd9000785a0?q=80&w=200&auto=format&fit=crop');"></div>
                                    <div class="absolute -bottom-1 -right-1 size-5 bg-emerald-500 rounded-lg border-2 border-white flex items-center justify-center shadow-lg">
                                        <span class="material-symbols-outlined text-[10px] text-white font-black">bolt</span>
                                    </div>
                                </div>
                                <div class="flex-1">
                                    <p class="text-base font-black text-slate-900 leading-none mb-1.5">Michael R. Chen</p>
                                    <div class="flex items-center gap-3">
                                        <span class="inline-flex items-center gap-1 text-[10px] font-black text-slate-400 uppercase tracking-widest">
                                            <span class="material-symbols-outlined text-[14px] text-yellow-500 fill-current">star</span> 4.98
                                        </span>
                                    </div>
                                </div>
                                <button onclick={() => alert('Starting Secure Chat...')} class="size-10 rounded-xl bg-white border border-slate-200 text-slate-400 hover:text-primary transition-all flex items-center justify-center micro-interaction">
                                    <span class="material-symbols-outlined">forum</span>
                                </button>
                            </div>
                            
                            <div class="grid grid-cols-2 gap-4">
                                <button class="py-4 bg-white border border-slate-200 text-slate-900 rounded-xl font-black text-xs hover:border-slate-300 transition-all micro-interaction">Operational Logs</button>
                                <a href="tel:911" class="flex items-center justify-center py-4 bg-slate-900 text-white rounded-xl font-black text-xs shadow-xl shadow-slate-200 micro-interaction hover:bg-red-600 transition-colors">Emergency Direct</a>
                            </div>
                        </div>
                </div>
            </aside>
    </div>
</div>
