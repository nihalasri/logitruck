<script>
    import Navbar from '$lib/components/Navbar.svelte';
    import Footer from '$lib/components/Footer.svelte';
</script>

<div class="font-display antialiased text-slate-900 bg-bg-main min-h-screen flex flex-col selection:bg-primary/10">
    <Navbar />

    <main class="flex-grow pt-24 pb-20">
        <section class="max-w-4xl mx-auto px-6 lg:px-8 mt-12">
            <h1 class="text-4xl font-black text-slate-900 mb-8">Legal Information</h1>
            <div class="prose prose-slate max-w-none">
                <p>This is a placeholder for legal terms, privacy policy, and security information.</p>
                <ul>
                    <li><a href="/legal/privacy" class="text-primary hover:underline">Privacy Policy</a></li>
                    <li><a href="/legal/security" class="text-primary hover:underline">Security Policy</a></li>
                </ul>
            </div>
        </section>
    </main>

    <Footer />
</div>
