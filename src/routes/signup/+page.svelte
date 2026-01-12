<script>
	import { goto } from '$app/navigation';
    import { base } from '$app/paths';

	let name = $state('');
	let email = $state('');
	let password = $state('');
	let confirmPassword = $state('');
	let error = $state('');
	let isLoading = $state(false);

	function handleSignup(e) {
		e.preventDefault();
		error = '';
		
		if (password !== confirmPassword) {
			error = 'Passwords do not match';
			return;
		}

		isLoading = true;

		// Simulated signup delay
		setTimeout(() => {
			goto(`${base}/login`);
		}, 1000);
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

            <div class="mb-10">
                <h1 class="text-4xl font-black text-slate-900 tracking-tight leading-none mb-4">Create Account</h1>
                <p class="text-slate-500 font-medium text-lg">Enter your details to get started.</p>
            </div>

            <form class="space-y-5" onsubmit={handleSignup}>
                {#if error}
                    <div class="p-4 bg-red-50 border border-red-100 rounded-xl text-red-600 text-xs font-black uppercase tracking-wider animate-shake">
                        {error}
                    </div>
                {/if}

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
                        <input bind:value={confirmPassword} type="password" placeholder="••••••••••••" required class="w-full pl-14 pr-6 py-4 rounded-2xl bg-slate-50 border-none text-sm font-bold focus:bg-white focus:ring-2 focus:ring-primary/20 transition-all shadow-inner" />
                    </div>
                </div>

                <div class="flex items-center gap-3 px-1 pt-2">
                    <input type="checkbox" id="terms" required class="size-4 rounded border-slate-300 text-primary focus:ring-primary" />
                    <label for="terms" class="text-xs font-bold text-slate-500 cursor-pointer">I agree to the <a href="{base}/terms" class="text-primary hover:underline">Terms & Conditions</a></label>
                </div>

                <button type="submit" disabled={isLoading} class="moving-border w-full h-[60px] rounded-2xl shadow-2xl shadow-primary/20 micro-interaction mt-4 disabled:opacity-50">
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

            <div class="mt-10 pt-8 border-t border-slate-100">
                <p class="text-center text-xs font-black text-slate-400 uppercase tracking-widest">
                    Already have an account? <a href="{base}/login" class="text-primary hover:underline">Sign in</a>
                </p>
            </div>
        </div>
    </div>
</div>
