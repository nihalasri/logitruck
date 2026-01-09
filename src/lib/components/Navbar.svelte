<script>
    import { page } from '$app/state';
    import { base } from '$app/paths';
    let isOpen = $state(false);

    function toggleMenu() {
        isOpen = !isOpen;
    }

    const links = [
        { href: `${base}/`, label: 'Home' },
        { href: `${base}/#features`, label: 'Features' },
        { href: `${base}/services`, label: 'Services' },
        { href: `${base}/contact`, label: 'Contact' }
    ];
</script>

<nav class="fixed top-0 z-[100] w-full glass border-b border-slate-200/50 selection:bg-primary/10">
    <div class="mx-auto max-w-7xl px-6 lg:px-8">
        <div class="flex h-20 items-center justify-between">
            <!-- Logo -->
            <a href="{base}/" class="flex items-center gap-2.5 group">
                <div class="relative">
                    <div class="absolute -inset-1 bg-primary rounded-lg blur opacity-10 group-hover:opacity-20 transition duration-500"></div>
                    <div class="relative size-10 text-primary flex items-center justify-center bg-white rounded-xl shadow-sm border border-primary/10 transition-transform group-hover:scale-110">
                        <span class="material-symbols-outlined font-black">deployed_code</span>
                    </div>
                </div>
                <span class="text-2xl font-black tracking-tight text-slate-900 font-display group-hover:text-primary transition-colors">LogiPro</span>
            </a>

            <!-- Desktop Menu -->
            <div class="hidden md:flex items-center gap-1">
                {#each links as link}
                    <a href={link.href} 
                       class="px-5 py-2 rounded-xl text-sm font-bold tracking-tight transition-all duration-300 micro-interaction {page.url.pathname === link.href ? 'text-primary bg-primary/5' : 'text-slate-500 hover:text-primary hover:bg-slate-50'}">
                        {link.label}
                    </a>
                {/each}
            </div>

            <!-- Auth Buttons -->
            <div class="hidden md:flex items-center gap-4">
                <a href="{base}/login" class="text-slate-600 px-5 py-2.5 rounded-xl text-sm font-black hover:text-primary transition-colors micro-interaction">Log In</a>
                <a href="{base}/signup" class="bg-slate-900 text-white px-7 py-2.5 rounded-xl text-sm font-black shadow-xl shadow-slate-200 transition-all hover:scale-105 active:scale-95">Get Started</a>
            </div>

            <!-- Mobile menu button -->
            <div class="md:hidden flex items-center">
                <button onclick={toggleMenu} type="button" class="text-slate-600 hover:text-primary focus:outline-none p-2 transition-colors">
                    <span class="material-symbols-outlined text-3xl font-bold">{isOpen ? 'close' : 'menu'}</span>
                </button>
            </div>
        </div>
    </div>

    <!-- Mobile Menu -->
    {#if isOpen}
        <div class="md:hidden glass border-t border-slate-200 animate-fade-in">
            <div class="space-y-1.5 px-6 pb-8 pt-4">
                {#each links as link}
                    <a href={link.href} 
                       class="block px-4 py-3 rounded-2xl text-lg font-black transition-all {page.url.pathname === link.href ? 'text-primary bg-primary/5' : 'text-slate-600 hover:bg-slate-50'}">
                        {link.label}
                    </a>
                {/each}
                <div class="pt-4 flex flex-col gap-3">
                    <a href="{base}/login" class="w-full text-center py-4 rounded-2xl bg-slate-50 text-slate-900 font-black text-lg">Log In</a>
                    <a href="{base}/signup" class="w-full text-center py-4 rounded-2xl bg-primary text-white font-black text-lg shadow-xl shadow-primary/20">Get Started</a>
                </div>
            </div>
        </div>
    {/if}
</nav>
