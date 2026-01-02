<script>
	import '../layout.css';
	import { goto } from '$app/navigation';

	let email = $state('');
	let password = $state('');
	let error = $state('');
	let isLoading = $state(false);

	function handleLogin(e) {
		e.preventDefault();
		error = '';
		isLoading = true;

		// Simulated login delay
		setTimeout(() => {
			if (email === 'demo@example.com' && password === 'demo123') {
				goto('/client/dashboard');
			} else {
				error = 'Invalid credentials. Try demo@example.com / demo123';
				isLoading = false;
			}
		}, 800);
	}
</script>

<div class="font-display antialiased text-slate-900 dark:text-white bg-background-light dark:bg-background-dark h-screen overflow-hidden">
<div class="flex h-full w-full">
<!-- Left Side: Visual / Branding -->
<div class="hidden lg:flex w-1/2 relative bg-slate-900 items-center justify-center overflow-hidden">
<!-- Background Image -->
<div class="absolute inset-0 bg-cover bg-center opacity-60 mix-blend-overlay" data-alt="Modern truck driving on a highway at night with light trails" style="background-image: url('https://lh3.googleusercontent.com/aida-public/AB6AXuBF6lWE2DG2l7zIbV0SoB6BxXHRzuU3H3jRBex5s6nS_GNdiS2LmDy_T22KbZmPAoaiemWislvRmgfjmDCZMsUXtfUZO7iMTgDP_8WCdxqXdAbeZaEcuYj-GfsyK-96Rn4wUJWvFqmbJdRSbvqX73KPzRBPBcEeLbyBwFRwZw7tBfPxiisyXnBwtCTeRA4i7ViB2Z6liM_tiaXu8wKSFV-Dcun8FEF5uR_JKHZhE_d-1D2CINkjAJ2fNRJZCLjVH872trvh3mynmlc');">
</div>
<!-- Overlay Gradient -->
<div class="absolute inset-0 bg-gradient-to-t from-[#101622] via-[#101622]/40 to-primary/20"></div>
<div class="relative z-10 max-w-lg px-10 text-center">
<div class="mb-8 flex justify-center">
<div class="flex h-16 w-16 items-center justify-center rounded-2xl bg-primary/20 text-primary backdrop-blur-sm border border-primary/30">
<span class="material-symbols-outlined text-4xl">local_shipping</span>
</div>
</div>
<h2 class="text-4xl font-black leading-tight tracking-tight text-white mb-6">
                    Moving the world, <br/>
<span class="text-primary">one mile at a time.</span>
</h2>
<p class="text-lg text-slate-300 font-medium leading-relaxed">
                    Connect seamlessly with shippers and carriers. Manage your freight with real-time tracking and unmatched transparency.
                </p>
