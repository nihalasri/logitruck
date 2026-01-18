<script>
    import { onMount } from 'svelte';
    import { goto } from '$app/navigation';
    import { base } from '$app/paths';
    import { supabase } from '$lib/supabase';

    let status = $state('Authenticating...');

    onMount(async () => {
        try {
            const { data: { session }, error } = await supabase.auth.getSession();
            
            if (session) {
                await handleSession(session);
            } else {
                // Listen for the auth state change (OAuth redirect handling)
                const { data: { subscription } } = supabase.auth.onAuthStateChange(async (event, session) => {
                    if (event === 'SIGNED_IN' && session) {
                        await handleSession(session);
                    }
                });

                // Failsafe timeout
                setTimeout(() => {
                   if (status === 'Authenticating...') { // Only if still stuck
                       status = 'Redirecting to login...';
                       goto(`${base}/login`);
                   }
                }, 5000);
            }
        } catch (e) {
            console.error("Auth Error:", e);
            goto(`${base}/login`);
        }
    });

    async function handleSession(session) {
        status = 'Setting up profile...';
        try {
            let role = session.user.user_metadata?.role;
            const intendedRole = localStorage.getItem('signup_role');
            
            // Optimization: If role already matches intended role, skip updates
            if (intendedRole && role === intendedRole) {
                localStorage.removeItem('signup_role');
            } else if (intendedRole || !role) {
                const newRole = intendedRole || 'client'; // Default to client
                
                // execute updates in parallel for speed
                const [authUpdate, profileUpdate] = await Promise.all([
                    supabase.auth.updateUser({ data: { role: newRole } }),
                    supabase.from('profiles').update({ role: newRole }).eq('id', session.user.id)
                ]);

                if (authUpdate.error) console.error("Update User Error:", authUpdate.error);
                if (profileUpdate.error) console.error("Profile Update Error:", profileUpdate.error);
                
                role = newRole;
                if (intendedRole) localStorage.removeItem('signup_role');
            }

            status = 'Redirecting...';
            if (role === 'driver') {
                await goto(`${base}/driver/dashboard`);
            } else {
                await goto(`${base}/client/dashboard`);
            }
        } catch (err) {
            console.error('Critical Session Error:', err);
            // Fallback redirect
            goto(`${base}/client/dashboard`);
        }
    }
</script>

<div class="min-h-screen flex items-center justify-center bg-slate-50 font-display">
    <div class="flex flex-col items-center gap-6">
        <div class="size-12 border-4 border-slate-200 border-t-primary rounded-full animate-spin"></div>
        <div class="text-center">
            <p class="text-slate-900 font-black text-lg mb-1">{status}</p>
            <p class="text-slate-500 font-medium text-sm">Please wait while we sign you in...</p>
        </div>
    </div>
</div>
