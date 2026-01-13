<script>
    import ClientSidebar from '$lib/components/ClientSidebar.svelte';
    import { fade, fly, slide } from 'svelte/transition';
    import { goto } from '$app/navigation';

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

    let showChat = false;
    let selectedTopic = 'general';
    let newMessage = '';
    let chatMessages = [
        { sender: 'agent', text: 'Welcome to Neural Sync. I am your dedicated logistics coordinator. How can I assist your operations today?' }
    ];
    let isTyping = false;

    function handleChatOpen() {
        showChat = true;
    }

    function handleChatClose() {
        showChat = false;
    }

    function sendMessage() {
        if (!newMessage.trim()) return;
        
        // Add user message
        chatMessages = [...chatMessages, { sender: 'user', text: newMessage }];
        const userMsg = newMessage;
        newMessage = '';
        isTyping = true;

        // Simulate agent response
        setTimeout(() => {
            let response = "I've logged that request. Is there anything else I can help you with?";
            
            if (selectedTopic === 'billing') {
                response = "I see your query regarding billing. I've pulled up your latest ledger. A financial specialist will review your balance node immediately.";
            } else if (userMsg.toLowerCase().includes('track') || userMsg.toLowerCase().includes('load')) {
                response = "I can help with tracking. Please provide the Load ID (e.g., #LD-xxxx) you are inquiring about.";
            }
            
            chatMessages = [...chatMessages, { sender: 'agent', text: response }];
            isTyping = false;
        }, 1500);
    }

    function handleKeydown(e) {
        if (e.key === 'Enter') sendMessage();
    }
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
            <div class="flex items-center gap-2">
                <span class="relative flex h-3 w-3">
                  <span class="animate-ping absolute inline-flex h-full w-full rounded-full bg-emerald-400 opacity-75"></span>
                  <span class="relative inline-flex rounded-full h-3 w-3 bg-emerald-500"></span>
                </span>
                <span class="text-[10px] font-black uppercase tracking-widest text-slate-500">Systems Nominal</span>
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
                            <button on:click={handleChatOpen} class="bg-white text-slate-900 px-10 py-5 rounded-2xl font-black text-sm shadow-2xl micro-interaction hover:scale-105 transition-transform">Initialize Comms</button>
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
                                <div class="premium-card p-8 hover:border-primary/20 transition-all group cursor-pointer">
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

    <!-- Chat Modal -->
    {#if showChat}
        <div class="fixed inset-0 z-50 flex items-end sm:items-center justify-center sm:p-4" transition:fade>
            <div class="absolute inset-0 bg-slate-900/40 backdrop-blur-sm" on:click={handleChatClose}></div>
            <div class="bg-white w-full sm:max-w-lg h-[80vh] sm:h-[650px] sm:rounded-3xl shadow-2xl relative z-10 flex flex-col overflow-hidden" transition:fly={{ y: 50 }}>
                <!-- Header -->
                <div class="bg-slate-900 p-6 flex flex-col justify-between shrink-0">
                    <div class="flex items-start justify-between">
                         <div class="flex items-center gap-4">
                            <div class="size-12 rounded-xl bg-white/10 flex items-center justify-center border border-white/10">
                                <span class="material-symbols-outlined text-white">smart_toy</span>
                            </div>
                            <div>
                                <h3 class="text-xl font-black text-white tracking-tight">Support Node</h3>
                                <div class="flex items-center gap-2 mt-1">
                                    <span class="size-1.5 rounded-full bg-emerald-400 animate-pulse"></span>
                                    <p class="text-[10px] font-bold text-slate-400 uppercase tracking-widest">Live Sync Active</p>
                                </div>
                            </div>
                        </div>
                        <button on:click={handleChatClose} class="text-slate-400 hover:text-white transition-colors">
                            <span class="material-symbols-outlined">close</span>
                        </button>
                    </div>
                </div>
                
                <!-- Topic Selector -->
                 <div class="px-6 py-4 border-b border-slate-100 bg-slate-50 flex gap-2 overflow-x-auto no-scrollbar">
                    {#each ['General', 'Billing', 'Tracking', 'Tech'] as topic}
                        <button 
                            on:click={() => selectedTopic = topic.toLowerCase()}
                            class="px-4 py-2 rounded-lg text-[10px] font-black uppercase tracking-widest transition-all whitespace-nowrap border {selectedTopic === topic.toLowerCase() ? 'bg-primary text-white border-primary' : 'bg-white text-slate-500 border-slate-200 hover:border-primary/30'}"
                        >
                            {topic}
                        </button>
                    {/each}
                 </div>

                <!-- Messages -->
                <div class="flex-1 overflow-y-auto p-6 space-y-4 bg-slate-50/50">
                    {#each chatMessages as msg}
                        <div class="flex {msg.sender === 'user' ? 'justify-end' : 'justify-start'}">
                             <div class="max-w-[80%] p-4 rounded-2xl text-sm font-medium leading-relaxed {msg.sender === 'user' ? 'bg-primary text-white rounded-br-sm' : 'bg-white border border-slate-100 text-slate-600 rounded-bl-sm shadow-sm'}" in:slide>
                                {msg.text}
                            </div>
                        </div>
                    {/each}
                    {#if isTyping}
                        <div class="flex justify-start" in:fade>
                            <div class="bg-white border border-slate-100 px-4 py-3 rounded-2xl rounded-bl-sm shadow-sm flex gap-1 items-center">
                                <span class="size-1.5 bg-slate-400 rounded-full animate-bounce"></span>
                                <span class="size-1.5 bg-slate-400 rounded-full animate-bounce delay-100"></span>
                                <span class="size-1.5 bg-slate-400 rounded-full animate-bounce delay-200"></span>
                            </div>
                        </div>
                    {/if}
                </div>

                <!-- Input -->
                <div class="p-4 bg-white border-t border-slate-100">
                    <div class="relative">
                        <input 
                            type="text" 
                            bind:value={newMessage}
                            on:keydown={handleKeydown}
                            placeholder="Type your message to Neural Sync..." 
                            class="w-full bg-slate-100 border-none rounded-2xl pl-4 pr-14 py-4 text-sm font-medium focus:ring-2 focus:ring-primary/20 focus:bg-white transition-all"
                        />
                        <button 
                            on:click={sendMessage}
                            class="absolute right-2 top-2 bottom-2 aspect-square bg-slate-900 text-white rounded-xl flex items-center justify-center hover:bg-primary transition-colors shadow-lg shadow-slate-200"
                        >
                            <span class="material-symbols-outlined text-[20px]">send</span>
                        </button>
                    </div>
                </div>
            </div>
        </div>
    {/if}
</div>
