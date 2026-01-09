<script>
    import Navbar from '$lib/components/Navbar.svelte';
    import Footer from '$lib/components/Footer.svelte';
    import contactHero from '$lib/assets/contact_hero.png';

    let name = $state('');
    let email = $state('');
    let message = $state('');
    let isSent = $state(false);

    function handleSubmit(e) {
        e.preventDefault();
        isSent = true;
        setTimeout(() => isSent = false, 5000);
    }
</script>

<div class="font-display antialiased text-slate-900 bg-bg-main min-h-screen flex flex-col selection:bg-primary/10">
    <Navbar />

    <main class="flex-grow pt-24">
        <!-- Hero Section -->
        <section class="relative py-24 overflow-hidden border-b border-slate-100">
            <!-- Background Image -->
            <div class="absolute inset-0 z-0">
                 <img src={contactHero} alt="Contact Support" class="w-full h-full object-cover opacity-70" />
                 <div class="absolute inset-0 bg-gradient-to-b from-white/70 to-white/66"></div>
            </div>

            <div class="absolute inset-0 bg-[radial-gradient(40%_40%_at_50%_0%,rgba(29,78,216,0.02)_0%,transparent_100%)] z-10"></div>
            <div class="relative z-10 mx-auto max-w-7xl px-6 lg:px-8 text-center">
                <h1 class="text-5xl md:text-6xl font-black tracking-tight text-slate-900 mb-6 leading-none">Contact <span class="text-primary">Us</span></h1>
                <p class="mx-auto max-w-2xl text-lg text-slate-500 font-medium">
                    Get in touch with us for help and support.
                </p>
            </div>
        </section>

        <section class="py-24">
            <div class="mx-auto max-w-7xl px-6 lg:px-8">
                <div class="grid grid-cols-1 lg:grid-cols-12 gap-16 items-start">
                    <!-- Contact Info -->
                    <div class="lg:col-span-5 space-y-12">
                        <div class="space-y-6">
                            <h2 class="text-3xl font-black text-slate-900 tracking-tight">Our Office</h2>
                            <p class="text-slate-500 font-medium leading-relaxed">Our team is ready to help you with any problems.</p>
                        </div>

                        <div class="grid grid-cols-1 gap-8">
                            {#each [
                                { icon: 'alternate_email', label: 'Email Us', val: 'ops@logipro.global' },
                                { icon: 'perm_phone_msg', label: 'Call Us', val: '+1 (800) LOGI-PRO' },
                                { icon: 'location_on', label: 'Visit Us', val: 'Logistics Gate 01, Silicon Valley, CA' }
                            ] as item}
                                <div class="flex items-center gap-6 group">
                                    <div class="size-12 rounded-xl bg-slate-50 border border-slate-100 flex items-center justify-center text-slate-400 group-hover:bg-primary/10 group-hover:text-primary transition-all">
                                        <span class="material-symbols-outlined font-black">{item.icon}</span>
                                    </div>
                                    <div>
                                        <p class="text-[10px] font-black uppercase tracking-widest text-slate-400 mb-1">{item.label}</p>
                                        <p class="text-sm font-black text-slate-900">{item.val}</p>
                                    </div>
                                </div>
                            {/each}
                        </div>
                    </div>

                    <!-- Contact Form -->
                    <div class="lg:col-span-7">
                        <div class="premium-card p-10 md:p-16 relative overflow-hidden">
                            {#if isSent}
                                <div class="py-20 text-center animate-fade-in">
                                    <div class="size-20 rounded-2xl bg-emerald-50 text-emerald-600 flex items-center justify-center mx-auto mb-8 animate-bounce">
                                        <span class="material-symbols-outlined text-4xl font-black">verified</span>
                                    </div>
                                    <h3 class="text-3xl font-black text-slate-900 mb-4 tracking-tight">Message Sent</h3>
                                    <p class="text-slate-500 font-medium">We have received your message and will get back to you soon.</p>
                                </div>
                            {:else}
                                <form onsubmit={handleSubmit} class="space-y-8">
                                    <div class="grid grid-cols-1 md:grid-cols-2 gap-8">
                                        <div class="space-y-2">
                                            <span class="text-[10px] font-black uppercase tracking-widest text-slate-400 ml-1">Full Name</span>
                                            <input bind:value={name} type="text" placeholder="John Q. Professional" required class="w-full px-5 py-4 rounded-2xl bg-slate-50 border-none text-sm font-bold focus:bg-white focus:ring-2 focus:ring-primary/20 transition-all shadow-inner" />
                                        </div>
                                        <div class="space-y-2">
                                            <span class="text-[10px] font-black uppercase tracking-widest text-slate-400 ml-1">Email Address</span>
                                            <input bind:value={email} type="email" placeholder="name@infrastructure.global" required class="w-full px-5 py-4 rounded-2xl bg-slate-50 border-none text-sm font-bold focus:bg-white focus:ring-2 focus:ring-primary/20 transition-all shadow-inner" />
                                        </div>
                                    </div>

                                    <div class="space-y-2">
                                        <span class="text-[10px] font-black uppercase tracking-widest text-slate-400 ml-1">Your Message</span>
                                        <textarea bind:value={message} required rows="5" placeholder="Tell us what you need..." class="w-full px-5 py-4 rounded-2xl bg-slate-50 border-none text-sm font-bold focus:bg-white focus:ring-2 focus:ring-primary/20 transition-all shadow-inner resize-none"></textarea>
                                    </div>

                                    <button type="submit" class="w-full py-5 bg-slate-900 text-white rounded-2xl font-black text-sm shadow-2xl shadow-slate-200 micro-interaction flex items-center justify-center gap-3">
                                        Send Message
                                        <span class="material-symbols-outlined text-sm">send</span>
                                    </button>
                                </form>
                            {/if}
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </main>

    <Footer />
</div>
