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
            const { data: { subscription } } = supabase.auth.onAuthStateChange((event, session) => {
                if (session) {
                    handleSession(session);
                }
            });
        }
    });

    async function handleSession(session) {
        let role = session.user.user_metadata.role;
        
        // Check if we have a pending role assignment from signup
        const intendedRole = localStorage.getItem('signup_role');
        
        if (!role && intendedRole) {
            try {
                // Update user metadata with the selected role
                const { data, error } = await supabase.auth.updateUser({
                    data: { role: intendedRole }
                });
                
                if (!error && data.user) {
                    role = intendedRole;
                }
            } catch (err) {
                console.error('Error updating role:', err);
            }
            // Clear the stored role
            localStorage.removeItem('signup_role');
        } else if (!role) {
            // Default to client if no role and no intended role
            role = 'client';
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
