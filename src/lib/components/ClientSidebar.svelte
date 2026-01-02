<script>
    import { page } from '$app/state';
    import { goto } from '$app/navigation';

    let { activePage = '' } = $props();

    function handleLogout() {
        goto('/login');
    }

    const navItems = [
        { name: 'Home', icon: 'home', href: '/' },
        { name: 'Dashboard', icon: 'dashboard', href: '/client/dashboard' },
        { name: 'My Loads', icon: 'local_shipping', href: '/client/loads' },
        { name: 'Bids', icon: 'gavel', href: '/client/bids', badge: '5' },
        { name: 'History', icon: 'history', href: '/client/history' },
        { name: 'Payments', icon: 'payments', href: '/client/payments' },
        { name: 'Support', icon: 'support_agent', href: '/client/support' },
    ];
</script>

<aside class="hidden lg:flex flex-col w-64 h-full border-r border-slate-200 dark:border-surface-dark-light bg-white dark:bg-background-dark shrink-0">
    <div class="p-6">
        <div class="flex items-center gap-3">
            <div class="bg-center bg-no-repeat bg-cover rounded-full h-10 w-10 shrink-0 border-2 border-primary/20" style='background-image: url("https://lh3.googleusercontent.com/aida-public/AB6AXuCIJ3dy42pCe7-4Pxe3nRz4Db986EU7HcnMdp2crVsXwmvDMsNzVLHGlhWRwXaMs-0UG5ePWWFSEnTmY2ZdrJwkGSzHWWnR4utv6hKFyiesq6l3hSWf0CMKPmpPDyGCvkGTJWGC8JcrUZZczR5xc_tzZvAkwYDYwA7T2ZgKl03EHpNaTjYHh71hMUlo_ViFdKxVs5agTIDp42P0cSwuG-xpAFVkniZ1LjORRuJoyJ8nvuyTbBBkZxgbnp5ge38wt9N8cQNkNUcrHIs");'></div>
            <div class="flex flex-col overflow-hidden">
                <h1 class="text-slate-900 dark:text-white text-base font-bold leading-tight truncate">Logistics Inc.</h1>
                <p class="text-slate-500 dark:text-slate-400 text-xs font-medium truncate">Client Account</p>
            </div>
        </div>
    </div>

    <nav class="flex-1 px-4 py-2 space-y-1 overflow-y-auto">
        {#each navItems as item}
            <a 
                href={item.href}
                class="flex items-center gap-3 px-3 py-2.5 rounded-lg transition-colors {activePage === item.name.toLowerCase() ? 'bg-primary text-white shadow-lg shadow-primary/25' : 'text-slate-600 dark:text-slate-400 hover:bg-slate-100 dark:hover:bg-surface-dark-light hover:text-slate-900 dark:hover:text-white'}"
            >
                <span class="material-symbols-outlined text-[24px]">{item.icon}</span>
                <span class="text-sm {activePage === item.name.toLowerCase() ? 'font-semibold' : 'font-medium'}">{item.name}</span>
                {#if item.badge}
                    <span class="ml-auto bg-primary text-white text-[10px] font-bold px-1.5 py-0.5 rounded-full {activePage === item.name.toLowerCase() ? 'bg-white text-primary' : ''}">
                        {item.badge}
                    </span>
                {/if}
            </a>
        {/each}
    </nav>

    <div class="p-4 border-t border-slate-200 dark:border-surface-dark-light space-y-1">
        <a 
            href="/client/settings"
            class="flex items-center gap-3 px-3 py-2.5 rounded-lg transition-colors {activePage === 'settings' ? 'bg-primary text-white shadow-lg shadow-primary/25' : 'text-slate-600 dark:text-slate-400 hover:bg-slate-100 dark:hover:bg-surface-dark-light hover:text-slate-900 dark:hover:text-white'}"
        >
            <span class="material-symbols-outlined text-[24px]">settings</span>
            <span class="text-sm {activePage === 'settings' ? 'font-semibold' : 'font-medium'}">Settings</span>
        </a>
        <button 
            onclick={handleLogout}
            class="flex items-center w-full gap-3 px-3 py-2.5 rounded-lg text-red-500 hover:bg-red-50 dark:hover:bg-red-900/10 transition-colors"
        >
            <span class="material-symbols-outlined text-[24px]">logout</span>
            <span class="text-sm font-semibold">Logout</span>
        </button>
    </div>
</aside>
