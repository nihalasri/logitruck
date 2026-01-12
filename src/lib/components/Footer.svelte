<footer class="border-t border-slate-200 bg-white py-20 selection:bg-primary/10">
    <div class="mx-auto max-w-7xl px-6 lg:px-8">
        <div class="grid grid-cols-1 md:grid-cols-4 gap-12 mb-16">
            <div class="md:col-span-1">
                <a href="/" class="flex items-center gap-2.5 mb-6 group">
                    <div class="size-8 text-primary flex items-center justify-center bg-slate-50 rounded-lg border border-primary/5 transition-transform group-hover:scale-110">
                        <span class="material-symbols-outlined text-lg font-black">deployed_code</span>
                    </div>
                    <span class="text-xl font-black tracking-tight text-slate-900 font-display">LogiTruck</span>
                </a>
                <p class="text-sm text-slate-500 font-medium leading-relaxed">Simple and smart logistics for everyone.</p>
            </div>
            
            <div>
                <h4 class="text-xs font-black uppercase tracking-[0.2em] text-slate-400 mb-6">Platform</h4>
                <div class="flex flex-col gap-4 text-sm font-bold text-slate-600">
                    <a href="/client/dashboard" class="hover:text-primary transition-colors">Customer Page</a>
                    <a href="/driver/dashboard" class="hover:text-primary transition-colors">Driver Page</a>
                    <a href="/#features" class="hover:text-primary transition-colors">Features</a>
                </div>
            </div>

            <div>
                <h4 class="text-xs font-black uppercase tracking-[0.2em] text-slate-400 mb-6">Support</h4>
                <div class="flex flex-col gap-4 text-sm font-bold text-slate-600">
                    <a href="/client/support" class="hover:text-primary transition-colors">Help Center</a>
                    <a href="/contact" class="hover:text-primary transition-colors">Contact Us</a>
                    <a href="/legal" class="hover:text-primary transition-colors">Terms & Rules</a>
                </div>
            </div>

            <div>
                <h4 class="text-xs font-black uppercase tracking-[0.2em] text-slate-400 mb-6">Connect</h4>
                <div class="flex gap-4">
                    {#each ['public', 'hub', 'explore'] as icon}
                        <button class="size-10 rounded-xl bg-slate-50 border border-slate-100 flex items-center justify-center text-slate-400 hover:text-primary hover:bg-primary/5 hover:border-primary/20 transition-all micro-interaction">
                            <span class="material-symbols-outlined text-[20px]">{icon}</span>
                        </button>
                    {/each}
                </div>
            </div>
        </div>

        <div class="pt-8 border-t border-slate-100 flex flex-col md:flex-row justify-between items-center gap-6">
            <span class="text-xs font-black text-slate-400 uppercase tracking-widest">© 2026 LogiTruck. Ver 4.0.2</span>
            <div class="flex gap-8">
                <a href="/legal/privacy" class="text-xs font-black text-slate-400 uppercase tracking-widest hover:text-primary transition-colors">Privacy</a>
                <a href="/legal/security" class="text-xs font-black text-slate-400 uppercase tracking-widest hover:text-primary transition-colors">Security</a>
            </div>
        </div>
    </div>
</footer>
