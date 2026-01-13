<script>
    import { page } from '$app/stores';
    
    let activePath = $derived($page.url.pathname);

    const menuItems = [
        { name: 'Dashboard', icon: 'dashboard', path: '/admin/dashboard' },
        { name: 'User Management', icon: 'group', path: '/admin/users' },
        { name: 'Shipments', icon: 'local_shipping', path: '/admin/shipments' },
        { name: 'Finance', icon: 'payments', path: '/admin/finance' },
        { name: 'Settings', icon: 'settings', path: '/admin/settings' }
    ];
</script>

<aside class="w-64 bg-slate-900 h-screen flex flex-col fixed left-0 top-0 z-50 text-slate-300 shadow-2xl">
    <!-- Brand -->
    <div class="h-20 flex items-center px-8 border-b border-slate-800">
        <div class="flex items-center gap-3">
            <div class="size-8 rounded-lg bg-indigo-500 flex items-center justify-center text-white">
                <span class="material-symbols-outlined text-[20px]">admin_panel_settings</span>
            </div>
            <div>
                <span class="block text-white font-black tracking-tight text-lg leading-none">Logitruck</span>
                <span class="text-[10px] font-bold text-indigo-400 uppercase tracking-widest">Admin</span>
            </div>
        </div>
    </div>

    <!-- Navigation -->
    <nav class="flex-1 px-4 py-8 space-y-2 overflow-y-auto custom-scrollbar">
        <div class="px-4 mb-2">
            <span class="text-[10px] font-black text-slate-500 uppercase tracking-widest">Main Menu</span>
        </div>
        
        {#each menuItems as item}
            <a href={item.path} 
               class="flex items-center gap-3 px-4 py-3 rounded-xl text-sm font-bold transition-all duration-200 group relative overflow-hidden
               {activePath.startsWith(item.path) ? 'bg-indigo-600 text-white shadow-lg shadow-indigo-900/50' : 'hover:bg-slate-800 hover:text-white'}">
                
                <span class="material-symbols-outlined text-[20px] {activePath.startsWith(item.path) ? 'text-white' : 'text-slate-500 group-hover:text-indigo-400'} transition-colors">
                    {item.icon}
                </span>
                <span class="relative z-10">{item.name}</span>
            </a>
        {/each}

        <div class="px-4 mb-2 mt-8">
            <span class="text-[10px] font-black text-slate-500 uppercase tracking-widest">System</span>
        </div>
        <a href="/" class="flex items-center gap-3 px-4 py-3 rounded-xl text-sm font-bold text-slate-400 hover:bg-slate-800 hover:text-white transition-all">
            <span class="material-symbols-outlined text-[20px]">logout</span>
            Exit Panel
        </a>
    </nav>
    
    <!-- Admin Profile -->
    <div class="p-4 border-t border-slate-800">
        <div class="flex items-center gap-3 px-4 py-3 rounded-xl bg-slate-800/50 hover:bg-slate-800 transition-colors cursor-pointer">
            <div class="size-10 rounded-full bg-indigo-500/20 text-indigo-400 flex items-center justify-center border-2 border-slate-700">
                <span class="material-symbols-outlined">person</span>
            </div>
            <div class="flex-1 min-w-0">
                <p class="text-sm font-black text-white truncate">Administrator</p>
                <p class="text-[10px] font-medium text-slate-500 truncate">Super User</p>
            </div>
        </div>
    </div>
</aside>
