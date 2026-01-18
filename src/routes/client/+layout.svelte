<script>
    import ClientSidebar from '$lib/components/ClientSidebar.svelte';
    import { page } from '$app/state';
    import { sidebarState } from '$lib/stores/sidebar.svelte.js';
    import { base } from '$app/paths';

    let { children } = $props();

    let activePage = $derived.by(() => {
        const path = page.url.pathname;
        if (path.includes('/dashboard')) return 'dashboard';
        if (path.includes('/notifications')) return 'notifications';
        if (path.includes('/loads') || path.includes('/post-load') || path.includes('/tracking')) return 'my loads';
        if (path.includes('/bids')) return 'bids';
        if (path.includes('/history')) return 'history';
        if (path.includes('/payments')) return 'payments';
        if (path.includes('/support')) return 'support';
        if (path.includes('/profile')) return 'profile';
        if (path.includes('/settings')) return 'settings';
        return '';
    });
</script>

<div class="bg-bg-main text-slate-900 font-display min-h-screen flex selection:bg-primary/10 relative">
    <ClientSidebar activePage={activePage} bind:mobileOpen={sidebarState.isOpen} />
    
    <!-- Mobile Menu Toggle (Floating Fallback) -->
    <!-- This ensures every page has a menu button on mobile, even if the page header forgot it -->
    <div class="lg:hidden fixed top-5 left-4 z-50 transition-opacity duration-300 {sidebarState.isOpen ? 'opacity-0 pointer-events-none' : 'opacity-100'}">
        <button 
            onclick={() => sidebarState.isOpen = true} 
            class="p-2 text-slate-600 hover:text-primary transition-all active:scale-95"
            aria-label="Open Menu"
        >
            <span class="material-symbols-outlined text-3xl">menu</span>
        </button>
    </div>

    <!-- Main Content Area -->
    <!-- We remove the flex-1 etc from here because the pages usually define their own main with flex-1. 
         Wait, checking dashboard: it has <main class="flex-1 ...">.
         So we just render children?
         Properties of dashboard main: flex-1 flex flex-col h-screen overflow-hidden relative
         If we nest mains, it might break layout.
         
         Ideally:
         Layout:
           div (flex wrapper)
             Sidebar
             children
         
         Page:
           main (flex-1 ...)
             Header
             Content
         
         So the Layout should mostly just be the flex wrapper + Sidebar.
    -->
    {@render children()}

</div>
