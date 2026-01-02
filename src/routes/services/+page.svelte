<script>
    import Navbar from '$lib/components/Navbar.svelte';
    import Footer from '$lib/components/Footer.svelte';
</script>

<div class="font-display antialiased text-slate-900 dark:text-white bg-background-light dark:bg-background-dark min-h-screen flex flex-col">
    <Navbar />

    <main class="flex-grow">
        <!-- Hero Section -->
        <div class="relative py-24 bg-slate-900 overflow-hidden">
            <div class="absolute inset-0 bg-[url('https://images.unsplash.com/photo-1519003722824-194d4455a60c?q=80&w=2075&auto=format&fit=crop')] bg-cover bg-center opacity-30"></div>
            <div class="absolute inset-0 bg-gradient-to-b from-slate-900/60 to-slate-900"></div>
            
            <div class="relative z-10 mx-auto max-w-7xl px-4 sm:px-6 lg:px-8 text-center">
                <h1 class="text-4xl font-black tracking-tight text-white sm:text-6xl mb-6">Our Services</h1>
                <p class="mx-auto max-w-2xl text-lg text-slate-300">
                    We move your goods safely across the world. Simple, fast, and reliable.
                </p>
            </div>
        </div>

        <!-- Services Grid -->
        <div class="py-24">
            <div class="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">
                <div class="grid grid-cols-1 gap-12 md:grid-cols-2 lg:grid-cols-4">
                    <!-- Service 1 -->
                    <div class="group p-8 rounded-2xl border border-slate-200 dark:border-slate-800 bg-white dark:bg-slate-900/50 hover:border-primary/50 transition-all">
                        <div class="size-12 rounded-xl bg-blue-100 dark:bg-blue-900/30 text-primary flex items-center justify-center mb-6">
                            <span class="material-symbols-outlined">local_shipping</span>
                        </div>
                        <h3 class="text-xl font-bold mb-4">Road Transport</h3>
                        <p class="text-slate-600 dark:text-slate-400 text-sm leading-relaxed">
                            Moving big trucks across the country. Your items stay safe and arrive on time.
                        </p>
                    </div>

                    <!-- Service 2 -->
                    <div class="group p-8 rounded-2xl border border-slate-200 dark:border-slate-800 bg-white dark:bg-slate-900/50 hover:border-primary/50 transition-all">
                        <div class="size-12 rounded-xl bg-blue-100 dark:bg-blue-900/30 text-primary flex items-center justify-center mb-6">
                            <span class="material-symbols-outlined">directions_boat</span>
                        </div>
                        <h3 class="text-xl font-bold mb-4">Ocean Shipping</h3>
                        <p class="text-slate-600 dark:text-slate-400 text-sm leading-relaxed">
                            Sending goods across the sea in containers. We handle the hard work at the docks.
                        </p>
                    </div>

                    <!-- Service 3 -->
                    <div class="group p-8 rounded-2xl border border-slate-200 dark:border-slate-800 bg-white dark:bg-slate-900/50 hover:border-primary/50 transition-all">
                        <div class="size-12 rounded-xl bg-blue-100 dark:bg-blue-900/30 text-primary flex items-center justify-center mb-6">
                            <span class="material-symbols-outlined">inventory_2</span>
                        </div>
                        <h3 class="text-xl font-bold mb-4">Easy Storage</h3>
                        <p class="text-slate-600 dark:text-slate-400 text-sm leading-relaxed">
                            Keeping your items safe in our warehouses. 24/7 security for your peace of mind.
                        </p>
                    </div>

                    <!-- Service 4 -->
                    <div class="group p-8 rounded-2xl border border-slate-200 dark:border-slate-800 bg-white dark:bg-slate-900/50 hover:border-primary/50 transition-all">
                        <div class="size-12 rounded-xl bg-blue-100 dark:bg-blue-900/30 text-primary flex items-center justify-center mb-6">
                            <span class="material-symbols-outlined">map</span>
                        </div>
                        <h3 class="text-xl font-bold mb-4">Smart Tracking</h3>
                        <p class="text-slate-600 dark:text-slate-400 text-sm leading-relaxed">
                            Always know where your shipment is. Real-time GPS updates on your phone.
                        </p>
                    </div>
                </div>
            </div>
        </div>

        <!-- CTA -->
        <div class="py-24 bg-primary/5 border-y border-primary/10">
            <div class="mx-auto max-w-7xl px-4 text-center">
                <h2 class="text-3xl font-bold mb-8">Need a Custom Quote?</h2>
                <a href="/contact" class="inline-flex h-12 items-center justify-center rounded-lg bg-primary px-8 text-base font-bold text-white shadow-xl shadow-primary/25 hover:bg-blue-600 transition-all">
                    Talk to Us
                </a>
            </div>
        </div>
    </main>

    <Footer />
</div>
