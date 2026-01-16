<script>
    import { goto } from '$app/navigation';
    import { base } from '$app/paths';
    import { supabase } from '$lib/supabase';

    let name = $state('');
    let email = $state('');
    let password = $state('');
    let confirmPassword = $state('');
    let role = $state('client'); // 'client' or 'driver'
    let error = $state('');
    let isLoading = $state(false);
    let isGoogleLoading = $state(false);
    let verificationSent = $state(false);

    async function handleSignup(e) {
        e.preventDefault();
        error = '';
        
        if (password !== confirmPassword) {
            error = 'Passwords do not match';
            return;
        }

        isLoading = true;

        try {
            const { data, error: authError } = await supabase.auth.signUp({
                email,
                password,
                options: {
                    data: {
                        full_name: name,
                        role: role
                    }
                }
            });

            if (authError) throw authError;

            if (data?.user && !data?.session) {
                verificationSent = true;
            } else {
                // Redirect based on role
                if (role === 'driver') {
                    goto(`${base}/driver/dashboard`);
                } else {
                    goto(`${base}/client/dashboard`);
                }
            }
        } catch (err) {
            error = err.message;
        } finally {
            isLoading = false;
        }
    }

    async function handleGoogleSignup() {
        error = '';
        isGoogleLoading = true;

        try {
            const { data, error: authError } = await supabase.auth.signInWithOAuth({
                provider: 'google',
                options: {
                    redirectTo: `${window.location.origin}/`
                }
            });

            if (authError) throw authError;
        } catch (err) {
             error = err.message;
             isGoogleLoading = false;
        }
    }
</script>

