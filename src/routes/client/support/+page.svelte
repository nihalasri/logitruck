<script>

  import ClientSidebar from '$lib/components/ClientSidebar.svelte';

  const faqs = [
    { q: 'How do I track my load?', a: 'You can track your load in real-time from the "My Loads" page by clicking on the "Track Live" link.' },
    { q: 'What is the refund policy?', a: 'Cancellations made 2 hours before the scheduled time are eligible for a full refund.' },
    { q: 'How do I upgrade to Enterprise?', a: 'You can upgrade your plan in the Payments section of your dashboard.' },
    { q: 'Are all drivers verified?', a: 'Yes, 100% of our partners undergo multi-layer background checks and KYC verification before joining the network.' }
  ];

  const packagingTips = [
    { title: 'Liquid Assets', body: 'Use secondary containment nodes for all Class 3 cargo.' },
    { title: 'Fragile Electronics', body: 'Anti-static shielding and shock-absorption matrices are mandatory.' },
    { title: 'Bulk Heavy', body: 'Ensure weight distribution is centered over the asset chassis.' }
  ];
</script>

<div class="bg-bg-main text-slate-900 font-display min-h-screen flex selection:bg-primary/10">
    <ClientSidebar activePage="support" />

    <main class="flex-1 flex flex-col h-screen overflow-hidden relative">
        <!-- Glassmorphism Header -->
        <header class="flex items-center justify-between glass border-b border-slate-200 px-8 py-5 h-20 shrink-0 z-20">
            <div>
                <h2 class="text-2xl font-black text-slate-900 tracking-tight leading-none">Global Concierge</h2>
                <p class="text-[10px] font-black text-slate-400 uppercase tracking-widest mt-1">24/7 Logistics Intelligence</p>
            </div>
        </header>

        <div class="flex-1 overflow-y-auto bg-[radial-gradient(40%_40%_at_50%_0%,rgba(29,78,216,0.03)_0%,transparent_100%)]">
            <div class="max-w-5xl mx-auto p-12">
                <div class="grid grid-cols-1 lg:grid-cols-2 gap-8 mb-16">
                    <!-- Standard Support Card -->
                    <div class="bg-slate-900 rounded-[2rem] p-10 text-white relative overflow-hidden group shadow-2xl">
                        <!-- Abstract decoration -->
                        <div class="absolute -right-12 -bottom-12 opacity-10 group-hover:scale-125 transition-transform duration-1000">
                            <span class="material-symbols-outlined text-[200px] font-black pointer-events-none">support_agent</span>
                        </div>
                        <div class="relative z-10">
                            <span class="inline-flex px-3 py-1.5 rounded-xl bg-white/10 border border-white/10 text-[10px] font-black uppercase tracking-[0.2em] mb-8">Priority Protocol</span>
                            <h3 class="text-4xl font-black mb-4 tracking-tighter">Neural Sync</h3>
                            <p class="text-slate-300 font-medium text-base mb-12 leading-relaxed max-w-[280px]">Connect instantly with a senior logistics coordinator for rapid resolution.</p>
                            <button class="bg-white text-slate-900 px-10 py-5 rounded-2xl font-black text-sm shadow-2xl micro-interaction">Initialize Comms</button>
                        </div>
                    </div>

                    <!-- Alternate Support Card -->
                    <div class="bg-white border border-slate-200 rounded-[2rem] p-10 text-slate-900 relative overflow-hidden group shadow-sm">
                         <div class="absolute -right-12 -bottom-12 opacity-5 group-hover:scale-125 transition-transform duration-1000">
                            <span class="material-symbols-outlined text-[200px] font-black text-primary pointer-events-none">hub</span>
                        </div>
                        <div class="relative z-10">
                            <span class="inline-flex px-3 py-1.5 rounded-xl bg-primary/5 border border-primary/10 text-[10px] font-black uppercase tracking-[0.2em] mb-8 text-primary">Voice Protocol</span>
                            <h3 class="text-4xl font-black mb-4 tracking-tighter">Command Line</h3>
                            <p class="text-slate-500 font-medium text-base mb-12 leading-relaxed max-w-[280px]">Direct encrypted line for multi-modal logistics complexity.</p>
                            <div class="flex items-center gap-6">
                                <span class="text-2xl font-black tracking-tighter text-slate-900">+1 (800) LOGI-PRO</span>
                                <div class="size-8 rounded-full bg-primary/10 text-primary flex items-center justify-center">
                                    <span class="material-symbols-outlined text-sm font-black">verified</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="grid grid-cols-1 lg:grid-cols-2 gap-12 mt-20">
                    <div class="space-y-12">
                        <div class="text-left">
                            <h3 class="text-4xl font-black text-slate-900 tracking-tight">Protocol Knowledge Base</h3>
                            <p class="text-slate-600 font-black uppercase tracking-[0.2em] text-[10px] mt-4">Autonomous resolution for standard operational queries.</p>
                        </div>

                        <div class="space-y-4">
                            {#each faqs as faq}
                                <div class="premium-card p-8 hover:border-primary/20 transition-all group">
                                    <div class="flex items-start gap-4 mb-4">
                                        <div class="size-8 rounded-lg bg-slate-50 text-slate-400 flex items-center justify-center shrink-0 group-hover:bg-primary/10 group-hover:text-primary transition-colors">
                                            <span class="material-symbols-outlined text-sm">quiz</span>
                                        </div>
                                        <h4 class="font-black text-slate-900 text-lg leading-tight">{faq.q}</h4>
                                    </div>
                                    <p class="text-slate-500 text-sm font-medium leading-relaxed pl-12">{faq.a}</p>
                                </div>
                            {/each}
                        </div>
                    </div>

                    <div class="space-y-12">
                        <div class="text-left">
                            <h3 class="text-4xl font-black text-slate-900 tracking-tight">Cargo Shield™ Guidance</h3>
                            <p class="text-slate-600 font-black uppercase tracking-[0.2em] text-[10px] mt-4">Secure packaging and loading protocols for fragile goods.</p>
                        </div>

                        <div class="grid grid-cols-1 gap-4">
                            {#each packagingTips as tip}
                                <div class="p-6 rounded-2xl border border-slate-100 bg-white group hover:shadow-xl transition-all">
                                    <div class="flex items-center gap-4 mb-2">
                                        <span class="material-symbols-outlined text-amber-500">inventory_2</span>
                                        <h4 class="font-black text-slate-900">{tip.title}</h4>
                                    </div>
                                    <p class="text-slate-500 text-xs font-medium leading-relaxed">{tip.body}</p>
                                </div>
                            {/each}
                            <div class="p-8 rounded-[2rem] bg-slate-50 border border-dashed border-slate-200 flex flex-col items-center text-center">
                                <span class="material-symbols-outlined text-3xl text-slate-300 mb-4">handyman</span>
                                <h4 class="font-black text-slate-900 mb-2">Need Professional Crating?</h4>
                                <p class="text-xs text-slate-500 font-medium mb-6">Our partners offer on-site professional packaging services.</p>
                                <button class="bg-primary text-white px-8 py-3 rounded-xl font-black text-xs micro-interaction">Book Add-on</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
</div>
