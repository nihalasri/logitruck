<script>
    import { onMount } from 'svelte';
    import { goto } from '$app/navigation';
    import { base } from '$app/paths';
    import { supabase } from '$lib/supabase';

    onMount(async () => {
        const { data: { session }, error } = await supabase.auth.getSession();
        
        if (session) {
            handleSession(session);
        } else {
            const timeout = setTimeout(() => {
                goto(`${base}/login`);
            }, 4000);

            const { data: { subscription } } = supabase.auth.onAuthStateChange((event, session) => {
                if (session) {
                    clearTimeout(timeout);
                    handleSession(session);
                }
            });
        }
    });

    async function handleSession(session) {
        let role = session.user.user_metadata.role;
        const intendedRole = localStorage.getItem('signup_role');
        
        if (intendedRole || !role) {
            const newRole = intendedRole || 'client';
            
            try {
                // Update auth metadata
                await supabase.auth.updateUser({
                    data: { role: newRole }
                });

                // Update profiles table
                await supabase
                    .from('profiles')
                    .update({ role: newRole })
                    .eq('id', session.user.id);
                
                role = newRole;
            } catch (err) {
                console.error('Error updating role:', err);
            }
            
            if (intendedRole) localStorage.removeItem('signup_role');
        }

        // Redirect based on role
        if (role === 'driver') {
            goto(`${base}/driver/dashboard`);
        } else {
            goto(`${base}/client/dashboard`);
        }
    }
</script>

<div class="min-h-screen flex items-center justify-center bg-slate-50 font-display">
    <div class="flex flex-col items-center gap-6">
        <div class="size-12 border-4 border-slate-200 border-t-primary rounded-full animate-spin"></div>
        <div class="text-center">
            <p class="text-slate-900 font-black text-lg mb-1">Authenticating</p>
            <p class="text-slate-500 font-medium text-sm">Please wait while we sign you in...</p>
        </div>
    </div>
</div>
