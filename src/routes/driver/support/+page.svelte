<script>
  import DriverSidebar from '$lib/components/DriverSidebar.svelte';

  const faqs = [
    { q: 'How do I initiate emergency roadside support?', a: 'Use the "Tactical SOS" button in your dashboard or call the direct support line (found below) for immediate dispatch of recovery teams.' },
    { q: 'What is the "Backhaul Optimization" algorithm?', a: 'Our AI analyzes your current route and destination to find high-yield loads that bring you back to your home base or next preferred node.' },
    { q: 'How are detention fees calculated?', a: 'Detention begins 2 hours after your scheduled appointment time. Documentation must be uploaded via the "Telemetry Sync" button.' }
  ];
</script>

<div class="bg-bg-main text-slate-900 font-display min-h-screen flex selection:bg-primary/10">
    <DriverSidebar activePage="support" />

    <main class="flex-1 flex flex-col h-screen overflow-hidden relative">
        <header class="flex items-center justify-between glass border-b border-slate-200 px-8 py-5 h-20 shrink-0 z-20">
            <div class="flex items-center gap-4">
                <a href="/driver/dashboard" class="p-2 rounded-xl text-slate-400 hover:text-primary transition-all micro-interaction">
                    <span class="material-symbols-outlined">arrow_back</span>
                </a>
                <div class="w-px h-6 bg-slate-200"></div>
                <div>
                    <h2 class="text-2xl font-black text-slate-900 tracking-tight leading-none">Tactical Support</h2>
                    <p class="text-[10px] font-black text-slate-400 uppercase tracking-widest mt-1">Operational Assistance & Intelligence</p>
                </div>
            </div>
            <div class="flex items-center gap-4">
                <button class="bg-red-500 hover:bg-red-600 text-white px-6 py-2.5 rounded-xl text-xs font-black uppercase tracking-widest transition-all shadow-lg shadow-red-200 micro-interaction flex items-center gap-2">
                    <span class="material-symbols-outlined text-[18px]">emergency_share</span>
                    Tactical SOS
                </button>
            </div>
        </header>

        <div class="flex-1 overflow-y-auto p-8 bg-[radial-gradient(40%_40%_at_50%_0%,rgba(29,78,216,0.02)_0%,transparent_100%)]">
            <div class="max-w-5xl mx-auto space-y-12">
                <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
                    <div class="premium-card p-8 bg-white text-center group cursor-pointer hover:border-primary/20 transition-all">
                        <div class="size-16 rounded-2xl bg-primary/10 text-primary mx-auto mb-6 flex items-center justify-center group-hover:scale-110 transition-transform">
                            <span class="material-symbols-outlined text-3xl">chat</span>
                        </div>
                        <h4 class="text-sm font-black text-slate-900 uppercase tracking-widest mb-2">Live Comms</h4>
                        <p class="text-[10px] font-bold text-slate-500 uppercase">Average response: 2 mins</p>
                    </div>
                    <div class="premium-card p-8 bg-white text-center group cursor-pointer hover:border-emerald-200 transition-all">
                        <div class="size-16 rounded-2xl bg-emerald-50 text-emerald-600 mx-auto mb-6 flex items-center justify-center group-hover:scale-110 transition-transform">
                            <span class="material-symbols-outlined text-3xl">phone_in_talk</span>
                        </div>
                        <h4 class="text-sm font-black text-slate-900 uppercase tracking-widest mb-2">Direct Voice</h4>
                        <p class="text-[10px] font-bold text-slate-500 uppercase">Priority Driver Link</p>
                    </div>
                    <div class="premium-card p-8 bg-white text-center group cursor-pointer hover:border-blue-200 transition-all">
                        <div class="size-16 rounded-2xl bg-blue-50 text-blue-600 mx-auto mb-6 flex items-center justify-center group-hover:scale-110 transition-transform">
                            <span class="material-symbols-outlined text-3xl">description</span>
                        </div>
                        <h4 class="text-sm font-black text-slate-900 uppercase tracking-widest mb-2">Field Manual</h4>
                        <p class="text-[10px] font-bold text-slate-500 uppercase">Operating Procedures</p>
                    </div>
                </div>

                <div class="grid grid-cols-1 lg:grid-cols-12 gap-12">
                    <div class="lg:col-span-7">
                        <h3 class="text-xl font-black text-slate-900 mb-8 uppercase tracking-tight">System Knowledge Base</h3>
                        <div class="space-y-4">
                            {#each faqs as faq}
                                <div class="premium-card p-6 bg-white cursor-pointer group">
                                    <div class="flex justify-between items-center mb-2">
                                        <h4 class="text-sm font-black text-slate-900 group-hover:text-primary transition-colors">{faq.q}</h4>
                                        <span class="material-symbols-outlined text-slate-400">add</span>
                                    </div>
                                    <p class="text-xs font-bold text-slate-500 leading-relaxed">{faq.a}</p>
                                </div>
                            {/each}
                        </div>
                    </div>
                    
                    <div class="lg:col-span-5">
                        <div class="premium-card p-8 bg-slate-900 text-white relative overflow-hidden h-full">
                            <div class="absolute -right-10 -bottom-10 size-48 bg-primary/20 blur-[60px] rounded-full"></div>
                            <h3 class="text-lg font-black mb-6 uppercase tracking-widest">Ongoing Incidents</h3>
                            <div class="space-y-6">
                                <div class="flex gap-4">
                                    <div class="size-2 rounded-full bg-emerald-500 mt-1.5 shadow-[0_0_10px_rgba(16,185,129,0.5)]"></div>
                                    <div>
                                        <p class="text-xs font-black mb-1">Regional Highway Node: CLEAR</p>
                                        <p class="text-[10px] text-slate-400 font-bold uppercase">All major corridors operational</p>
                                    </div>
                                </div>
                                <div class="flex gap-4">
                                    <div class="size-2 rounded-full bg-yellow-500 mt-1.5 shadow-[0_0_10px_rgba(245,158,11,0.5)]"></div>
                                    <div>
                                        <p class="text-xs font-black mb-1">Fuel Token Processing: DELAY</p>
                                        <p class="text-[10px] text-slate-400 font-bold uppercase">Processing window extended by 4h</p>
                                    </div>
                                </div>
                            </div>

                            <div class="mt-12 pt-8 border-t border-slate-800">
                                <p class="text-[10px] font-black text-slate-500 uppercase tracking-widest mb-4">Network Status</p>
                                <div class="flex items-center justify-between">
                                    <span class="text-xs font-black">All Systems Nominal</span>
                                    <span class="text-[10px] font-black text-emerald-500 uppercase tracking-widest">99.98% Uptime</span>
                                </div>
                                <div class="h-1 w-full bg-slate-800 rounded-full mt-2">
                                    <div class="h-full bg-emerald-500 rounded-full" style="width: 99.98%"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
</div>
