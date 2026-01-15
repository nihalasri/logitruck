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
        { name: 'Dashboard', icon: 'dashboard', href: `${base}/client/dashboard` },
        { name: 'My Loads', icon: 'local_shipping', href: `${base}/client/loads` },
        { name: 'Bids', icon: 'gavel', href: `${base}/client/bids`, badge: '5' },
        { name: 'History', icon: 'history', href: `${base}/client/history` },
        { name: 'Payments', icon: 'payments', href: `${base}/client/payments` },
        { name: 'Support', icon: 'support_agent', href: `${base}/client/support` },
        { name: 'Profile', icon: 'person', href: `${base}/client/profile` },
    ];
</script>

<aside class="hidden lg:flex flex-col w-72 h-full border-r border-slate-200 bg-white shrink-0 shadow-[4px_0_24px_rgba(0,0,0,0.02)]">
    <div class="p-8">
        <div class="flex items-center gap-4 group cursor-pointer">
            <div class="relative">
                <div class="absolute -inset-1 bg-gradient-to-tr from-primary to-blue-400 rounded-full blur opacity-20 group-hover:opacity-40 transition duration-500"></div>
                <div class="relative bg-center bg-no-repeat bg-cover rounded-full h-12 w-12 border-2 border-white shadow-sm transition-transform duration-500 group-hover:scale-105" style='background-image: url("https://lh3.googleusercontent.com/aida-public/AB6AXuCIJ3dy42pCe7-4Pxe3nRz4Db986EU7HcnMdp2crVsXwmvDMsNzVLHGlhWRwXaMs-0UG5ePWWFSEnTmY2ZdrJwkGSzHWWnR4utv6hKFyiesq6l3hSWf0CMKPmpPDyGCvkGTJWGC8JcrUZZczR5xc_tzZvAkwYDYwA7T2ZgKl03EHpNaTjYHh71hMUlo_ViFdKxVs5agTIDp42P0cSwuG-xpAFVkniZ1LjORRuJoyJ8nvuyTbBBkZxgbnp5ge38wt9N8cQNkNUcrHIs");'></div>
            </div>
            <div class="flex flex-col overflow-hidden">
                <h1 class="text-slate-900 text-lg font-black leading-tight tracking-tight font-display">Logistics Inc.</h1>
                <div class="flex items-center gap-1.5">
                    <span class="size-1.5 rounded-full bg-emerald-500"></span>
                    <p class="text-slate-500 text-xs font-semibold uppercase tracking-wider">Customer</p>
                </div>
            </div>
        </div>
    </div>

    <nav class="flex-1 px-4 py-4 space-y-1.5 overflow-y-auto">
        {#each navItems as item}
            <a 
                href={item.href}
                class="group flex items-center gap-3.5 px-4 py-3 rounded-xl transition-all duration-300 micro-interaction {activePage === item.name.toLowerCase() ? 'bg-slate-900 text-white shadow-xl shadow-slate-200' : 'text-slate-700 hover:bg-slate-50 hover:text-primary'}"
            >
                <span class="material-symbols-outlined text-[24px] transition-transform group-hover:scale-110">{item.icon}</span>
                <span class="text-sm {activePage === item.name.toLowerCase() ? 'font-black' : 'font-bold'}">{item.name}</span>
                {#if item.badge}
                    <span class="ml-auto flex items-center justify-center min-w-[20px] h-5 bg-primary text-white text-[10px] font-black px-1.5 rounded-full {activePage === item.name.toLowerCase() ? 'bg-white text-primary' : 'shadow-sm shadow-primary/20'}">
                        {item.badge}
                    </span>
                {/if}
            </a>
        {/each}
    </nav>

    <div class="p-6 border-t border-slate-100 bg-slate-50/50 space-y-1.5">
        <a 
            href="{base}/client/settings"
            class="group flex items-center gap-3.5 px-4 py-3 rounded-xl transition-all duration-300 micro-interaction {activePage === 'settings' ? 'bg-slate-900 text-white shadow-xl shadow-slate-200' : 'text-slate-700 hover:bg-white hover:text-primary hover:shadow-sm'}"
        >
            <span class="material-symbols-outlined text-[24px] transition-transform group-hover:rotate-45">settings</span>
            <span class="text-sm {activePage === 'settings' ? 'font-black' : 'font-bold'}">Settings</span>
        </a>
        <button 
            onclick={handleLogout}
            class="group flex items-center w-full gap-3.5 px-4 py-3 rounded-xl text-slate-500 hover:bg-red-50 hover:text-red-600 transition-all duration-300 micro-interaction"
        >
            <span class="material-symbols-outlined text-[24px] transition-transform group-hover:translate-x-1">logout</span>
            <span class="text-sm font-black">Log Out</span>
        </button>
    </div>
</aside>
