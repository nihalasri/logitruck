<script>
    import Navbar from '$lib/components/Navbar.svelte';
    import Footer from '$lib/components/Footer.svelte';
</script>

<div class="font-display antialiased text-slate-900 bg-bg-main min-h-screen flex flex-col selection:bg-primary/10">
    <Navbar />

    <main class="flex-grow pt-24 pb-20">
        <section class="max-w-4xl mx-auto px-6 lg:px-8 mt-12">
            <h1 class="text-4xl font-black text-slate-900 mb-8">Account Recovery</h1>
            <p class="text-slate-500 mb-8">Enter your email to receive recovery instructions.</p>
            
            <form class="max-w-md space-y-4">
                <input type="email" placeholder="Enter your email" class="w-full px-5 py-4 rounded-2xl bg-white border border-slate-200 text-sm font-bold focus:ring-2 focus:ring-primary/20 transition-all" />
                <button class="w-full py-4 bg-primary text-white rounded-2xl font-black shadow-lg shadow-primary/20">Send Recovery Link</button>
            </form>
        </section>
    </main>

    <Footer />
</div>
