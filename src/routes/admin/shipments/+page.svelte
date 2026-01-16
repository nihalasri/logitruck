<script>
    import { loadsStore } from '$lib/stores/loads.js';

    let query = $state('');

    // Assuming loadsStore contains all shipments info
    // In a real app we might fetch from a different endpoint or enrich this data
    let filteredShipments = $derived($loadsStore.filter(l => 
        l.id.toLowerCase().includes(query.toLowerCase()) || 
        l.route.toLowerCase().includes(query.toLowerCase())
    ));
</script>

<div class="p-8 max-w-[1600px] mx-auto space-y-8">
    
    <!-- Header -->
    <header class="flex items-center justify-between">
        <div>
            <h1 class="text-3xl font-black text-slate-900 tracking-tight">Shipment Manifests</h1>
            <p class="text-slate-500 font-medium">Global logistics operations control</p>
        </div>
        <div class="flex gap-4">
             <div class="relative">
                <span class="absolute left-3 top-1/2 -translate-y-1/2 material-symbols-outlined text-slate-400">search</span>
                <input bind:value={query} type="text" placeholder="Search shipments..." class="pl-10 pr-4 py-2 border border-slate-200 rounded-lg text-sm font-bold focus:outline-none focus:ring-2 focus:ring-indigo-500 w-64" />
            </div>
            <button class="flex items-center gap-2 px-4 py-2 bg-indigo-600 text-white rounded-lg text-sm font-bold hover:bg-indigo-700 shadow-lg shadow-indigo-200">
                <span class="material-symbols-outlined text-[18px]">add</span>
                Create Load
            </button>
        </div>
    </header>

    <!-- Shipments Table -->
    <div class="bg-white rounded-2xl border border-slate-100 shadow-sm overflow-hidden min-h-[500px]">
        <table class="w-full text-left border-collapse">
            <thead class="bg-slate-50 border-b border-slate-100">
                <tr>
                    <th class="px-6 py-4 text-[10px] font-black uppercase tracking-widest text-slate-500">Manifest ID</th>
                    <th class="px-6 py-4 text-[10px] font-black uppercase tracking-widest text-slate-500">Route Vector</th>
                    <th class="px-6 py-4 text-[10px] font-black uppercase tracking-widest text-slate-500">Cargo Type</th>
                    <th class="px-6 py-4 text-[10px] font-black uppercase tracking-widest text-slate-500">Est. Date</th>
                    <th class="px-6 py-4 text-[10px] font-black uppercase tracking-widest text-slate-500">Status</th>
                    <th class="px-6 py-4 text-[10px] font-black uppercase tracking-widest text-slate-500 text-right">Actions</th>
                </tr>
            </thead>
            <tbody class="divide-y divide-slate-100">
                {#each filteredShipments as shipment}
                    <tr class="hover:bg-slate-50/50 transition-colors group">
                        <td class="px-6 py-4 font-mono text-xs font-bold text-slate-600">
                            <span class="text-indigo-600">{shipment.id}</span>
                        </td>
                        <td class="px-6 py-4">
                            <p class="text-sm font-bold text-slate-900">{shipment.route}</p>
                        </td>
                        <td class="px-6 py-4">
                             <div class="flex items-center gap-2">
                                <span class="material-symbols-outlined text-[16px] text-slate-400">inventory_2</span>
                                <span class="text-xs font-bold text-slate-700">{shipment.cargo}</span>
                             </div>
                        </td>
                         <td class="px-6 py-4">
                            <span class="text-xs font-medium text-slate-500 font-mono">{shipment.date}</span>
                        </td>
                        <td class="px-6 py-4">
                            <span class="inline-flex items-center gap-1.5 px-2.5 py-1 rounded-full text-[10px] font-black uppercase tracking-wider
                                {shipment.status === 'In Transit' ? 'bg-blue-50 text-blue-600' : 
                                 shipment.status === 'Delivered' ? 'bg-emerald-50 text-emerald-600' : 'bg-slate-100 text-slate-500'}">
                                {shipment.status}
                            </span>
                        </td>
                        <td class="px-6 py-4 text-right">
                             <button class="text-slate-400 hover:text-indigo-600 transition-colors p-2 hover:bg-slate-100 rounded-lg">
                                <span class="material-symbols-outlined text-[20px]">edit</span>
                            </button>
                        </td>
                    </tr>
                {/each}
            </tbody>
        </table>
    </div>
</div>
