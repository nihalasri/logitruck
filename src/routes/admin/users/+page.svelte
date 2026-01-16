<script>
    let users = [
        { id: 'USR-1001', name: 'John Doe', email: 'john@example.com', role: 'Driver', status: 'Active', joined: 'Jan 15, 2024' },
        { id: 'USR-1002', name: 'Jane Smith', email: 'jane@logistics.co', role: 'Client', status: 'Verify Pending', joined: 'Jan 16, 2024' },
        { id: 'USR-1003', name: 'Mike Ross', email: 'mike@fasttrack.com', role: 'Driver', status: 'Active', joined: 'Jan 14, 2024' },
        { id: 'USR-1004', name: 'Sarah Connor', email: 'sarah@skynet.com', role: 'Client', status: 'Suspended', joined: 'Dec 10, 2023' },
        { id: 'USR-1005', name: 'Robert Paulson', email: 'bob@project.org', role: 'Driver', status: 'Active', joined: 'Jan 10, 2024' }
    ];

    let query = $state('');

    let filteredUsers = $derived(users.filter(u => 
        u.name.toLowerCase().includes(query.toLowerCase()) || 
        u.email.toLowerCase().includes(query.toLowerCase())
    ));
</script>

<div class="p-8 max-w-[1600px] mx-auto space-y-8">
    
    <!-- Header -->
    <header class="flex items-center justify-between">
        <div>
            <h1 class="text-3xl font-black text-slate-900 tracking-tight">User Management</h1>
            <p class="text-slate-500 font-medium">Control panel for platform users</p>
        </div>
        <div class="flex gap-4">
             <div class="relative">
                <span class="absolute left-3 top-1/2 -translate-y-1/2 material-symbols-outlined text-slate-400">search</span>
                <input bind:value={query} type="text" placeholder="Search users..." class="pl-10 pr-4 py-2 border border-slate-200 rounded-lg text-sm font-bold focus:outline-none focus:ring-2 focus:ring-indigo-500 w-64" />
            </div>
            <button class="flex items-center gap-2 px-4 py-2 bg-indigo-600 text-white rounded-lg text-sm font-bold hover:bg-indigo-700 shadow-lg shadow-indigo-200">
                <span class="material-symbols-outlined text-[18px]">add</span>
                Add User
            </button>
        </div>
    </header>

    <!-- Users Table -->
    <div class="bg-white rounded-2xl border border-slate-100 shadow-sm overflow-hidden">
        <table class="w-full text-left border-collapse">
            <thead class="bg-slate-50 border-b border-slate-100">
                <tr>
                    <th class="px-6 py-4 text-[10px] font-black uppercase tracking-widest text-slate-500">User ID</th>
                    <th class="px-6 py-4 text-[10px] font-black uppercase tracking-widest text-slate-500">Profile</th>
                    <th class="px-6 py-4 text-[10px] font-black uppercase tracking-widest text-slate-500">Role</th>
                    <th class="px-6 py-4 text-[10px] font-black uppercase tracking-widest text-slate-500">Status</th>
                    <th class="px-6 py-4 text-[10px] font-black uppercase tracking-widest text-slate-500">Joined</th>
                    <th class="px-6 py-4 text-[10px] font-black uppercase tracking-widest text-slate-500 text-right">Actions</th>
                </tr>
            </thead>
            <tbody class="divide-y divide-slate-100">
                {#each filteredUsers as user}
                    <tr class="hover:bg-slate-50/50 transition-colors group">
                        <td class="px-6 py-4 font-mono text-xs font-bold text-slate-600">{user.id}</td>
                        <td class="px-6 py-4">
                            <div class="flex items-center gap-3">
                                <div class="size-8 rounded-full bg-slate-100 flex items-center justify-center text-slate-500 font-bold text-xs">
                                    {user.name.charAt(0)}
                                </div>
                                <div>
                                    <p class="text-sm font-bold text-slate-900 leading-none">{user.name}</p>
                                    <p class="text-xs text-slate-500 mt-1">{user.email}</p>
                                </div>
                            </div>
                        </td>
                        <td class="px-6 py-4">
                             <div class="flex items-center gap-2">
                                <span class="material-symbols-outlined text-[18px] text-slate-400">
                                    {user.role === 'Driver' ? 'local_shipping' : 'business_center'}
                                </span>
                                <span class="text-xs font-bold text-slate-700">{user.role}</span>
                             </div>
                        </td>
                        <td class="px-6 py-4">
                            <span class="inline-flex items-center gap-1.5 px-2.5 py-1 rounded-full text-[10px] font-black uppercase tracking-wider
                                {user.status === 'Active' ? 'bg-emerald-50 text-emerald-600' : 
                                 user.status === 'Suspended' ? 'bg-red-50 text-red-600' : 'bg-amber-50 text-amber-600'}">
                                {user.status}
                            </span>
                        </td>
                        <td class="px-6 py-4 text-xs font-medium text-slate-500">{user.joined}</td>
                        <td class="px-6 py-4 text-right">
                             <button class="text-slate-400 hover:text-indigo-600 transition-colors">
                                <span class="material-symbols-outlined text-[20px]">more_vert</span>
                            </button>
                        </td>
                    </tr>
                {/each}
            </tbody>
        </table>
    </div>
</div>
