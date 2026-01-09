<script>
    import Navbar from '$lib/components/Navbar.svelte';
    import Footer from '$lib/components/Footer.svelte';
    import servicesHero from '$lib/assets/services_hero.png';
</script>

<div class="font-display antialiased text-slate-900 bg-bg-main min-h-screen flex flex-col selection:bg-primary/10">
    <Navbar />

    <main class="flex-grow pt-24">
        <section class="relative py-32 overflow-hidden bg-white text-slate-900">
            <!-- Background Image -->
            <div class="absolute inset-0 z-0">
                <img src={servicesHero} alt="Smart Shipping Services" class="w-full h-full object-cover opacity-50" />
                <div class="absolute inset-0 bg-gradient-to-t from-white via-white/70 to-transparent"></div>
            </div>
            
            <div class="relative z-10 mx-auto max-w-7xl px-6 lg:px-8 text-center">
                <div class="inline-flex items-center gap-2 px-4 py-2 rounded-full bg-slate-100 border border-slate-200 text-[10px] font-black uppercase tracking-[0.3em] text-primary mb-8 backdrop-blur-sm">
                    Our Delivery Services
                </div>
                <h1 class="text-5xl md:text-7xl font-black tracking-tight mb-8 leading-none">
                    Smart <span class="italic text-primary">Shipping</span>.
                </h1>
                <p class="mx-auto max-w-2xl text-xl text-slate-500 font-medium leading-relaxed">
                    We help move goods everywhere with ease and accuracy.
                </p>
            </div>
        </section>

        <!-- Services Grid -->
        <section class="py-32 relative">
            <div class="mx-auto max-w-7xl px-6 lg:px-8">
                <div class="grid grid-cols-1 md:grid-cols-2 gap-8">
                    {#each [
                        { icon: 'local_shipping', title: 'Road Transport', desc: 'Fast road delivery with real-time tracking.' },
                        { icon: 'directions_boat', title: 'Sea & Rail Transport', desc: 'Easy shipping from sea to rail with smart digital tracking.' },
                        { icon: 'inventory_2', title: 'Safe Storage', desc: 'Safe, temperature-controlled storage with live inventory tracking.' },
                        { icon: 'monitoring', title: 'Smart Planning', desc: 'AI plans the best and fastest routes for you.' }
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
                                <button class="text-[10px] font-black uppercase tracking-widest text-primary hover:underline">Learn More</button>
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
                <h2 class="text-4xl md:text-5xl font-black mb-8 tracking-tight">Grow your business with us.</h2>
                <div class="flex justify-center gap-6">
                    <a href="/contact" class="inline-flex h-14 items-center px-10 rounded-2xl bg-white text-slate-900 font-black text-sm shadow-2xl micro-interaction">
                        Talk to Us
                    </a>
                </div>
             </div>
        </section>
    </main>

    <Footer />
</div>