<div class="mt-12 flex items-center justify-center gap-4">
<div class="flex -space-x-4">
<img alt="User avatar" class="w-10 h-10 rounded-full border-2 border-[#101622]" data-alt="Portrait of a smiling male driver" src="https://lh3.googleusercontent.com/aida-public/AB6AXuD0tP1EtaOvsQCqWfqxEUzSxFzwPkP-glnbaqgNO3x9_MHZShuUHpTpg4o6aJK_XjpexZUI42RuT5zcz7kOtgm30MQ-6cgo--sgvinLJthbDKdmUh8HMW-ijaL8SS9pfHNedSdKpI4-_kURse2b6l3gXgLC4LrI3Kny57MV4ygwAEwGZ4yrBw77xsdbRQahxgVIGp2k3U-2ikN1SQdt2n73bZRWoNdaWlJ1-8lg4HWb8nOUO7LCfk5zGWC3tljAvOn3ur9tJoPpogY"/>
<img alt="User avatar" class="w-10 h-10 rounded-full border-2 border-[#101622]" data-alt="Portrait of a smiling female logistics manager" src="https://lh3.googleusercontent.com/aida-public/AB6AXuA75BlBtuW5cGrsV4EdVkPSlRWV0rdRL0qrRq47_GLRS8Ezrq5IoIPBOZCsIOrx5ILNDDL7u01GvKf5QkOIimCfZVRagm1nIRRAnDha-6lhBrnE29VtZIAlHbb2OCoNqNS7LnRVQwNcI-BRsZiFCtrTSEOZPet9Nd5bUDTuf750H8NCqVmzEGQDqdStJ32mDpbtrRIzR2LmuzxzRH_e8S7u-0DZRSGYDA7kxi-Gt9BLhddKn_ohpOwuczRPpAvnoEw6bHAwhSsVQ9k"/>
<img alt="User avatar" class="w-10 h-10 rounded-full border-2 border-[#101622]" data-alt="Portrait of a male warehouse supervisor" src="https://lh3.googleusercontent.com/aida-public/AB6AXuBlUxspPeEJ2h3HAzrK7aCixxKpkE3JYarZbudf1sNDHYDAcVA1XF8wkDafIHblFM9yDoLqVCXlVCghLQck8x1vIfr8lGMDZ4157UV3UOD2lBuaQx57ttT19KxWyGJXH3XwefloM8G0zWVJ3Tz-vf1JwOQ7Nh6NVftYBiQrDIKPh_ghHvMdL_17HazUkNbn3-tuiDYqwXahA3momyFAPj_-9PqEFApiXDXhdh5tENBewc8Kmp4_ctPVpLc5Bko0-K-zVjUNbxM5wn0"/>
</div>
<p class="text-sm font-semibold text-white">Trusted by 10,000+ professionals</p>
</div>
</div>
</div>
<!-- Right Side: Login Form -->
<div class="flex-1 flex flex-col h-full overflow-y-auto bg-background-light dark:bg-background-dark">
<!-- Mobile Header / Logo -->
<div class="p-6 lg:hidden">
<div class="flex items-center gap-3">
<div class="size-8 text-primary">
<svg fill="none" viewbox="0 0 48 48" xmlns="http://www.w3.org/2000/svg">
<path d="M13.8261 17.4264C16.7203 18.1174 20.2244 18.5217 24 18.5217C27.7756 18.5217 31.2797 18.1174 34.1739 17.4264C36.9144 16.7722 39.9967 15.2331 41.3563 14.1648L24.8486 40.6391C24.4571 41.267 23.5429 41.267 23.1514 40.6391L6.64374 14.1648C8.00331 15.2331 11.0856 16.7722 13.8261 17.4264Z" fill="currentColor"></path>
<path clip-rule="evenodd" d="M39.998 12.236C39.9944 12.2537 39.9875 12.2845 39.9748 12.3294C39.9436 12.4399 39.8949 12.5741 39.8346 12.7175C39.8168 12.7597 39.7989 12.8007 39.7813 12.8398C38.5103 13.7113 35.9788 14.9393 33.7095 15.4811C30.9875 16.131 27.6413 16.5217 24 16.5217C20.3587 16.5217 17.0125 16.131 14.2905 15.4811C12.0012 14.9346 9.44505 13.6897 8.18538 12.8168C8.17384 12.7925 8.16216 12.767 8.15052 12.7408C8.09919 12.6249 8.05721 12.5114 8.02977 12.411C8.00356 12.3152 8.00039 12.2667 8.00004 12.2612C8.00004 12.261 8 12.2607 8.00004 12.2612C8.00004 12.2359 8.0104 11.9233 8.68485 11.3686C9.34546 10.8254 10.4222 10.2469 11.9291 9.72276C14.9242 8.68098 19.1919 8 24 8C28.8081 8 33.0758 8.68098 36.0709 9.72276C37.5778 10.2469 38.6545 10.8254 39.3151 11.3686C39.9006 11.8501 39.9857 12.1489 39.998 12.236ZM4.95178 15.2312L21.4543 41.6973C22.6288 43.5809 25.3712 43.5809 26.5457 41.6973L43.0534 15.223C43.0709 15.1948 43.0878 15.1662 43.104 15.1371L41.3563 14.1648C43.104 15.1371 43.1038 15.1374 43.104 15.1371L43.1051 15.135L43.1065 15.1325L43.1101 15.1261L43.1199 15.1082C43.1276 15.094 43.1377 15.0754 43.1497 15.0527C43.1738 15.0075 43.2062 14.9455 43.244 14.8701C43.319 14.7208 43.4196 14.511 43.5217 14.2683C43.6901 13.8679 44 13.0689 44 12.2609C44 10.5573 43.003 9.22254 41.8558 8.2791C40.6947 7.32427 39.1354 6.55361 37.385 5.94477C33.8654 4.72057 29.133 4 24 4C18.867 4 14.1346 4.72057 10.615 5.94478C8.86463 6.55361 7.30529 7.32428 6.14419 8.27911C4.99695 9.22255 3.99999 10.5573 3.99999 12.2609C3.99999 13.1275 4.29264 13.9078 4.49321 14.3607C4.60375 14.6102 4.71348 14.8196 4.79687 14.9689C4.83898 15.0444 4.87547 15.1065 4.9035 15.1529C4.91754 15.1762 4.92954 15.1957 4.93916 15.2111L4.94662 15.223L4.95178 15.2312ZM35.9868 18.996L24 38.22L12.0131 18.996C12.4661 19.1391 12.9179 19.2658 13.3617 19.3718C16.4281 20.1039 20.0901 20.5217 24 20.5217C27.9099 20.5217 31.5719 20.1039 34.6383 19.3718C35.082 19.2658 35.5339 19.1391 35.9868 18.996Z" fill="currentColor" fill-rule="evenodd"></path>
</svg>
</div>
<span class="text-xl font-bold tracking-tight text-slate-900 dark:text-white">LogisticsPro</span>
</div>
</div>
<div class="flex flex-1 flex-col justify-center px-4 py-8 sm:px-12 xl:px-24">
<div class="mx-auto w-full max-w-[440px] flex flex-col gap-6">
<!-- Desktop Logo -->
<div class="hidden lg:flex items-center gap-3 mb-4 text-slate-900 dark:text-white">
<div class="size-9 text-primary">
<svg fill="none" viewbox="0 0 48 48" xmlns="http://www.w3.org/2000/svg">
<path d="M13.8261 17.4264C16.7203 18.1174 20.2244 18.5217 24 18.5217C27.7756 18.5217 31.2797 18.1174 34.1739 17.4264C36.9144 16.7722 39.9967 15.2331 41.3563 14.1648L24.8486 40.6391C24.4571 41.267 23.5429 41.267 23.1514 40.6391L6.64374 14.1648C8.00331 15.2331 11.0856 16.7722 13.8261 17.4264Z" fill="currentColor"></path>
<path clip-rule="evenodd" d="M39.998 12.236C39.9944 12.2537 39.9875 12.2845 39.9748 12.3294C39.9436 12.4399 39.8949 12.5741 39.8346 12.7175C39.8168 12.7597 39.7989 12.8007 39.7813 12.8398C38.5103 13.7113 35.9788 14.9393 33.7095 15.4811C30.9875 16.131 27.6413 16.5217 24 16.5217C20.3587 16.5217 17.0125 16.131 14.2905 15.4811C12.0012 14.9346 9.44505 13.6897 8.18538 12.8168C8.17384 12.7925 8.16216 12.767 8.15052 12.7408C8.09919 12.6249 8.05721 12.5114 8.02977 12.411C8.00356 12.3152 8.00039 12.2667 8.00004 12.2612C8.00004 12.261 8 12.2607 8.00004 12.2612C8.00004 12.2359 8.0104 11.9233 8.68485 11.3686C9.34546 10.8254 10.4222 10.2469 11.9291 9.72276C14.9242 8.68098 19.1919 8 24 8C28.8081 8 33.0758 8.68098 36.0709 9.72276C37.5778 10.2469 38.6545 10.8254 39.3151 11.3686C39.9006 11.8501 39.9857 12.1489 39.998 12.236ZM4.95178 15.2312L21.4543 41.6973C22.6288 43.5809 25.3712 43.5809 26.5457 41.6973L43.0534 15.223C43.0709 15.1948 43.0878 15.1662 43.104 15.1371L41.3563 14.1648C43.104 15.1371 43.1038 15.1374 43.104 15.1371L43.1051 15.135L43.1065 15.1325L43.1101 15.1261L43.1199 15.1082C43.1276 15.094 43.1377 15.0754 43.1497 15.0527C43.1738 15.0075 43.2062 14.9455 43.244 14.8701C43.319 14.7208 43.4196 14.511 43.5217 14.2683C43.6901 13.8679 44 13.0689 44 12.2609C44 10.5573 43.003 9.22254 41.8558 8.2791C40.6947 7.32427 39.1354 6.55361 37.385 5.94477C33.8654 4.72057 29.133 4 24 4C18.867 4 14.1346 4.72057 10.615 5.94478C8.86463 6.55361 7.30529 7.32428 6.14419 8.27911C4.99695 9.22255 3.99999 10.5573 3.99999 12.2609C3.99999 13.1275 4.29264 13.9078 4.49321 14.3607C4.60375 14.6102 4.71348 14.8196 4.79687 14.9689C4.83898 15.0444 4.87547 15.1065 4.9035 15.1529C4.91754 15.1762 4.92954 15.1957 4.93916 15.2111L4.94662 15.223L4.95178 15.2312ZM35.9868 18.996L24 38.22L12.0131 18.996C12.4661 19.1391 12.9179 19.2658 13.3617 19.3718C16.4281 20.1039 20.0901 20.5217 24 20.5217C27.9099 20.5217 31.5719 20.1039 34.6383 19.3718C35.082 19.2658 35.5339 19.1391 35.9868 18.996Z" fill="currentColor" fill-rule="evenodd"></path>
</svg>
</div>
<span class="text-xl font-bold tracking-tight text-slate-900 dark:text-white">LogisticsPro</span>
</div>
<!-- Header -->
<div class="mb-2">
<h1 class="text-3xl font-bold leading-tight tracking-tight text-slate-900 dark:text-white">Welcome back</h1>
<p class="mt-2 text-base text-slate-600 dark:text-slate-400">Please enter your details to sign in.</p>
</div>

