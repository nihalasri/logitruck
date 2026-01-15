<script>
  import DriverSidebar from '$lib/components/DriverSidebar.svelte';
  
  let user = $state({
      name: "David Sterlings",
      email: "driver.dave@logitruck.com",
      role: "Senior Operator",
      carrier: "LogiTrans Fleet Services",
      phone: "+1 (555) 987-6543",
      location: "Phoenix, AZ",
      license: "CDL-A 28394022",
      truck: "Volvo VNL 860",
      plate: "AZ 48392",
      avatar: "https://images.unsplash.com/photo-1633332755192-727a05c4013d?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3"
  });

  let isEditing = $state(false);
</script>

<div class="bg-bg-main text-slate-900 font-display min-h-screen flex selection:bg-primary/10">
    <DriverSidebar activePage="profile" />
    
    <main class="flex-1 flex flex-col h-screen overflow-hidden relative">
        <!-- Header -->
        <header class="flex items-center justify-between glass border-b border-slate-200 px-8 py-5 h-20 shrink-0 z-20">
            <div class="flex items-center gap-4 lg:hidden">
                <button class="text-slate-600 hover:text-primary transition-colors">
                    <span class="material-symbols-outlined">menu</span>
                </button>
                <span class="text-xl font-black tracking-tight">LogiTruck</span>
            </div>
            
            <div class="flex-1"></div> <!-- Spacer -->

            <div class="flex items-center gap-6">
                <button class="relative p-2.5 rounded-xl text-slate-500 hover:bg-slate-100 hover:text-primary transition-all micro-interaction">
                    <span class="material-symbols-outlined text-[22px]">notifications</span>
                    <span class="absolute top-2.5 right-2.5 h-2 w-2 rounded-full bg-primary ring-2 ring-white"></span>
                </button>
                <div class="flex items-center gap-3 pl-4 border-l border-slate-200 cursor-pointer">
                    <div class="flex flex-col items-end hidden sm:flex">
                        <span class="text-sm font-bold leading-tight">{user.name}</span>
                        <span class="text-[10px] font-black text-slate-400 uppercase tracking-widest">{user.role}</span>
                    </div>
                    <div class="h-10 w-10 rounded-xl overflow-hidden ring-2 ring-slate-100 shadow-sm">
                        <img alt="User Avatar" class="h-full w-full object-cover" src={user.avatar}/>
                    </div>
                </div>
            </div>
        </header>

        <!-- Scrollable Content -->
        <div class="flex-1 overflow-y-auto p-8 space-y-10 bg-[radial-gradient(40%_40%_at_50%_0%,rgba(29,78,216,0.03)_0%,transparent_100%)]">
            
            <div class="flex items-center justify-between">
                <div>
                    <h2 class="text-4xl font-black text-slate-900 tracking-tight leading-none font-display">Driver Profile</h2>
                    <p class="text-slate-500 font-medium mt-2">Manage your credentials and vehicle information.</p>
                </div>
                <button 
                  onclick={() => isEditing = !isEditing}
                  class="bg-slate-900 text-white px-6 py-3 rounded-xl font-bold text-sm hover:bg-slate-800 transition-all flex items-center gap-2"
                >
                    <span class="material-symbols-outlined text-sm">{isEditing ? 'save' : 'edit'}</span>
                    {isEditing ? 'Save Changes' : 'Edit Profile'}
                </button>
            </div>

            <div class="grid grid-cols-1 lg:grid-cols-3 gap-8">
                <!-- Profile Card -->
                <div class="bg-white p-8 rounded-3xl border border-slate-100 shadow-xl shadow-slate-200/50 flex flex-col items-center text-center relative overflow-hidden">
                   <div class="absolute inset-x-0 top-0 h-32 bg-gradient-to-br from-indigo-500/10 to-blue-500/10"></div>
                   
                   <div class="relative z-10 mt-12 mb-6">
                       <div class="size-32 rounded-3xl overflow-hidden ring-4 ring-white shadow-2xl">
                           <img src={user.avatar} alt="Profile" class="w-full h-full object-cover" />
                       </div>
                       {#if isEditing}
                       <button class="absolute bottom-2 right-2 bg-slate-900 text-white p-2 rounded-xl hover:scale-110 transition-transform shadow-lg">
                           <span class="material-symbols-outlined text-sm">photo_camera</span>
                       </button>
                       {/if}
                   </div>

                   <h3 class="text-2xl font-black text-slate-900">{user.name}</h3>
                   <p class="text-slate-500 font-medium mb-6">{user.role}</p>

                   <div class="flex gap-4 w-full">
                       <div class="flex-1 bg-slate-50 p-4 rounded-2xl border border-slate-100">
                           <p class="text-2xl font-black text-slate-900">182</p>
                           <p class="text-[10px] uppercase font-black text-slate-400 tracking-widest">Trips</p>
                       </div>
                       <div class="flex-1 bg-slate-50 p-4 rounded-2xl border border-slate-100">
                           <p class="text-2xl font-black text-slate-900">4.9</p>
                           <p class="text-[10px] uppercase font-black text-slate-400 tracking-widest">Rating</p>
                       </div>
                       <div class="flex-1 bg-slate-50 p-4 rounded-2xl border border-slate-100">
                           <p class="text-2xl font-black text-slate-900">98%</p>
                           <p class="text-[10px] uppercase font-black text-slate-400 tracking-widest">Safety</p>
                       </div>
                   </div>
                </div>

                <!-- Details Form -->
                <div class="lg:col-span-2 bg-white p-8 rounded-3xl border border-slate-100 shadow-xl shadow-slate-200/50">
                    <h4 class="text-lg font-black text-slate-900 mb-6 flex items-center gap-2">
                        <span class="material-symbols-outlined text-primary">person</span>
                        Personal Information
                    </h4>
                    
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-6 mb-8">
                        <div class="space-y-2">
                            <label for="profile-name" class="text-xs font-black text-slate-500 uppercase tracking-widest ml-1">Full Name</label>
                            {#if isEditing}
                                <input id="profile-name" type="text" bind:value={user.name} class="w-full p-4 bg-slate-50 rounded-2xl font-bold text-slate-700 border-none focus:ring-2 focus:ring-primary/20 transition-all outline-none" />
                            {:else}
                                <div class="w-full p-4 bg-slate-50 rounded-2xl font-bold text-slate-700 border border-transparent">{user.name}</div>
                            {/if}
                        </div>
                        <div class="space-y-2">
                            <span class="text-xs font-black text-slate-500 uppercase tracking-widest ml-1 block">Email Address</span>
                            <div class="w-full p-4 bg-slate-50 rounded-2xl font-bold text-slate-700 border border-transparent flex items-center justify-between">
                                {user.email}
                                <span class="text-xs bg-emerald-100 text-emerald-700 px-2 py-1 rounded-lg font-bold">VERIFIED</span>
                            </div>
                        </div>
                        <div class="space-y-2">
                            <label for="profile-phone" class="text-xs font-black text-slate-500 uppercase tracking-widest ml-1">Phone Number</label>
                            {#if isEditing}
                                <input id="profile-phone" type="text" bind:value={user.phone} class="w-full p-4 bg-slate-50 rounded-2xl font-bold text-slate-700 border-none focus:ring-2 focus:ring-primary/20 transition-all outline-none" />
                            {:else}
                                <div class="w-full p-4 bg-slate-50 rounded-2xl font-bold text-slate-700 border border-transparent">{user.phone}</div>
                            {/if}
                        </div>
                         <div class="space-y-2">
                            <label for="profile-location" class="text-xs font-black text-slate-500 uppercase tracking-widest ml-1">Base Location</label>
                            {#if isEditing}
                                <input id="profile-location" type="text" bind:value={user.location} class="w-full p-4 bg-slate-50 rounded-2xl font-bold text-slate-700 border-none focus:ring-2 focus:ring-primary/20 transition-all outline-none" />
                            {:else}
                                <div class="w-full p-4 bg-slate-50 rounded-2xl font-bold text-slate-700 border border-transparent">{user.location}</div>
                            {/if}
                        </div>
                    </div>

                    <div class="w-full h-px bg-slate-100 my-8"></div>

                    <h4 class="text-lg font-black text-slate-900 mb-6 flex items-center gap-2">
                        <span class="material-symbols-outlined text-primary">local_shipping</span>
                        Professional Details
                    </h4>

                    <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                         <div class="space-y-2">
                            <label for="profile-carrier" class="text-xs font-black text-slate-500 uppercase tracking-widest ml-1">Carrier / Fleet</label>
                            {#if isEditing}
                                <input id="profile-carrier" type="text" bind:value={user.carrier} class="w-full p-4 bg-slate-50 rounded-2xl font-bold text-slate-700 border-none focus:ring-2 focus:ring-primary/20 transition-all outline-none" />
                            {:else}
                                <div class="w-full p-4 bg-slate-50 rounded-2xl font-bold text-slate-700 border border-transparent">{user.carrier}</div>
                            {/if}
                        </div>
                        <div class="space-y-2">
                            <label for="profile-license" class="text-xs font-black text-slate-500 uppercase tracking-widest ml-1">License Number</label>
                            <div class="w-full p-4 bg-slate-50 rounded-2xl font-bold text-slate-700 border border-transparent flex items-center gap-2">
                                <span class="material-symbols-outlined text-emerald-500">verified_user</span>
                                {user.license}
                            </div>
                        </div>
                         <div class="space-y-2">
                            <label for="profile-truck" class="text-xs font-black text-slate-500 uppercase tracking-widest ml-1">Truck Model</label>
                            {#if isEditing}
                                <input id="profile-truck" type="text" bind:value={user.truck} class="w-full p-4 bg-slate-50 rounded-2xl font-bold text-slate-700 border-none focus:ring-2 focus:ring-primary/20 transition-all outline-none" />
                            {:else}
                                <div class="w-full p-4 bg-slate-50 rounded-2xl font-bold text-slate-700 border border-transparent">{user.truck}</div>
                            {/if}
                        </div>
                           <div class="space-y-2">
                            <label for="profile-plate" class="text-xs font-black text-slate-500 uppercase tracking-widest ml-1">License Plate</label>
                            {#if isEditing}
                                <input id="profile-plate" type="text" bind:value={user.plate} class="w-full p-4 bg-slate-50 rounded-2xl font-bold text-slate-700 border-none focus:ring-2 focus:ring-primary/20 transition-all outline-none" />
                            {:else}
                                <div class="w-full p-4 bg-slate-50 rounded-2xl font-bold text-slate-700 border border-transparent">{user.plate}</div>
                            {/if}
                        </div>
                    </div>
                </div>
            </div>
            
        </div>
    </main>
</div>
