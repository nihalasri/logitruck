    <script>
	import Navbar from '$lib/components/Navbar.svelte';
	import Footer from '$lib/components/Footer.svelte';
	import favicon from '$lib/assets/favicon.svg';
    import homepageHero from '$lib/assets/homepage_hero.png';
    import { base } from '$app/paths';
</script>

<div class="font-display antialiased text-slate-900 bg-bg-main min-h-screen flex flex-col selection:bg-primary/10 selection:text-primary">
    <Navbar />

    <main class="flex-grow pt-24 overflow-hidden relative">
        <!-- Cinematic Background Image -->
        <div class="absolute top-0 left-0 w-full h-[850px] overflow-hidden pointer-events-none">
            <div class="absolute inset-0 bg-white/60 z-10"></div> <!-- Light Theme Overlay -->
            <div class="absolute inset-0 bg-gradient-to-b from-transparent via-white/80 to-white z-10"></div>
            <img 
                src={homepageHero} 
                alt="Global Logistics Network"
                class="w-full h-full object-cover grayscale opacity-79 scale-140"
            />
        </div>

        <!-- Premium Radial Lighting -->
        <div class="absolute top-0 left-1/2 -translate-x-1/2 w-full h-[800px] pointer-events-none opacity-40 z-20">
            <div class="absolute top-[-100px] left-1/2 -translate-x-1/2 w-[1000px] h-[600px] bg-primary/20 blur-[120px] rounded-full"></div>
            <div class="absolute top-[100px] left-1/3 w-[400px] h-[400px] bg-blue-400/10 blur-[100px] rounded-full"></div>
        </div>

        <!-- Hero Section -->
        <section class="relative z-10 mx-auto max-w-7xl px-6 lg:px-8 pt-12 pb-32">
            <!-- Text Backdrop Glow -->
            <div class="absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 w-[600px] h-[400px] bg-blue-200/30 blur-[100px] -z-10 rounded-full pointer-events-none"></div>

            <div class="flex flex-col items-center text-center">
                <div class="inline-flex items-center gap-2 rounded-full border border-primary/20 bg-white/50 backdrop-blur-xl px-4 py-1.5 text-xs font-bold text-primary mb-10 shadow-sm animate-fade-in micro-interaction">
                    <span class="flex h-2 w-2 rounded-full bg-primary animate-pulse shadow-[0_0_8px_var(--color-primary)]"></span>
                    LOGISTICS MADE EASY
                </div>

                <h1 class="mx-auto max-w-5xl text-5xl font-black tracking-tight text-slate-900 sm:text-8xl mb-8 leading-[0.9] drop-shadow-sm">
                    Move your world <br />
                    <span class="text-gradient">smarter</span> than ever.
                </h1>

                <p class="mx-auto max-w-2xl text-xl text-text-muted leading-relaxed mb-12 font-medium">
                    Easy-to-use delivery system. Book and track your shipments easily.
                </p>

                <div class="flex flex-col sm:flex-row gap-5 justify-center items-center">
                    <a href="{base}/client/dashboard" class="group relative flex h-14 items-center justify-center rounded-2xl bg-primary px-10 text-lg font-bold text-white shadow-2xl shadow-primary/30 transition-all hover:scale-105 active:scale-95">
                        <span class="relative z-10 flex items-center gap-3">
                            Post your load
                            <span class="material-symbols-outlined text-[24px] transition-transform group-hover:rotate-12">package_2</span>
                        </span>
                        <div class="absolute inset-0 bg-gradient-to-tr from-white/20 to-transparent opacity-0 group-hover:opacity-100 transition-opacity rounded-2xl"></div>
                    </a>
                    
                    <a href="{base}/driver/dashboard" class="moving-border h-14 rounded-2xl shadow-xl shadow-slate-200 micro-interaction">
                        <div class="moving-border-content px-10 gap-3 text-slate-700">
                             <span class="material-symbols-outlined text-[24px] text-primary">local_shipping</span>
                             <span class="text-lg font-bold">Pick up load</span>
                        </div>
                    </a>
                </div>

                <!-- Interactive Dashboard Preview -->
                <div class="mt-24 relative mx-auto max-w-6xl group">
                    <div class="absolute -inset-1 bg-gradient-to-r from-primary to-blue-400 rounded-[2.5rem] blur opacity-10 group-hover:opacity-20 transition duration-1000 group-hover:duration-200"></div>
                    <div class="relative rounded-[2.2rem] border-8 border-white bg-white shadow-[0_32px_64px_-16px_rgba(0,0,0,0.1)] overflow-hidden">
                         <img src="https://images.unsplash.com/photo-1586528116311-ad8dd3c8310d?q=80&w=2070&auto=format&fit=crop" alt="Logistics Dashboard" class="w-full grayscale-[0.2] group-hover:grayscale-0 transition-all duration-700" />
                         <!-- Glass Overlay Controls -->
                         <div class="absolute top-6 left-6 flex gap-2">
                             <div class="size-3 rounded-full bg-red-400"></div>
                             <div class="size-3 rounded-full bg-amber-400"></div>
                             <div class="size-3 rounded-full bg-emerald-400"></div>
                         </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Dynamic Features Grid -->
        <section id="features" class="py-32 relative bg-white border-y border-slate-100">
            <div class="mx-auto max-w-7xl px-6 lg:px-8">
                <div class="grid grid-cols-1 lg:grid-cols-3 gap-12 items-end mb-24">
                    <div class="lg:col-span-2">
                         <h2 class="text-primary font-black uppercase tracking-[0.2em] text-sm mb-4">How it works</h2>
                         <p class="text-4xl md:text-6xl font-black text-slate-900 tracking-tight leading-none">Built for scale, <br /> refined for speed.</p>
                    </div>
                    <p class="text-lg text-text-muted font-medium lg:pb-2">Made to handle all deliveries at fast speed while keeping everything clear.</p>
                </div>

                <div class="grid grid-cols-1 gap-8 md:grid-cols-3">
                    {#each [
                        { icon: 'location_searching', title: 'Live Tracking', desc: 'Real-time GPS updates every 5 seconds so you always know where it is.' },
                        { icon: 'auto_mode', title: 'Smart Routes', desc: 'AI that finds the best and fastest routes for you.' },
                        { icon: 'verified_user', title: 'Safe & Insured', desc: 'Every shipment is safe and covered by our insurance network.' }
                    ] as feature}
                    <div class="premium-card p-10 group micro-interaction">
                        <div class="mb-8 flex h-14 w-14 items-center justify-center rounded-2xl bg-primary/10 text-primary shadow-inner shadow-primary/5 transition-transform group-hover:scale-110 group-hover:rotate-3">
                            <span class="material-symbols-outlined text-3xl font-bold">{feature.icon}</span>
                        </div>
                        <h3 class="text-2xl font-black text-slate-900 mb-4 tracking-tight">{feature.title}</h3>
                        <p class="text-text-muted leading-relaxed font-medium">{feature.desc}</p>
                    </div>
                    {/each}
                </div>
            </div>
        </section>

        <!-- Final Call to Action -->
        <section class="py-40 relative overflow-hidden flex flex-col items-center">
             <div class="absolute inset-x-0 top-0 h-px bg-gradient-to-r from-transparent via-slate-200 to-transparent"></div>
             <div class="absolute inset-0 bg-primary/[0.02]"></div>
             
             <div class="text-center relative z-10 px-6">
                <h2 class="text-4xl md:text-6xl font-black text-slate-900 mb-8 tracking-tighter">Ready to start?</h2>
                <p class="mx-auto max-w-xl text-xl text-text-muted mb-12 font-medium">
                    Join many others using LogiPro. Start using it in under 10 minutes.
                </p>
                <a href="{base}/signup" class="inline-flex h-16 items-center px-12 rounded-2xl bg-slate-900 text-white font-black text-lg hover:bg-slate-800 transition-all hover:scale-105 active:scale-95 shadow-2xl shadow-slate-400/30">
                    Get started today
                </a>
             </div>
        </section>
    </main>

    <Footer />
</div>