<div class="font-display antialiased text-slate-900 bg-bg-main min-h-screen flex selection:bg-primary/10">
    <!-- Visual Side -->
    <div class="hidden lg:flex w-7/12 relative bg-slate-900 overflow-hidden items-center justify-center p-20">
        <!-- Abstract Orbital Glows -->
        <div class="absolute top-0 right-0 size-[600px] bg-primary/20 blur-[120px] rounded-full translate-x-1/2 -translate-y-1/2"></div>
        <div class="absolute bottom-0 left-0 size-[600px] bg-blue-500/10 blur-[100px] rounded-full -translate-x-1/2 translate-y-1/2"></div>
        
        <div class="relative z-10 max-w-xl text-center">
            <div class="inline-flex items-center gap-2 px-4 py-2 rounded-full bg-white/5 border border-white/10 text-[10px] font-black uppercase tracking-[0.3em] text-primary mb-12 animate-fade-in">
                Join the Network
            </div>
            
            <h2 class="text-6xl font-black text-white leading-none tracking-tight mb-8">
                Start shipping <span class="text-primary italic">smarter</span> today.
            </h2>
            
            <p class="text-lg text-slate-400 font-medium leading-relaxed mb-12">
                Join thousands of companies optimizing their logistics with our advanced platform.
            </p>

            <div class="grid grid-cols-2 gap-6">
                <div class="p-6 rounded-2xl bg-white/5 border border-white/10 text-left group hover:bg-white/10 transition-colors cursor-default">
                    <span class="material-symbols-outlined text-3xl text-primary mb-3">rocket_launch</span>
                    <p class="text-lg font-black text-white mb-1">Fast Setup</p>
                    <p class="text-[10px] font-black text-slate-500 uppercase tracking-widest leading-tight">Ready in minutes</p>
                </div>
                <div class="p-6 rounded-2xl bg-white/5 border border-white/10 text-left group hover:bg-white/10 transition-colors cursor-default">
                    <span class="material-symbols-outlined text-3xl text-primary mb-3">workspace_premium</span>
                    <p class="text-lg font-black text-white mb-1">Premium Tier</p>
                    <p class="text-[10px] font-black text-slate-500 uppercase tracking-widest leading-tight">14-Day Free Trial</p>
                </div>
            </div>
        </div>
    </div>

    <!-- Signup Form Side -->
    <div class="flex-1 flex flex-col justify-center p-8 sm:p-20 relative bg-white">
        <div class="max-w-md w-full mx-auto">
            <a href="{base}/" class="flex items-center gap-2.5 mb-12 group inline-flex">
                <div class="size-10 text-primary flex items-center justify-center bg-slate-50 rounded-xl border border-primary/5 transition-transform group-hover:scale-110">
                    <span class="material-symbols-outlined text-2xl font-black">deployed_code</span>
                </div>
                <span class="text-2xl font-black tracking-tight text-slate-900 font-display transition-colors">LogiTruck</span>
            </a>

            {#if verificationSent}
                <div class="bg-emerald-50 rounded-3xl p-8 border border-emerald-100 text-center animate-fade-in">
                    <div class="size-16 bg-emerald-100 text-emerald-600 rounded-full flex items-center justify-center mx-auto mb-6">
                         <span class="material-symbols-outlined text-3xl">mark_email_read</span>
                    </div>
                    <h2 class="text-2xl font-black text-slate-900 mb-2">Check your email</h2>
                    <p class="text-slate-500 font-medium mb-8">
                        We've sent a verification link to <span class="text-slate-900 font-bold">{email}</span>. Please click the link to activate your account.
                    </p>
                    <a href="{base}/login" class="inline-flex py-3 px-6 rounded-xl bg-slate-900 text-white font-bold text-sm hover:scale-105 transition-transform">
                        Back to Sign In
                    </a>
                </div>
            {:else}
                <div class="mb-10">
                    <h1 class="text-4xl font-black text-slate-900 tracking-tight leading-none mb-4">Create Account</h1>
                    <p class="text-slate-500 font-medium text-lg">Enter your details to get started.</p>
                </div>

                <div class="space-y-6">
                    <!-- Google Sign Up Button -->
                    <button onclick={handleGoogleSignup} disabled={isGoogleLoading || isLoading} class="w-full h-[60px] rounded-2xl border border-slate-200 bg-white hover:bg-slate-50 text-slate-700 font-bold text-sm flex items-center justify-center gap-3 transition-all micro-interaction group disabled:opacity-50">
                        {#if isGoogleLoading}
                        <span class="size-4 border-2 border-slate-300 border-t-slate-600 rounded-full animate-spin"></span>
                        {:else}
                        <svg class="w-5 h-5 group-hover:scale-110 transition-transform" viewBox="0 0 24 24">
                            <path d="M22.56 12.25c0-.78-.07-1.53-.2-2.25H12v4.26h5.92c-.26 1.37-1.04 2.53-2.21 3.31v2.77h3.57c2.08-1.92 3.28-4.74 3.28-8.09z" fill="#4285F4"/>
                            <path d="M12 23c2.97 0 5.46-.98 7.28-2.66l-3.57-2.77c-.98.66-2.23 1.06-3.71 1.06-2.86 0-5.29-1.93-6.16-4.53H2.18v2.84C3.99 20.53 7.7 23 12 23z" fill="#34A853"/>
                            <path d="M5.84 14.09c-.22-.66-.35-1.36-.35-2.09s.13-1.43.35-2.09V7.07H2.18C1.43 8.55 1 10.22 1 12s.43 3.45 1.18 4.93l2.85-2.22.81-.62z" fill="#FBBC05"/>
                            <path d="M12 5.38c1.62 0 3.06.56 4.21 1.64l3.15-3.15C17.45 2.09 14.97 1 12 1 7.7 1 3.99 3.47 2.18 7.07l3.66 2.84c.87-2.6 3.3-4.53 6.16-4.53z" fill="#EA4335"/>
                        </svg>
                        Sign up with Google
                        {/if}
                    </button>

                    <div class="relative">
                        <div class="absolute inset-0 flex items-center">
                            <div class="w-full border-t border-slate-200"></div>
                        </div>
                        <div class="relative flex justify-center text-xs uppercase">
                            <span class="bg-white px-4 text-slate-400 font-bold tracking-widest">Or continue with email</span>
                        </div>
                    </div>

                    <form class="space-y-5" onsubmit={handleSignup}>
                        {#if error}
                            <div class="p-4 bg-red-50 border border-red-100 rounded-xl text-red-600 text-xs font-black uppercase tracking-wider animate-shake">
                                {error}
                            </div>
                        {/if}

                        <div class="space-y-4 mb-6">
                    <span class="text-[10px] font-black uppercase tracking-[0.2em] text-slate-400 ml-1">Account Type</span>
                    <div class="grid grid-cols-2 gap-4 p-1 bg-slate-50 rounded-2xl border border-slate-100">
                        <button type="button" onclick={() => role = 'client'} class="py-3 rounded-xl text-sm font-bold transition-all {role === 'client' ? 'bg-white text-slate-900 shadow-md ring-1 ring-black/5' : 'text-slate-400 hover:text-slate-600'}">
                            Client
                        </button>
                        <button type="button" onclick={() => role = 'driver'} class="py-3 rounded-xl text-sm font-bold transition-all {role === 'driver' ? 'bg-white text-slate-900 shadow-md ring-1 ring-black/5' : 'text-slate-400 hover:text-slate-600'}">
                            Driver
                        </button>
                    </div>
                </div>

                        <div class="space-y-2">
                            <span class="text-[10px] font-black uppercase tracking-[0.2em] text-slate-400 ml-1">Full Name</span>
                            <div class="relative group">
                                <span class="absolute left-5 top-1/2 -translate-y-1/2 material-symbols-outlined text-slate-300 group-focus-within:text-primary transition-colors">person</span>
                                <input bind:value={name} type="text" placeholder="John Doe" required class="w-full pl-14 pr-6 py-4 rounded-2xl bg-slate-50 border-none text-sm font-bold focus:bg-white focus:ring-2 focus:ring-primary/20 transition-all shadow-inner" />
                            </div>
                        </div>

                        <div class="space-y-2">
                            <span class="text-[10px] font-black uppercase tracking-[0.2em] text-slate-400 ml-1">Email Address</span>
                            <div class="relative group">
                                <span class="absolute left-5 top-1/2 -translate-y-1/2 material-symbols-outlined text-slate-300 group-focus-within:text-primary transition-colors">mail</span>
                                <input bind:value={email} type="email" placeholder="name@example.com" required class="w-full pl-14 pr-6 py-4 rounded-2xl bg-slate-50 border-none text-sm font-bold focus:bg-white focus:ring-2 focus:ring-primary/20 transition-all shadow-inner" />
                            </div>
                        </div>

                        <div class="space-y-2">
                            <span class="text-[10px] font-black uppercase tracking-[0.2em] text-slate-400 ml-1">Password</span>
                            <div class="relative group">
                                <span class="absolute left-5 top-1/2 -translate-y-1/2 material-symbols-outlined text-slate-300 group-focus-within:text-primary transition-colors">lock</span>
                                <input bind:value={password} type="password" placeholder="••••••••••••" required class="w-full pl-14 pr-6 py-4 rounded-2xl bg-slate-50 border-none text-sm font-bold focus:bg-white focus:ring-2 focus:ring-primary/20 transition-all shadow-inner" />
                            </div>
                        </div>

                        <div class="space-y-2">
                            <span class="text-[10px] font-black uppercase tracking-[0.2em] text-slate-400 ml-1">Confirm Password</span>
                            <div class="relative group">
                                <span class="absolute left-5 top-1/2 -translate-y-1/2 material-symbols-outlined text-slate-300 group-focus-within:text-primary transition-colors">verified_user</span>
                                <input bind:value={confirmPassword} type="password" placeholder="••••••••••••" required class="w-full pl-14 pr-6 py-4 rounded-2xl bg-slate-50 border-none text-sm font-bold focus:bg-white focus:ring-2 focus:ring-primary/20 transition-all shadow-inner {password && confirmPassword && password !== confirmPassword ? 'ring-2 ring-red-500/50 bg-red-50' : ''}" />
                            </div>
                            {#if password && confirmPassword && password !== confirmPassword}
                                <p class="text-[10px] font-black uppercase tracking-wider text-red-500 ml-1 animate-fade-in flex items-center gap-1">
                                    <span class="material-symbols-outlined text-[10px]">error</span>
                                    Passwords do not match
                                </p>
                            {/if}
                        </div>

                        <div class="flex items-center gap-3 px-1 pt-2">
                            <input type="checkbox" id="terms" required class="size-4 rounded border-slate-300 text-primary focus:ring-primary" />
                            <label for="terms" class="text-xs font-bold text-slate-500 cursor-pointer">I agree to the <a href="{base}/terms" class="text-primary hover:underline">Terms & Conditions</a></label>
                        </div>

                        <button type="submit" disabled={isLoading || isGoogleLoading} class="moving-border w-full h-[60px] rounded-2xl shadow-2xl shadow-primary/20 micro-interaction mt-4 disabled:opacity-50">
                            <div class="moving-border-content gap-3 !bg-primary !text-white font-black text-sm">
                                {#if isLoading}
                                    <span class="size-4 border-2 border-white/20 border-t-white rounded-full animate-spin"></span>
                                    CREATING ACCOUNT...
                                {:else}
                                    Create Account
                                {/if}
                            </div>
                        </button>
                    </form>
                </div>
            {/if}

            <div class="mt-10 pt-8 border-t border-slate-100">
                <p class="text-center text-xs font-black text-slate-400 uppercase tracking-widest">
                    Already have an account? <a href="{base}/login" class="text-primary hover:underline">Sign in</a>
                </p>
            </div>
        </div>
    </div>
</div>
