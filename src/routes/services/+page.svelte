<script>
    import Navbar from '$lib/components/Navbar.svelte';
    import Footer from '$lib/components/Footer.svelte';
</script>

<div class="font-display antialiased text-slate-900 bg-bg-main min-h-screen flex flex-col selection:bg-primary/10">
    <Navbar />

    <main class="flex-grow pt-24">
        <!-- Hero Section -->
        <section class="relative py-32 overflow-hidden bg-slate-900 text-white">
            <!-- Animated Background -->
            <div class="absolute inset-0 opacity-20">
                <div class="absolute -top-24 -left-24 size-96 bg-primary blur-[120px] rounded-full"></div>
                <div class="absolute -bottom-24 -right-24 size-96 bg-blue-500 blur-[120px] rounded-full"></div>
            </div>
            
            <div class="relative z-10 mx-auto max-w-7xl px-6 lg:px-8 text-center">
                <div class="inline-flex items-center gap-2 px-4 py-2 rounded-full bg-white/5 border border-white/10 text-[10px] font-black uppercase tracking-[0.3em] text-primary mb-8">
                    Institutional Logistics Matrix
                </div>
                <h1 class="text-5xl md:text-7xl font-black tracking-tight mb-8 leading-none">
                    Multi-modal <span class="italic text-primary">Intelligence</span>.
                </h1>
                <p class="mx-auto max-w-2xl text-xl text-slate-400 font-medium leading-relaxed">
                    Orchestrating global commerce through autonomous networking and clinical precision.
                </p>
            </div>
        </section>

        <!-- Services Grid -->
        <section class="py-32 relative">
            <div class="mx-auto max-w-7xl px-6 lg:px-8">
                <div class="grid grid-cols-1 md:grid-cols-2 gap-8">
                    {#each [
                        { icon: 'local_shipping', title: 'Line-Haul Solutions', desc: 'High-velocity road transport with verified carrier nodes and real-time telemetry.' },
                        { icon: 'directions_boat', title: 'Intermodal Nexus', desc: 'Seamless ocean-to-rail transitions managed through autonomous smart-contracts.' },
                        { icon: 'inventory_2', title: 'Strategic Vaults', desc: 'Climate-controlled institutional warehousing with 100% inventory synchronization.' },
                        { icon: 'monitoring', title: 'Predictive Analytics', desc: 'AI-driven supply chain forecasting with sub-millisecond route optimization.' }
                    ] as service}
                        <div class="premium-card p-12 group micro-interaction flex flex-col md:flex-row gap-8 items-start">
                            <div class="size-16 rounded-2xl bg-slate-50 border border-slate-100 flex items-center justify-center text-slate-400 group-hover:bg-primary/10 group-hover:text-primary group-hover:border-primary/20 transition-all shrink-0">
                                <span class="material-symbols-outlined text-3xl font-black">{service.icon}</span>
                            </div>
                            <div>
                                <h3 class="text-2xl font-black text-slate-900 mb-4 tracking-tight">{service.title}</h3>
                                <p class="text-slate-500 font-medium leading-relaxed mb-6">
                                    {service.desc}
                                </p>
                                <button class="text-[10px] font-black uppercase tracking-widest text-primary hover:underline">View Protocol Specifications</button>
                            </div>
                        </div>
                    {/each}
                </div>
            </div>
        </section>

        <!-- CTA -->
        <section class="py-32 bg-slate-900 text-white relative overflow-hidden">
             <div class="absolute inset-0 bg-primary/5"></div>
             <div class="mx-auto max-w-7xl px-6 relative z-10 text-center">
                <h2 class="text-4xl md:text-5xl font-black mb-8 tracking-tight">Expand your operational reach.</h2>
                <div class="flex justify-center gap-6">
                    <a href="/contact" class="inline-flex h-14 items-center px-10 rounded-2xl bg-white text-slate-900 font-black text-sm shadow-2xl micro-interaction">
                        Initialize Consultation
                    </a>
                </div>
             </div>
        </section>
    </main>

    <Footer />
</div>
