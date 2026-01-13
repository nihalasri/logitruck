<script>
    import { onMount } from 'svelte';
    import { loadsStore } from '$lib/stores/loads.js';

    let stats = $state({
        totalUsers: 1240,
        activeShipments: 45,
        revenue: '$124,500',
        systemHealth: '98%'
    });

    // Example of deriving stats from real store data
    let activeLoadsCount = $derived($loadsStore.filter(l => l.status === 'In Transit').length);
</script>

<div class="p-8 max-w-[1600px] mx-auto space-y-8">
    
    <!-- Header -->
    <header class="flex items-center justify-between">
        <div>
            <h1 class="text-3xl font-black text-slate-900 tracking-tight">Admin Dashboard</h1>
            <p class="text-slate-500 font-medium">System Overview & Monitoring</p>
        </div>
        <div class="flex gap-4">
            <button class="flex items-center gap-2 px-4 py-2 bg-white border border-slate-200 rounded-lg text-sm font-bold text-slate-600 hover:bg-slate-50 shadow-sm">
                <span class="material-symbols-outlined text-[18px]">download</span>
                Export Report
            </button>
            <button class="flex items-center gap-2 px-4 py-2 bg-indigo-600 text-white rounded-lg text-sm font-bold hover:bg-indigo-700 shadow-lg shadow-indigo-200">
                <span class="material-symbols-outlined text-[18px]">refresh</span>
                Refresh Data
            </button>
        </div>
    </header>

    <!-- Stats Grid -->
    <div class="grid grid-cols-1 md:grid-cols-4 gap-6">
        <div class="bg-white p-6 rounded-2xl border border-slate-100 shadow-sm hover:shadow-md transition-shadow">
            <div class="flex items-center justify-between mb-4">
                <div class="size-12 rounded-xl bg-blue-50 text-blue-600 flex items-center justify-center">
                    <span class="material-symbols-outlined">group</span>
                </div>
                <span class="text-xs font-black text-emerald-500 bg-emerald-50 px-2 py-1 rounded-md">+12%</span>
            </div>
            <h3 class="text-3xl font-black text-slate-900">{stats.totalUsers}</h3>
            <p class="text-xs font-bold text-slate-400 uppercase tracking-widest mt-1">Total Users</p>
        </div>

        <div class="bg-white p-6 rounded-2xl border border-slate-100 shadow-sm hover:shadow-md transition-shadow">
            <div class="flex items-center justify-between mb-4">
                <div class="size-12 rounded-xl bg-indigo-50 text-indigo-600 flex items-center justify-center">
                    <span class="material-symbols-outlined">local_shipping</span>
                </div>
                <span class="text-xs font-black text-emerald-500 bg-emerald-50 px-2 py-1 rounded-md">+5%</span>
            </div>
            <h3 class="text-3xl font-black text-slate-900">{activeLoadsCount || stats.activeShipments}</h3>
            <p class="text-xs font-bold text-slate-400 uppercase tracking-widest mt-1">Active Shipments</p>
        </div>

        <div class="bg-white p-6 rounded-2xl border border-slate-100 shadow-sm hover:shadow-md transition-shadow">
            <div class="flex items-center justify-between mb-4">
                <div class="size-12 rounded-xl bg-emerald-50 text-emerald-600 flex items-center justify-center">
                    <span class="material-symbols-outlined">payments</span>
                </div>
                <span class="text-xs font-black text-emerald-500 bg-emerald-50 px-2 py-1 rounded-md">+8.2%</span>
            </div>
            <h3 class="text-3xl font-black text-slate-900">{stats.revenue}</h3>
            <p class="text-xs font-bold text-slate-400 uppercase tracking-widest mt-1">Total Revenue</p>
        </div>

        <div class="bg-white p-6 rounded-2xl border border-slate-100 shadow-sm hover:shadow-md transition-shadow">
            <div class="flex items-center justify-between mb-4">
                <div class="size-12 rounded-xl bg-rose-50 text-rose-600 flex items-center justify-center">
                    <span class="material-symbols-outlined">dns</span>
                </div>
                <span class="text-xs font-black text-emerald-500 bg-emerald-50 px-2 py-1 rounded-md">Stable</span>
            </div>
            <h3 class="text-3xl font-black text-slate-900">{stats.systemHealth}</h3>
            <p class="text-xs font-bold text-slate-400 uppercase tracking-widest mt-1">System Health</p>
        </div>
    </div>

    <!-- Recent Activity -->
    <section class="bg-white rounded-2xl border border-slate-100 shadow-sm overflow-hidden">
        <div class="p-6 border-b border-slate-100 flex items-center justify-between">
            <h2 class="text-lg font-black text-slate-900">Recent Loads</h2>
            <a href="/admin/shipments" class="text-sm font-bold text-indigo-600 hover:underline">View All</a>
        </div>
        <div class="overflow-x-auto">
            <table class="w-full text-left">
                <thead class="bg-slate-50">
                    <tr>
                        <th class="px-6 py-4 text-[10px] font-black uppercase tracking-widest text-slate-500">ID</th>
                        <th class="px-6 py-4 text-[10px] font-black uppercase tracking-widest text-slate-500">Route</th>
                        <th class="px-6 py-4 text-[10px] font-black uppercase tracking-widest text-slate-500">Cargo</th>
                        <th class="px-6 py-4 text-[10px] font-black uppercase tracking-widest text-slate-500">Date</th>
                        <th class="px-6 py-4 text-[10px] font-black uppercase tracking-widest text-slate-500">Status</th>
                    </tr>
                </thead>
                <tbody class="divide-y divide-slate-100">
                    {#each $loadsStore.slice(0, 5) as load}
                    <tr class="hover:bg-slate-50/50 transition-colors">
                        <td class="px-6 py-4 font-mono text-xs font-bold text-slate-600">{load.id}</td>
                        <td class="px-6 py-4 text-sm font-bold text-slate-900">{load.route}</td>
                        <td class="px-6 py-4 text-sm text-slate-600">{load.cargo}</td>
                        <td class="px-6 py-4 text-xs font-medium text-slate-500">{load.date}</td>
                        <td class="px-6 py-4">
                            <span class="inline-flex items-center gap-1.5 px-2.5 py-1 rounded-full text-[10px] font-black uppercase tracking-wider
                                {load.status === 'In Transit' ? 'bg-indigo-50 text-indigo-600' : 
                                 load.status === 'Delivered' ? 'bg-emerald-50 text-emerald-600' : 'bg-slate-100 text-slate-500'}">
                                {load.status}
                            </span>
                        </td>
                    </tr>
                    {/each}
                </tbody>
            </table>
        </div>
    </section>

</div>
