<script>
  import '../../layout.css';
  import ClientSidebar from '$lib/components/ClientSidebar.svelte';

  let loads = [
    { id: 'L-8942', route: 'Chicago, IL → Dallas, TX', cargo: 'Electronics', status: 'In Transit', date: 'Oct 24, 2026' },
    { id: 'L-8941', route: 'New York, NY → Boston, MA', cargo: 'Furniture', status: 'Delivered', date: 'Oct 20, 2026' },
    { id: 'L-8940', route: 'Atlanta, GA → Miami, FL', cargo: 'Produce', status: 'Pending', date: 'Oct 26, 2026' }
  ];
</script>

<div class="bg-background-light dark:bg-background-dark text-slate-900 dark:text-white font-display antialiased flex h-screen overflow-hidden">
    <ClientSidebar activePage="my loads" />

    <!-- Main Content -->
    <main class="flex-1 flex flex-col overflow-hidden">
        <header class="h-16 border-b border-slate-200 dark:border-slate-800 flex items-center justify-between px-8 bg-white dark:bg-background-dark">
            <h2 class="text-xl font-bold">My Loads</h2>
            <a href="/client/post-load" class="flex items-center gap-2 bg-primary hover:bg-blue-600 text-white px-4 py-2 rounded-lg text-sm font-bold transition-all shadow-lg shadow-primary/25 active:scale-95">
                <span class="material-symbols-outlined text-[18px]">add_circle</span>
                Post New Load
            </a>
        </header>

        <div class="flex-1 overflow-y-auto p-8">
            <div class="bg-white dark:bg-[#192233] rounded-xl border border-slate-200 dark:border-slate-800 overflow-hidden">
                <table class="w-full text-left">
                    <thead class="bg-slate-50 dark:bg-slate-800/50 text-xs font-bold uppercase text-slate-500">
                        <tr>
                            <th class="px-6 py-4">Load ID</th>
                            <th class="px-6 py-4">Route</th>
                            <th class="px-6 py-4">Driver</th>
                            <th class="px-6 py-4">Status & Tracking</th>
                            <th class="px-6 py-4 text-right">Actions</th>
                        </tr>
                    </thead>
                    <tbody class="divide-y divide-slate-200 dark:divide-slate-800">
                        {#each loads as load}
                            <tr class="hover:bg-slate-50 dark:hover:bg-white/5 transition-colors group">
                                <td class="px-6 py-4">
                                    <div class="flex flex-col">
                                        <span class="font-mono font-bold text-primary">{load.id}</span>
                                        <span class="text-[10px] text-slate-500">{load.date}</span>
                                    </div>
                                </td>
                                <td class="px-6 py-4">
                                    <div class="flex flex-col">
                                        <span class="text-sm font-medium">{load.route}</span>
                                        <span class="text-xs text-slate-500">{load.cargo}</span>
                                    </div>
                                </td>
                                <td class="px-6 py-4">
                                    <div class="flex items-center gap-3">
                                        <div class="size-8 rounded-full bg-slate-200 dark:bg-slate-700 flex items-center justify-center">
                                            <span class="material-symbols-outlined text-sm">person</span>
                                        </div>
                                        <div class="flex flex-col">
                                            <span class="text-sm font-medium">Mike R.</span>
                                            <span class="text-[10px] text-slate-500">+1 (555) 0012</span>
                                        </div>
                                    </div>
                                </td>
                                <td class="px-6 py-4">
                                    <div class="flex flex-col gap-1">
                                        <span class="inline-flex items-center gap-1.5 px-2 py-1 rounded-full text-[10px] font-bold w-fit {load.status === 'Delivered' ? 'bg-emerald-100 text-emerald-700' : load.status === 'In Transit' ? 'bg-blue-100 text-blue-700 animate-pulse' : 'bg-slate-100 text-slate-700'}">
                                            <span class="size-1.5 rounded-full {load.status === 'Delivered' ? 'bg-emerald-500' : 'bg-blue-500'}"></span>
                                            {load.status}
                                        </span>
                                        {#if load.status === 'In Transit'}
                                            <a href="#" class="text-[10px] text-primary hover:underline flex items-center gap-1">
                                                <span class="material-symbols-outlined text-[12px]">location_on</span>
                                                Track Live
                                            </a>
                                        {/if}
                                    </div>
                                </td>
                                <td class="px-6 py-4 text-right">
                                    <button class="p-2 text-slate-400 hover:text-white transition-colors opacity-0 group-hover:opacity-100">
                                        <span class="material-symbols-outlined">more_vert</span>
                                    </button>
                                </td>
                            </tr>
                        {/each}
                    </tbody>
                </table>
            </div>
        </div>
    </main>
</div>
