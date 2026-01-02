<script>
	import Navbar from '$lib/components/Navbar.svelte';
	import Footer from '$lib/components/Footer.svelte';
	import favicon from '$lib/assets/favicon.svg';

    let isOpen = $state(false);

    function toggleMenu() {
        isOpen = !isOpen;
    }
</script>

<div class="font-display antialiased text-slate-900 dark:text-white bg-background-light dark:bg-background-dark min-h-screen flex flex-col">
    <Navbar />

    <!-- Hero Section -->
    <main class="flex-grow">
        <div class="relative overflow-hidden pt-16 pb-32">
            <!-- Background Decoration -->
            <div class="absolute inset-0 z-0">
                <div class="absolute top-0 right-0 -mr-20 -mt-20 size-[600px] rounded-full bg-primary/20 blur-3xl opacity-30"></div>
                <div class="absolute bottom-0 left-0 -ml-20 -mb-20 size-[600px] rounded-full bg-blue-500/20 blur-3xl opacity-30"></div>
            </div>

            <div class="relative z-10 mx-auto max-w-7xl px-4 sm:px-6 lg:px-8 flex flex-col items-center text-center">
                <div class="inline-flex items-center rounded-full border border-primary/30 bg-primary/10 px-3 py-1 text-sm font-medium text-primary mb-8 backdrop-blur-sm">
                    <span class="flex h-2 w-2 rounded-full bg-primary mr-2 animate-pulse"></span>
                    Now available in 50+ countries
                </div>

                <h1 class="mx-auto max-w-4xl font-display text-5xl font-black tracking-tight text-slate-900 dark:text-white sm:text-7xl mb-8">
                    Smart Logistics for a <br class="hidden sm:block" />
                    <span class="text-transparent bg-clip-text bg-gradient-to-r from-primary to-blue-400">Connected World</span>
                </h1>

                <p class="mx-auto max-w-2xl text-lg text-slate-600 dark:text-slate-300 leading-relaxed mb-10">
                    Streamline your supply chain with our end-to-end logistics platform. Real-time tracking, automated dispatch, and AI-powered route optimization at your fingertips.
                </p>

                <div class="flex flex-col sm:flex-row gap-4 justify-center items-center">
                    <a href="/client/dashboard" class="flex h-12 items-center justify-center rounded-lg bg-primary px-8 text-base font-bold text-white shadow-xl shadow-primary/25 hover:bg-blue-600 transition-all hover:-translate-y-1">
                        Post Load
                    </a>
                    <a href="/driver/dashboard" class="flex h-12 items-center justify-center rounded-lg border border-slate-200 dark:border-slate-700 bg-white dark:bg-white/5 px-8 text-base font-semibold text-slate-900 dark:text-white hover:bg-slate-50 dark:hover:bg-white/10 transition-all">
                         Pick Load
                    </a>
                </div>

                <!-- Dashboard Preview -->
                <div class="mt-20 relative mx-auto max-w-5xl rounded-2xl border border-slate-200 dark:border-slate-800 bg-slate-900/5 dark:bg-slate-900/50 p-2 backdrop-blur-sm shadow-2xl">
                    <div class="rounded-xl overflow-hidden border border-slate-200 dark:border-slate-800 bg-background-light dark:bg-background-dark">
                         <img src="https://images.unsplash.com/photo-1586528116311-ad8dd3c8310d?q=80&w=2070&auto=format&fit=crop" alt="Logistics Dashboard" class="w-full opacity-90 hover:opacity-100 transition-opacity" />
                         <!-- Overlay Gradient -->
                        <div class="absolute inset-0 bg-gradient-to-t from-background-light dark:from-background-dark to-transparent opacity-20"></div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Features Grid -->
        <div id="features" class="py-24 bg-slate-50 dark:bg-[#151c2c]">
            <div class="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">
                <div class="text-center max-w-3xl mx-auto mb-16">
                    <h2 class="text-base font-semibold text-primary uppercase tracking-wide">Features</h2>
                    <p class="mt-2 text-3xl font-extrabold text-slate-900 dark:text-white sm:text-4xl">Everything you need to ship smarter</p>
                </div>

                <div class="grid grid-cols-1 gap-8 sm:grid-cols-2 lg:grid-cols-3">
                    <!-- Feature 1 -->
                    <div class="group relative rounded-2xl border border-slate-200 dark:border-slate-800 bg-white dark:bg-[#1e293b] p-8 hover:shadow-xl hover:shadow-primary/5 transition-all hover:-translate-y-1">
                        <div class="mb-5 flex h-12 w-12 items-center justify-center rounded-xl bg-blue-100 dark:bg-blue-900/30 text-primary">
                            <span class="material-symbols-outlined text-2xl">local_shipping</span>
                        </div>
                        <h3 class="text-xl font-bold text-slate-900 dark:text-white mb-3">Real-time Tracking</h3>
                        <p class="text-slate-600 dark:text-slate-400">Monitor your fleet and shipments in real-time with GPS accuracy and predictive status updates.</p>
                    </div>

                    <!-- Feature 2 -->
                    <div class="group relative rounded-2xl border border-slate-200 dark:border-slate-800 bg-white dark:bg-[#1e293b] p-8 hover:shadow-xl hover:shadow-primary/5 transition-all hover:-translate-y-1">
                        <div class="mb-5 flex h-12 w-12 items-center justify-center rounded-xl bg-blue-100 dark:bg-blue-900/30 text-primary">
                           <span class="material-symbols-outlined text-2xl">network_check</span>
                        </div>
                        <h3 class="text-xl font-bold text-slate-900 dark:text-white mb-3">Route Optimization</h3>
                        <p class="text-slate-600 dark:text-slate-400">AI-driven routing reduces fuel costs and delivery times by analyzing traffic and weather patterns.</p>
                    </div>

                    <!-- Feature 3 -->
                    <div class="group relative rounded-2xl border border-slate-200 dark:border-slate-800 bg-white dark:bg-[#1e293b] p-8 hover:shadow-xl hover:shadow-primary/5 transition-all hover:-translate-y-1">
                        <div class="mb-5 flex h-12 w-12 items-center justify-center rounded-xl bg-blue-100 dark:bg-blue-900/30 text-primary">
                            <span class="material-symbols-outlined text-2xl">analytics</span>
                        </div>
                        <h3 class="text-xl font-bold text-slate-900 dark:text-white mb-3">Advanced Analytics</h3>
                         <p class="text-slate-600 dark:text-slate-400">Gain actionable insights into your supply chain performance with comprehensive reporting dashboards.</p>
                    </div>
                </div>
            </div>
        </div>

        <!-- CTA Section -->
        <div class="relative py-24 overflow-hidden">
             <div class="absolute inset-0 bg-primary/5 dark:bg-primary/5"></div>
            <div class="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8 relative z-10 text-center">
                <h2 class="text-3xl font-bold tracking-tight text-slate-900 dark:text-white sm:text-4xl mb-6">
                    Ready to modernize your logistics?
                </h2>
                <p class="mx-auto max-w-2xl text-lg text-slate-600 dark:text-slate-300 mb-10">
                    Join thousands of companies who trust LogisticsPro to move their business forward.
                </p>
                <div class="flex justify-center gap-4">
                     <a href="/login" class="rounded-lg bg-primary px-8 py-3 text-base font-bold text-white shadow-lg hover:bg-blue-600 transition-colors">
                        Get Started for Free
                    </a>
                </div>
            </div>
        </div>
    </main>

    <Footer />
</div>
