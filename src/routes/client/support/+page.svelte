<script>
  import '../../layout.css';
  import ClientSidebar from '$lib/components/ClientSidebar.svelte';

  const faqs = [
    { q: 'How do I track my load?', a: 'You can track your load in real-time from the "My Loads" page by clicking on the "Track Live" link.' },
    { q: 'What is the refund policy?', a: 'Cancellations made 2 hours before the scheduled time are eligible for a full refund.' },
    { q: 'How do I upgrade to Enterprise?', a: 'You can upgrade your plan in the Payments section of your dashboard.' }
  ];
</script>

<div class="bg-background-light dark:bg-background-dark text-slate-900 dark:text-white font-display antialiased flex h-screen overflow-hidden">
    <ClientSidebar activePage="support" />

    <main class="flex-1 flex flex-col overflow-hidden">
        <header class="h-16 border-b border-slate-200 dark:border-slate-800 flex items-center px-8 bg-white dark:bg-background-dark">
            <h2 class="text-xl font-bold">Help & Support</h2>
        </header>

        <div class="flex-1 overflow-y-auto p-8 max-w-4xl mx-auto w-full">
            <div class="grid grid-cols-1 md:grid-cols-2 gap-8 mb-12">
                <div class="p-8 rounded-2xl bg-primary text-white shadow-xl shadow-primary/20">
                    <span class="material-symbols-outlined text-4xl mb-4">headset_mic</span>
                    <h3 class="text-2xl font-black mb-2">24/7 Live Support</h3>
                    <p class="text-white/80 mb-6">Need immediate assistance? Our team is available round the clock.</p>
                    <button class="bg-white text-primary px-6 py-2 rounded-lg font-bold">Start Chat</button>
                </div>
                <div class="p-8 rounded-2xl bg-white dark:bg-[#192233] border border-slate-200 dark:border-slate-800 shadow-sm">
                    <span class="material-symbols-outlined text-4xl mb-4 text-primary">call</span>
                    <h3 class="text-2xl font-black mb-2">Call Center</h3>
                    <p class="text-slate-500 mb-6">Speak directly with a logistics expert for complex inquiries.</p>
                    <p class="text-xl font-bold">+1 (800) LOGI-PRO</p>
                </div>
            </div>

            <h3 class="text-2xl font-black mb-6">Frequently Asked Questions</h3>
            <div class="space-y-4">
                {#each faqs as faq}
                    <div class="p-6 rounded-xl border border-slate-200 dark:border-slate-800 bg-white dark:bg-[#192233]">
                        <h4 class="font-bold text-lg mb-2">{faq.q}</h4>
                        <p class="text-slate-500 leading-relaxed">{faq.a}</p>
                    </div>
                {/each}
            </div>
        </div>
    </main>
</div>
