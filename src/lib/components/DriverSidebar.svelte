<script>
    import { page } from '$app/state';
    import { goto } from '$app/navigation';
    import { base } from '$app/paths';

    let { activePage = '' } = $props();

    function handleLogout() {
        goto(`${base}/login`);
    }

    const navItems = [
        { name: 'Home', icon: 'home', href: `${base}/` },
        { name: 'Dashboard', icon: 'dashboard', href: `${base}/driver/dashboard` },
        { name: 'Available Loads', icon: 'local_shipping', href: `${base}/driver/loads` },
        { name: 'My Bids', icon: 'gavel', href: `${base}/driver/bids` },
        { name: 'History', icon: 'history', href: `${base}/driver/history` },
        { name: 'Earnings', icon: 'payments', href: `${base}/driver/earnings` },
    ];
</script>

<aside class="hidden lg:flex flex-col w-72 h-full border-r border-slate-200 bg-white shrink-0 shadow-[4px_0_24px_rgba(0,0,0,0.02)]">
    <div class="p-8">
        <a href="/" class="flex items-center gap-4 group cursor-pointer decoration-none">
            <div class="relative">
                <div class="absolute -inset-1 bg-gradient-to-tr from-primary to-emerald-400 rounded-xl blur opacity-20 group-hover:opacity-40 transition duration-500"></div>
                <div class="relative h-12 w-12 bg-white rounded-xl shadow-sm border border-slate-100 flex items-center justify-center text-primary transition-transform duration-500 group-hover:scale-105">
                    <span class="material-symbols-outlined text-3xl font-black">deployed_code</span>
                </div>
            </div>
            <div class="flex flex-col overflow-hidden">
                <h1 class="text-slate-900 text-lg font-black leading-tight tracking-tight font-display">LogiPro</h1>
                <div class="flex items-center gap-1.5">
                    <span class="size-1.5 rounded-full bg-blue-500"></span>
                    <p class="text-slate-500 text-xs font-semibold uppercase tracking-wider">Driver Terminal</p>
                </div>
            </div>
        </a>
    </div>

    <nav class="flex-1 px-4 py-4 space-y-1.5 overflow-y-auto">
        {#each navItems as item}
            <a 
                href={item.href}
                class="group flex items-center gap-3.5 px-4 py-3 rounded-xl transition-all duration-300 micro-interaction {activePage === item.name.toLowerCase() ? 'bg-slate-900 text-white shadow-xl shadow-slate-200' : 'text-slate-700 hover:bg-slate-50 hover:text-primary'}"
            >
                <div class="relative flex items-center justify-center">
                    <span class="material-symbols-outlined text-[24px] transition-transform group-hover:scale-110">{item.icon}</span>
                </div>
                <span class="text-sm {activePage === item.name.toLowerCase() ? 'font-black' : 'font-bold'}">{item.name}</span>
                {#if item.name === 'Available Loads'}
                    <span class="ml-auto flex items-center justify-center min-w-[20px] h-5 bg-primary text-white text-[10px] font-black px-1.5 rounded-full shadow-sm shadow-primary/20">
                        12
                    </span>
                {/if}
            </a>
        {/each}
    </nav>

    <div class="p-6 border-t border-slate-100 bg-slate-50/50 space-y-6">
        <div class="flex items-center gap-3 px-2">
            <div class="size-10 rounded-xl bg-cover bg-center border-2 border-white shadow-sm" style="background-image: url('https://images.unsplash.com/photo-1542385151-efd9000785a0?q=80&w=200&auto=format&fit=crop');"></div>
            <div class="flex flex-col min-w-0">
                <p class="text-slate-900 text-sm font-black truncate">John Driver</p>
                <p class="text-emerald-600 text-[10px] font-black uppercase tracking-widest flex items-center gap-1">
                    <span class="size-1.5 rounded-full bg-emerald-500 animate-pulse"></span> Network Active
                </p>
            </div>
        </div>
        
        <div class="space-y-1">
            <a 
                href="/driver/support"
                class="group flex items-center gap-3.5 px-4 py-3 rounded-xl transition-all duration-300 micro-interaction {activePage === 'support' ? 'bg-slate-900 text-white shadow-xl' : 'text-slate-600 hover:bg-white hover:text-primary'}"
            >
                <span class="material-symbols-outlined text-[24px] transition-transform group-hover:scale-110">support_agent</span>
                <span class="text-sm font-black">Support</span>
            </a>
            <a 
                href="/driver/settings"
                class="group flex items-center gap-3.5 px-4 py-3 rounded-xl transition-all duration-300 micro-interaction {activePage === 'settings' ? 'bg-slate-900 text-white shadow-xl' : 'text-slate-600 hover:bg-white hover:text-primary'}"
            >
                <span class="material-symbols-outlined text-[24px] transition-transform group-hover:rotate-45">settings</span>
                <span class="text-sm font-black">Settings</span>
            </a>
            <button 
                onclick={handleLogout}
                class="group flex items-center w-full gap-3.5 px-4 py-3 rounded-xl text-slate-500 hover:bg-red-50 hover:text-red-600 transition-all duration-300 micro-interaction"
            >
                <span class="material-symbols-outlined text-[24px] transition-transform group-hover:translate-x-1">logout</span>
                <span class="text-sm font-black">Sign Out</span>
            </button>
        </div>
    </div>
</aside>
