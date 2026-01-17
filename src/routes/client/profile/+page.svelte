<script>
    import { onMount } from 'svelte';
    import { goto } from '$app/navigation';
    import { supabase } from '$lib/supabase';
    import ClientSidebar from '$lib/components/ClientSidebar.svelte';
    import { fade } from 'svelte/transition';

    let profile = $state(null);
    let email = $state('');
    let isLoading = $state(true);
    let isEditing = $state(false);
    let originalProfile = null;
    let showToast = $state(false);
    let toastMessage = $state('');

    onMount(async () => {
        await fetchProfile();
    });

    async function fetchProfile() {
        try {
            const { data: { user } } = await supabase.auth.getUser();
            if (user) {
                email = user.email;
                
                // 1. Construct default from Auth (Google/Signup data)
                const meta = user.user_metadata || {};
                const defaultProfile = {
                    id: user.id,
                    full_name: meta.full_name || meta.name || user.email?.split('@')[0],
                    avatar_url: meta.avatar_url || meta.picture || null,
                    role: meta.role || 'client',
                    company_name: '',
                    created_at: new Date().toISOString()
                };

                // 2. Try to fetch from DB
                const { data, error } = await supabase
                    .from('profiles')
                    .select('*')
                    .eq('id', user.id)
                    .maybeSingle();
                
                // 3. Merge: DB takes priority, otherwise use Auth defaults
                if (data) {
                    profile = data;
                } else {
                    profile = defaultProfile;
                    // Auto-creating the profile in state so user sees data immediately,
                    // but we won't save to DB until they click Save or we could do it silently here.
                    // For now, let's just show it.
                }
                
                // Ensure defaults if DB has nulls for some reason
                if (!profile.full_name) profile.full_name = defaultProfile.full_name;
                if (!profile.avatar_url) profile.avatar_url = defaultProfile.avatar_url;

                originalProfile = { ...profile };
            }
        } catch (error) {
            console.error('Error fetching profile:', error);
        } finally {
            isLoading = false;
        }
    }

    async function handleSave() {
        try {
            // Upsert: Create if doesn't exist, Update if it does
            const { error } = await supabase
                .from('profiles')
                .upsert({
                    id: profile.id, // Required for upsert to know which row
                    full_name: profile.full_name,
                    company_name: profile.company_name,
                    avatar_url: profile.avatar_url,
                    role: profile.role,
                    updated_at: new Date().toISOString()
                });

            if (error) throw error;
            
            originalProfile = { ...profile };
            isEditing = false;
            toastMessage = 'Profile updated successfully!';
            showToast = true;
            setTimeout(() => showToast = false, 3000);
        } catch (error) {
            console.error('Error updating profile:', error);
            toastMessage = 'Failed to update profile.';
            showToast = true;
            setTimeout(() => showToast = false, 3000);
        }
    }

    function handleCancel() {
        profile = { ...originalProfile };
        isEditing = false;
    }
    let certificates = $state([]);
    let isUploading = $state(false);
    
    // Phone & OTP
    let phone = $state('');
    let showOtpInput = $state(false);
    let otpCode = $state('');
    let phoneVerified = $state(false);

    onMount(async () => {
        await fetchProfile();
        await fetchCertificates();
    });

    async function fetchCertificates() {
        if (!profile?.id) return;
        
        const { data, error } = await supabase
            .from('certificates')
            .select('*')
            .eq('user_id', profile.id)
            .order('created_at', { ascending: false });
            
        if (!error) certificates = data || [];
    }

    async function handleUploadCertificate(e) {
        const file = e.target.files[0];
        if (!file) return;
        
        isUploading = true;
        try {
            // 1. Upload file
            const fileExt = file.name.split('.').pop();
            const fileName = `${Math.random()}.${fileExt}`;
            const filePath = `${profile.id}/${fileName}`;
            
            const { error: uploadError } = await supabase.storage
                .from('certificates')
                .upload(filePath, file);

            if (uploadError) throw uploadError;

            // 2. Get Public URL
            const { data: { publicUrl } } = supabase.storage
                .from('certificates')
                .getPublicUrl(filePath);

            // 3. Insert record
            const { data, error: dbError } = await supabase
                .from('certificates')
                .insert({
                    user_id: profile.id,
                    type: 'company_reg', // Default for now
                    file_url: publicUrl,
                    status: 'pending'
                })
                .select()
                .single();

            if (dbError) throw dbError;
            
            certificates = [data, ...certificates];
            triggerToast('Certificate uploaded successfully!');
        } catch (error) {
            console.error('Upload error:', error);
            triggerToast('Failed to upload certificate.');
        } finally {
            isUploading = false;
        }
    }

    async function initiatePhoneVerification() {
        if (!profile.phone || profile.phone.length < 10) {
            triggerToast('Please enter a valid phone number');
            return;
        }
        
        isLoading = true;
        try {
            const { error } = await supabase.auth.updateUser({
                phone: profile.phone
            });
            
            if (error) throw error;
            
            showOtpInput = true;
            triggerToast('OTP sent to your phone.');
        } catch (err) {
            console.error(err);
            triggerToast(err.message);
        } finally {
            isLoading = false;
        }
    }

    async function verifyPhoneOtp() {
        isLoading = true;
        try {
            const { data, error } = await supabase.auth.verifyOtp({
                phone: profile.phone,
                token: otpCode,
                type: 'sms'
            });
            
            if (error) throw error;
            
            phoneVerified = true;
            showOtpInput = false;
            triggerToast('Phone number verified successfully!');
            await handleSave(); // Save the verified status/phone to profile
            
        } catch (err) {
             console.error(err);
             triggerToast('Invalid OTP');
        } finally {
            isLoading = false;
        }
    }

    // Helper for toast
    function triggerToast(msg) {
        toastMessage = msg;
        showToast = true;
        setTimeout(() => showToast = false, 3000);
    }
