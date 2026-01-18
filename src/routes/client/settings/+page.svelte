<script>
  import { goto } from '$app/navigation';

</script>

    <main class="flex-1 flex flex-col h-full overflow-hidden relative">
        <!-- Glassmorphism Header -->
        <header class="flex items-center justify-between glass border-b border-slate-200 px-8 py-5 h-20 shrink-0 z-20">
        <div class="pl-14 lg:pl-0 transition-all">
                <h2 class="text-2xl font-black text-slate-900 tracking-tight leading-none">Global Configurations</h2>
                <p class="text-[10px] font-black text-slate-400 uppercase tracking-widest mt-1">Infrastructure parameters</p>
            </div>
        </header>

        <div class="flex-1 overflow-y-auto bg-[radial-gradient(40%_40%_at_50%_0%,rgba(29,78,216,0.02)_0%,transparent_100%)]">
            <div class="max-w-3xl mx-auto p-12">
                <div class="space-y-12">
                    <!-- Profile Management -->
                    <section class="premium-card p-10">
                        <div class="flex items-center gap-4 mb-8">
                            <div class="size-10 rounded-xl bg-primary/10 text-primary flex items-center justify-center">
                                <span class="material-symbols-outlined text-[20px]">corporate_fare</span>
                            </div>
                            <h3 class="text-xl font-black text-slate-900">Entity Persona</h3>
                        </div>
                        
                        <div class="grid grid-cols-1 md:grid-cols-2 gap-8">
                            <label class="block">
                                <span class="block text-[10px] font-black uppercase tracking-widest text-slate-500 mb-2">Corporate Identity</span>
                                <input type="text" value="LogiTruck Global" class="w-full px-5 py-4 rounded-2xl bg-slate-50 border-none text-sm font-bold focus:bg-white focus:ring-2 focus:ring-primary/20 transition-all shadow-inner" />
                            </label>
                            <label class="block">
                                <span class="block text-[10px] font-black uppercase tracking-widest text-slate-500 mb-2">Primary Communications Node</span>
                                <input type="email" value="ops@logipro.global" class="w-full px-5 py-4 rounded-2xl bg-slate-50 border-none text-sm font-bold focus:bg-white focus:ring-2 focus:ring-primary/20 transition-all shadow-inner" />
                            </label>
                        </div>
                    </section>

                    <!-- Language & Accessibility -->
                    <section class="premium-card p-10">
                        <div class="flex items-center gap-4 mb-8">
                            <div class="size-10 rounded-xl bg-purple-50 text-purple-600 flex items-center justify-center">
                                <span class="material-symbols-outlined text-[20px]">translate</span>
                            </div>
                            <h3 class="text-xl font-black text-slate-900">Regional & Accessibility</h3>
                        </div>
                        
                        <div class="space-y-8">
                            <label class="block">
                                <span class="block text-[10px] font-black uppercase tracking-widest text-slate-500 mb-2">System Language</span>
                                <div class="grid grid-cols-3 gap-3">
                                    {#each ['English', 'Tamil (தமிழ்)', 'Hindi (हिन्दी)'] as lang}
                                        <button class="px-5 py-4 rounded-2xl border {lang === 'English' ? 'border-primary bg-primary text-white' : 'border-slate-100 bg-slate-50 text-slate-600'} text-xs font-black transition-all">
                                            {lang}
                                        </button>
                                    {/each}
                                </div>
                            </label>

                            <div class="flex items-center justify-between p-6 rounded-2xl bg-slate-50 border border-slate-100">
                                <div>
                                    <p class="text-sm font-bold text-slate-900">High Contrast Mode</p>
                                    <p class="text-xs text-slate-500 font-medium">Optimize visual nodes for screen readability.</p>
                                </div>
                                <div class="size-12 rounded-full bg-slate-200 p-1 flex items-center justify-start cursor-pointer">
                                    <div class="size-10 rounded-full bg-white shadow-sm"></div>
                                </div>
                            </div>
                        </div>
                    </section>

                    <!-- Saved Preferences & Personalization -->
                    <section class="premium-card p-10">
                        <div class="flex items-center gap-4 mb-8">
                            <div class="size-10 rounded-xl bg-emerald-50 text-emerald-600 flex items-center justify-center">
                                <span class="material-symbols-outlined text-[20px]">auto_awesome</span>
                            </div>
                            <h3 class="text-xl font-black text-slate-900">Operational Intelligence</h3>
                        </div>
                        
                        <div class="space-y-6">
                            <div class="flex items-center justify-between p-6 rounded-2xl border border-slate-100 bg-white">
                                <div class="flex items-center gap-4">
                                    <span class="material-symbols-outlined text-slate-400">bookmarks</span>
                                    <div>
                                        <p class="text-sm font-black text-slate-900">Saved Trajectory Fragments</p>
                                        <p class="text-[10px] font-bold text-slate-400 uppercase">Frequent addresses and hubs</p>
                                    </div>
                                </div>
                                <button class="text-primary text-[10px] font-black uppercase tracking-widest">Manage Nodes</button>
                            </div>

                            <div class="flex items-center justify-between p-6 rounded-2xl border border-slate-100 bg-white">
                                <div class="flex items-center gap-4">
                                    <span class="material-symbols-outlined text-slate-400">payments</span>
                                    <div>
                                        <p class="text-sm font-black text-slate-900">Vault Preferences</p>
                                        <p class="text-[10px] font-bold text-slate-400 uppercase">Preferred settlement modalities</p>
                                    </div>
                                </div>
                                <button onclick={() => goto('/client/payments')} class="text-primary text-[10px] font-black uppercase tracking-widest hover:underline">Configure</button>
                            </div>

                            <div class="p-6 rounded-2xl bg-primary/5 border border-primary/20">
                                <div class="flex items-start gap-4">
                                    <span class="material-symbols-outlined text-primary">lightbulb</span>
                                    <div>
                                        <p class="text-sm font-black text-slate-900">AI Personalization Node</p>
                                        <p class="text-xs text-slate-500 font-medium leading-relaxed mt-1">Our engine is currently suggesting vehicle types and optimized routes based on your past <span class="font-bold text-slate-900">14 shipments</span>.</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>

                    <!-- Security Protocols -->
                    <section class="premium-card p-10">
                        <div class="flex items-center gap-4 mb-8">
                            <div class="size-10 rounded-xl bg-amber-50 text-amber-600 flex items-center justify-center">
                                <span class="material-symbols-outlined text-[20px]">security</span>
                            </div>
                            <h3 class="text-xl font-black text-slate-900">Vault Security</h3>
                        </div>
                        <div class="flex items-center justify-between p-6 rounded-2xl bg-slate-50 border border-slate-100">
                            <div>
                                <p class="text-sm font-bold text-slate-900">Authentication Token</p>
                                <p class="text-xs text-slate-500 font-medium">Reset your secure access protocols.</p>
                            </div>
                            <button class="bg-slate-900 text-white px-6 py-2.5 rounded-xl font-black text-xs micro-interaction">Update Access</button>
                        </div>
                    </section>

                    <!-- Danger Zone -->
                    <section class="premium-card p-10 border-red-100 bg-red-50/20">
                        <div class="flex items-center gap-4 mb-6">
                            <div class="size-10 rounded-xl bg-red-100 text-red-600 flex items-center justify-center">
                                <span class="material-symbols-outlined text-[20px]">delete_forever</span>
                            </div>
                            <h3 class="text-xl font-black text-red-900">Entity Liquidation</h3>
                        </div>
                        <p class="text-sm text-red-800/80 font-bold mb-8 leading-relaxed">This action permanently purges all operational history and consignment data from the LogiTruck network. This cannot be reversed.</p>
                        <button class="bg-red-600 text-white px-8 py-4 rounded-2xl font-black text-sm shadow-xl shadow-red-200 micro-interaction">Purge Entity</button>
                    </section>
                </div>
            </div>
        </div>
    </main>

