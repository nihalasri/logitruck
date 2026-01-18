<script>
    import DriverSidebar from '$lib/components/DriverSidebar.svelte';
    import { sidebarState } from '$lib/stores/sidebar.svelte.js';
    import { onMount } from 'svelte';
    import { supabase } from '$lib/supabase';
    import { goto } from '$app/navigation';
    import { page } from '$app/state';

    let { children } = $props();

    function toggleSidebar() {
        sidebarState.toggle();
    }

    onMount(() => {
        const { data: authListener } = supabase.auth.onAuthStateChange((event, session) => {
            if (event === 'SIGNED_OUT') {
                goto('/login');
            }
        });

        return () => {
            authListener.subscription.unsubscribe();
        };
    });
</script>

<div class="bg-bg-main text-slate-900 font-display min-h-screen flex selection:bg-primary/10 relative">
    <DriverSidebar activePage={page.url.pathname.split('/').pop()} bind:mobileOpen={sidebarState.isOpen} />
    
    <!-- Mobile Menu Toggle (Floating) -->
    <!-- This ensures we always have a way to open the menu on mobile, even if the page header is missing it -->
    <button 
        onclick={toggleSidebar}
        class="lg:hidden fixed top-5 left-4 z-50 p-2 text-slate-600 hover:text-primary transition-all active:scale-95 {sidebarState.isOpen ? 'opacity-0 pointer-events-none' : 'opacity-100'}"
        aria-label="Toggle Menu"
    >
        <span class="material-symbols-outlined text-3xl">menu</span>
    </button>

    <!-- Main Content Area -->
    <!-- We wrap children ensuring they take full width/height of the remaining space -->
    <!-- Note: Individual pages should ideally just provide their content, but we add a wrapper to handle the flex layout correctly -->
    <!-- Since many pages might already have a wrapper, we'll just render children. 
         Ideally, pages should be refactored to remove their outer frame if it duplicates the sidebar. 
    -->
    
    {@render children()}
</div>