</script>


<div class="bg-bg-main text-slate-900 font-display min-h-screen flex selection:bg-primary/10 relative">
    <ClientSidebar activePage="profile" />
    
    <main class="flex-1 flex flex-col h-screen overflow-hidden relative">
        <!-- Header -->
        <header class="flex items-center justify-between glass border-b border-slate-200 px-8 py-5 h-20 shrink-0 z-20">
             <div class="flex items-center gap-4 lg:hidden">
                <button class="text-slate-600 hover:text-primary transition-colors">
                    <span class="material-symbols-outlined">menu</span>
                </button>
                <span class="text-xl font-black tracking-tight">LogiTruck</span>
            </div>
            <div class="hidden lg:block">
                <h1 class="text-xl font-black tracking-tight text-slate-900">Your Profile</h1>
            </div>
             <div class="flex items-center gap-6">
                <!-- Notification Bell (reused) -->
                <button onclick={() => goto('/client/notifications')} class="relative p-2.5 rounded-xl text-slate-500 hover:bg-slate-100 hover:text-primary transition-all micro-interaction">
                    <span class="material-symbols-outlined text-[22px]">notifications</span>
                </button>
            </div>
        </header>

        <div class="flex-1 overflow-y-auto p-8 bg-[radial-gradient(40%_40%_at_50%_0%,rgba(29,78,216,0.03)_0%,transparent_100%)]">
            <div class="max-w-4xl mx-auto">
                
                {#if isLoading}
                    <div class="flex items-center justify-center h-64">
                         <div class="size-10 border-4 border-slate-200 border-t-primary rounded-full animate-spin"></div>
                    </div>
                {:else if profile}
                    <div class="premium-card overflow-hidden bg-white shadow-xl shadow-slate-200/50">
                        <!-- Cover Image -->
                        <div class="h-48 bg-gradient-to-r from-slate-900 to-slate-800 relative">
                            <div class="absolute inset-0 bg-primary/10"></div>
                            <div class="absolute bottom-0 left-0 w-full p-8 flex items-end translate-y-1/2">
                                <div class="relative group">
                                    <div class="size-32 rounded-2xl bg-white p-1 shadow-2xl ring-4 ring-white/10 overflow-hidden">
                                        <img 
                                            src={profile.avatar_url || 'https://www.gravatar.com/avatar/00000000000000000000000000000000?d=mp&f=y'} 
                                            alt={profile.full_name} 
                                            class="w-full h-full object-cover rounded-xl bg-slate-100"
                                        />
                                    </div>
                                    {#if isEditing}
                                        <button class="absolute bottom-2 right-2 bg-slate-900 text-white p-2 rounded-lg hover:bg-primary transition-colors shadow-lg">
                                            <span class="material-symbols-outlined text-sm">edit</span>
                                        </button>
                                    {/if}
                                </div>
                                <div class="ml-6 mb-16 text-white pb-2">
                                    <h2 class="text-3xl font-black tracking-tight">{profile.full_name || 'No Name'}</h2>
                                    <p class="text-slate-300 font-medium">{profile.role === 'client' ? 'Client Account' : 'Driver Account'}</p>
                                </div>
                            </div>
                        </div>

                        <div class="pt-24 px-8 pb-8">
                            <div class="flex justify-between items-center mb-8">
                                <div>
                                    <h3 class="text-xl font-black text-slate-900">Personal Information</h3>
                                    <p class="text-slate-500 text-sm">Manage your account details and preferences.</p>
                                </div>
                                {#if !isEditing}
                                    <button 
                                        onclick={() => isEditing = true}
                                        class="px-6 py-3 rounded-xl bg-slate-900 text-white font-bold text-sm hover:bg-slate-800 transition-all shadow-lg shadow-slate-200"
                                    >
                                        Edit Profile
                                    </button>
                                {:else}
                                    <div class="flex gap-3">
                                        <button 
                                            onclick={handleCancel}
                                            class="px-6 py-3 rounded-xl bg-white border border-slate-200 text-slate-700 font-bold text-sm hover:bg-slate-50 transition-all"
                                        >
                                            Cancel
                                        </button>
                                        <button 
                                            onclick={handleSave}
                                            class="px-6 py-3 rounded-xl bg-primary text-white font-bold text-sm hover:bg-blue-600 transition-all shadow-lg shadow-primary/20"
                                        >
                                            Save Changes
                                        </button>
                                    </div>
                                {/if}
                            </div>

                            <div class="grid grid-cols-1 md:grid-cols-2 gap-8">
                                <div class="space-y-2">
                                    <label class="text-[10px] font-black uppercase tracking-[0.2em] text-slate-400 ml-1">Full Name</label>
                                    {#if isEditing}
                                        <input bind:value={profile.full_name} type="text" class="w-full px-4 py-3 rounded-xl bg-slate-50 border-none text-sm font-bold focus:ring-2 focus:ring-primary/20 transition-all" />
                                    {:else}
                                        <div class="px-4 py-3 rounded-xl bg-slate-50 text-slate-900 text-sm font-bold border border-transparent">
                                            {profile.full_name || 'Not set'}
                                        </div>
                                    {/if}
                                </div>

                                <div class="space-y-2">
                                    <label class="text-[10px] font-black uppercase tracking-[0.2em] text-slate-400 ml-1">Email Address</label>
                                    <div class="px-4 py-3 rounded-xl bg-slate-50/50 text-slate-500 text-sm font-bold border border-transparent cursor-not-allowed">
                                        {email}
                                        <span class="float-right text-[10px] uppercase bg-emerald-100 text-emerald-600 px-2 py-0.5 rounded font-black tracking-wider">Verified</span>
                                    </div>
                                </div>

                                <div class="space-y-2">
                                    <label class="text-[10px] font-black uppercase tracking-[0.2em] text-slate-400 ml-1">Company Name</label>
                                    {#if isEditing}
                                        <input bind:value={profile.company_name} type="text" placeholder="e.g. Acme Logistics" class="w-full px-4 py-3 rounded-xl bg-slate-50 border-none text-sm font-bold focus:ring-2 focus:ring-primary/20 transition-all" />
                                    {:else}
                                        <div class="px-4 py-3 rounded-xl bg-slate-50 text-slate-900 text-sm font-bold border border-transparent">
                                            {profile.company_name || 'Not set'}
                                        </div>
                                    {/if}
                                </div>

                                <div class="space-y-2">
                                    <label class="text-[10px] font-black uppercase tracking-[0.2em] text-slate-400 ml-1">Role</label>
                                    <div class="px-4 py-3 rounded-xl bg-slate-50 text-slate-900 text-sm font-bold border border-transparent capitalize">
                                        {profile.role}
                                    </div>
                                </div>
                                
                                <div class="space-y-2 md:col-span-2">
                                    <label class="text-[10px] font-black uppercase tracking-[0.2em] text-slate-400 ml-1">Avatar URL</label>
                                    {#if isEditing}
                                        <input bind:value={profile.avatar_url} type="text" placeholder="https://..." class="w-full px-4 py-3 rounded-xl bg-slate-50 border-none text-sm font-bold focus:ring-2 focus:ring-primary/20 transition-all font-mono text-xs" />
                                    {:else}
                                         <div class="px-4 py-3 rounded-xl bg-slate-50 text-slate-500 text-sm font-mono border border-transparent truncate">
                                            {profile.avatar_url || 'Not set'}
                                        </div>
                                    {/if}
                                </div>
                                <div class="space-y-2">
                                    <label class="text-[10px] font-black uppercase tracking-[0.2em] text-slate-400 ml-1">Phone Number</label>
                                    {#if isEditing}
                                        <div class="flex gap-2">
                                            <input bind:value={profile.phone} type="tel" placeholder="+1234567890" class="flex-1 px-4 py-3 rounded-xl bg-slate-50 border-none text-sm font-bold focus:ring-2 focus:ring-primary/20 transition-all font-mono" />
                                            {#if !phoneVerified}
                                            <button 
                                                onclick={initiatePhoneVerification} 
                                                disabled={isLoading}
                                                class="px-4 py-2 bg-slate-900 text-white rounded-xl text-xs font-black uppercase tracking-wider hover:bg-slate-800 disabled:opacity-50"
                                            >
                                                Verify
                                            </button>
                                            {/if}
                                        </div>
                                        {#if showOtpInput}
                                        <div class="flex gap-2 mt-2 animate-fade-in">
                                             <input bind:value={otpCode} type="text" placeholder="OTP" maxlength="6" class="w-full px-4 py-3 rounded-xl bg-slate-50 border border-primary/20 text-sm font-bold text-center tracking-widest" />
                                             <button 
                                                onclick={verifyPhoneOtp}
                                                disabled={isLoading}
                                                class="px-4 py-2 bg-primary text-white rounded-xl text-xs font-black uppercase tracking-wider hover:bg-blue-600 disabled:opacity-50"
                                            >
                                                Submit
                                             </button>
                                        </div>
                                        {/if}
                                    {:else}
                                        <div class="px-4 py-3 rounded-xl bg-slate-50 text-slate-900 text-sm font-bold border border-transparent flex items-center justify-between">
                                            <span class="font-mono">{profile.phone || 'Not set'}</span>
                                            {#if profile.phone}
                                                {#if phoneVerified || profile.phone_verified} 
                                                    <span class="text-[10px] uppercase bg-emerald-100 text-emerald-600 px-2 py-0.5 rounded font-black tracking-wider">Verified</span>
                                                {:else}
                                                    <span class="text-[10px] uppercase bg-amber-100 text-amber-600 px-2 py-0.5 rounded font-black tracking-wider">Unverified</span>
                                                {/if}
                                            {/if}
                                        </div>
                                    {/if}
                                </div>
                            </div>
                            
                            <div class="mt-8 pt-6 border-t border-slate-100">
                                <div class="flex justify-between items-center mb-6">
                                    <div>
                                        <h3 class="text-xl font-black text-slate-900">Documents & Certificates</h3>
                                        <p class="text-slate-500 text-sm">Upload official company documents.</p>
                                    </div>
                                    {#if isEditing}
                                    <label class="cursor-pointer px-4 py-2 rounded-xl bg-slate-100 text-slate-700 font-bold text-xs hover:bg-slate-200 transition-colors flex items-center gap-2">
                                        <span class="material-symbols-outlined text-lg">upload_file</span>
                                        {isUploading ? 'Uploading...' : 'Upload New'}
                                        <input type="file" accept=".pdf,.jpg,.png" class="hidden" onchange={handleUploadCertificate} disabled={isUploading} />
                                    </label>
                                    {/if}
                                </div>
                                
                                <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
                                    {#each certificates as cert}
                                        <div class="p-4 rounded-xl border border-slate-100 bg-slate-50 hover:bg-white hover:shadow-md transition-all group relative">
                                            <div class="flex items-start justify-between mb-2">
                                                <div class="size-10 rounded-lg bg-red-100 text-red-500 flex items-center justify-center">
                                                    <span class="material-symbols-outlined">description</span>
                                                </div>
                                                <span class="text-[10px] uppercase font-black tracking-wider px-2 py-1 rounded-md {cert.status === 'verified' ? 'bg-emerald-100 text-emerald-600' : 'bg-amber-100 text-amber-600'}">
                                                    {cert.status}
                                                </span>
                                            </div>
                                            <p class="text-sm font-bold text-slate-900 truncate mb-1">Certificate #{cert.id.slice(0,6)}</p>
                                            <p class="text-xs text-slate-500">{new Date(cert.created_at).toLocaleDateString()}</p>
                                            <a href={cert.file_url} target="_blank" class="absolute inset-0 z-10"></a>
                                        </div>
                                    {:else}
                                        <div class="col-span-full py-8 text-center border-2 border-dashed border-slate-200 rounded-xl">
                                            <p class="text-slate-400 font-bold text-sm">No documents uploaded yet.</p>
                                        </div>
                                    {/each}
                                </div>

                                <div class="mt-8 flex justify-between items-center">
                                     <div>
                                        <p class="text-xs font-bold text-slate-400">Member Since</p>
                                        <p class="text-sm font-black text-slate-900">{new Date(profile.created_at).toLocaleDateString()}</p>
                                     </div>
                                </div>
                            </div>
                        </div>
                    </div>
                {/if}
            </div>
        </div>
         {#if showToast}
            <div 
                transition:fade
                class="fixed bottom-6 right-6 bg-slate-900 text-white px-6 py-4 rounded-2xl shadow-2xl flex items-center gap-4 z-50 max-w-sm"
            >
                <div class="size-8 rounded-full bg-emerald-500/20 text-emerald-400 flex items-center justify-center">
                    <span class="material-symbols-outlined text-lg">check_circle</span>
                </div>
                <p class="text-sm font-bold">{toastMessage}</p>
            </div>
        {/if}
    </main>
</div>