<!-- Help Text for Demo -->
<div class="mb-6 rounded-lg bg-blue-50 dark:bg-blue-900/20 p-4 border border-blue-100 dark:border-blue-900/30 text-center">
    <p class="text-xs text-blue-700 dark:text-blue-300 font-medium">
        Demo: <span class="font-bold">demo@example.com</span> / <span class="font-bold">demo123</span>
    </p>
</div>

<!-- Form -->
<form class="flex flex-col gap-5" onsubmit={handleLogin}>
    {#if error}
        <div class="p-3 text-sm text-red-600 bg-red-50 dark:bg-red-900/20 dark:text-red-400 rounded-lg border border-red-200 dark:border-red-900/30 animate-pulse">
            {error}
        </div>
    {/if}

<!-- Email Input -->
<label class="flex flex-col w-full">
<p class="text-slate-900 dark:text-white text-sm font-medium leading-normal pb-2">Email address</p>
<div class="relative">
<input bind:value={email} required class="form-input flex w-full min-w-0 flex-1 resize-none overflow-hidden rounded-lg text-slate-900 dark:text-white focus:outline-0 focus:ring-1 focus:ring-primary border border-slate-300 dark:border-[#324467] bg-white dark:bg-[#192233] focus:border-primary h-12 placeholder:text-slate-400 dark:placeholder:text-[#92a4c9] px-4 pl-11 text-base font-normal leading-normal transition-colors" placeholder="name@company.com" type="email"/>
<div class="absolute left-3 top-1/2 -translate-y-1/2 text-slate-400 dark:text-[#92a4c9]">
<span class="material-symbols-outlined text-[20px]">mail</span>
</div>
</div>
</label>
<!-- Password Input -->
<label class="flex flex-col w-full">
<p class="text-slate-900 dark:text-white text-sm font-medium leading-normal pb-2">Password</p>
<div class="flex w-full flex-1 items-stretch rounded-lg relative">
<input bind:value={password} required class="form-input flex w-full min-w-0 flex-1 resize-none overflow-hidden rounded-lg text-slate-900 dark:text-white focus:outline-0 focus:ring-1 focus:ring-primary border border-slate-300 dark:border-[#324467] bg-white dark:bg-[#192233] focus:border-primary h-12 placeholder:text-slate-400 dark:placeholder:text-[#92a4c9] px-4 pl-11 pr-11 text-base font-normal leading-normal transition-colors" placeholder="Enter your password" type="password"/>
<div class="absolute left-3 top-1/2 -translate-y-1/2 text-slate-400 dark:text-[#92a4c9]">
<span class="material-symbols-outlined text-[20px]">lock</span>
</div>
<button type="button" class="absolute right-0 top-0 bottom-0 px-3 text-slate-400 dark:text-[#92a4c9] hover:text-primary transition-colors flex items-center justify-center">
<span class="material-symbols-outlined text-[20px]">visibility</span>
</button>
</div>
</label>
<!-- Forgot Password Row -->
<div class="flex items-center justify-between">
<label class="flex items-center gap-2 cursor-pointer group">
<input class="rounded border-slate-300 dark:border-[#324467] bg-white dark:bg-[#192233] text-primary focus:ring-primary h-4 w-4" type="checkbox"/>
<span class="text-sm text-slate-600 dark:text-slate-400 group-hover:text-slate-900 dark:group-hover:text-white transition-colors">Remember me</span>
</label>
<a class="text-sm font-semibold text-primary hover:text-blue-400 transition-colors" href="#">Forgot password?</a>
</div>
<!-- Sign In Button -->
<button type="submit" disabled={isLoading} class="flex w-full cursor-pointer items-center justify-center overflow-hidden rounded-lg h-12 px-4 bg-primary hover:bg-blue-600 text-white text-base font-bold leading-normal tracking-[0.015em] transition-all shadow-lg shadow-primary/20 disabled:opacity-70 disabled:cursor-not-allowed">
    {#if isLoading}
        <span class="size-5 border-2 border-white/30 border-t-white rounded-full animate-spin mr-2"></span>
        <span>Signing in...</span>
    {:else}
        <span class="truncate">Sign In</span>
    {/if}
</button>
</form>
<!-- Divider -->
<div class="relative flex items-center py-2">
<div class="flex-grow border-t border-slate-200 dark:border-slate-800"></div>
<span class="flex-shrink-0 mx-4 text-xs font-medium text-slate-400 uppercase">Or continue with</span>
<div class="flex-grow border-t border-slate-200 dark:border-slate-800"></div>
</div>
<!-- Social Login (Optional Modern Touch) -->
<div class="grid grid-cols-2 gap-4">
<button type="button" class="flex h-10 items-center justify-center gap-2 rounded-lg border border-slate-200 dark:border-[#324467] bg-white dark:bg-[#192233] text-sm font-medium text-slate-700 dark:text-white hover:bg-slate-50 dark:hover:bg-[#232f48] transition-colors">
<img alt="Google Logo" class="h-5 w-5" data-alt="Google logo icon" src="https://lh3.googleusercontent.com/aida-public/AB6AXuDQqyRcwYXl9ky-FM9ZwQKUH56UoZoAy-MhGEQovdK9mn4jEHjYZEL-JY_gLzikHdX8VKH4f4bJqkPNaoTPVyavkypYf4PvO_oMujbTJo5aQ5kUTIQXEsLCG3iuTmI6DBpsRBucJuBbLx7aR8mImZc0HTw7OcuL2faEy_I1YnRPH-q0kOX9CwQGuaksvBQ0Cg49IeLD6bgpTFFfLq6y32RloREZ6WCR-BpndW1LBAwVg2PV1Ij1LiIL221NGmSGeHGrJBFHeGYHfH0"/>
<span>Google</span>
</button>
<button type="button" class="flex h-10 items-center justify-center gap-2 rounded-lg border border-slate-200 dark:border-[#324467] bg-white dark:bg-[#192233] text-sm font-medium text-slate-700 dark:text-white hover:bg-slate-50 dark:hover:bg-[#232f48] transition-colors">
<img alt="Microsoft Logo" class="h-5 w-5" data-alt="Microsoft logo icon" src="https://lh3.googleusercontent.com/aida-public/AB6AXuCzHBt6UFo5IM8nLSNVqcqh8CsOD5GQSNDOf81bKFj5ZDf2c0UFm2xST9Mhjw_M__nUy1UdU9pdUEtQPHWDeTzZhfpRNxYd4wj047yTkthdSUKKKkoxOxCAZ1OnpTW2V702LZ8xz8SAVhjJ6Zv79KwQMwr5ZMofJLa0XjI0etr4iaS27BQ0UmHzSjP9skBSi3RUXtsuEjiXTNAGVlV7eXt_JwdEjNWx-S8hiUl1zjcihZaMXHZS5cPGUsT9FMg2-75Ja77NZ4YaR7s"/>
<span>Microsoft</span>
</button>
</div>
</div>
<!-- Footer -->
<p class="text-center text-sm text-slate-600 dark:text-slate-400 mt-4">
                        Don't have an account? 
                        <a class="font-bold text-primary hover:text-blue-400 transition-colors" href="#">Sign up</a>
</p>
</div>
</div>
</div>
</div>
