<script>
    import Navbar from '$lib/components/Navbar.svelte';
    import Footer from '$lib/components/Footer.svelte';

    let name = $state('');
    let email = $state('');
    let message = $state('');
    let isSent = $state(false);

    function handleSubmit(e) {
        e.preventDefault();
        // Simulation
        isSent = true;
        setTimeout(() => isSent = false, 5000);
    }
</script>

<div class="font-display antialiased text-slate-900 dark:text-white bg-background-light dark:bg-background-dark min-h-screen flex flex-col">
    <Navbar />

    <main class="flex-grow">
        <div class="py-24 mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">
            <div class="grid grid-cols-1 lg:grid-cols-2 gap-16">
                <!-- Contact Info -->
                <div>
                    <h1 class="text-4xl font-black mb-6">Get in Touch</h1>
                    <p class="text-lg text-slate-600 dark:text-slate-400 mb-12">
                        Have a question? We are here to help. Send us a message and we will reply quickly.
                    </p>

                    <div class="space-y-8">
                        <div class="flex items-start gap-4">
                            <div class="size-10 rounded-lg bg-primary/10 text-primary flex items-center justify-center shrink-0">
                                <span class="material-symbols-outlined">mail</span>
                            </div>
                            <div>
                                <p class="font-bold">Email Us</p>
                                <p class="text-slate-600 dark:text-slate-400">support@logisticspro.com</p>
                            </div>
                        </div>

                        <div class="flex items-start gap-4">
                            <div class="size-10 rounded-lg bg-primary/10 text-primary flex items-center justify-center shrink-0">
                                <span class="material-symbols-outlined">call</span>
                            </div>
                            <div>
                                <p class="font-bold">Call Us</p>
                                <p class="text-slate-600 dark:text-slate-400">+1 234 567 890</p>
                            </div>
                        </div>

                        <div class="flex items-start gap-4">
                            <div class="size-10 rounded-lg bg-primary/10 text-primary flex items-center justify-center shrink-0">
                                <span class="material-symbols-outlined">location_on</span>
                            </div>
                            <div>
                                <p class="font-bold">Our Office</p>
                                <p class="text-slate-600 dark:text-slate-400">123 Logistics Way, City Name, Country</p>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Contact Form -->
                <div class="bg-white dark:bg-slate-900/50 p-8 rounded-2xl border border-slate-200 dark:border-slate-800 shadow-xl shadow-slate-200/50 dark:shadow-none">
                    {#if isSent}
                        <div class="h-full flex flex-col items-center justify-center text-center py-12">
                            <div class="size-16 rounded-full bg-emerald-100 dark:bg-emerald-900/30 text-emerald-600 flex items-center justify-center mb-6">
                                <span class="material-symbols-outlined text-4xl">check_circle</span>
                            </div>
                            <h3 class="text-2xl font-bold mb-2">Message Sent!</h3>
                            <p class="text-slate-600 dark:text-slate-400">Thank you for writing to us. We will get back to you soon.</p>
                        </div>
                    {:else}
                        <form onsubmit={handleSubmit} class="space-y-6">
                            <div>
                                <label for="name" class="block text-sm font-bold mb-2">Your Name</label>
                                <input id="name" type="text" bind:value={name} required placeholder="John Doe" class="w-full h-12 px-4 rounded-lg border border-slate-200 dark:border-slate-700 bg-slate-50 dark:bg-background-dark focus:ring-2 focus:ring-primary outline-none transition-all" />
                            </div>

                            <div>
                                <label for="email" class="block text-sm font-bold mb-2">Your Email</label>
                                <input id="email" type="email" bind:value={email} required placeholder="john@example.com" class="w-full h-12 px-4 rounded-lg border border-slate-200 dark:border-slate-700 bg-slate-50 dark:bg-background-dark focus:ring-2 focus:ring-primary outline-none transition-all" />
                            </div>

                            <div>
                                <label for="message" class="block text-sm font-bold mb-2">How can we help?</label>
                                <textarea id="message" bind:value={message} required rows="4" placeholder="Write your message here..." class="w-full p-4 rounded-lg border border-slate-200 dark:border-slate-700 bg-slate-50 dark:bg-background-dark focus:ring-2 focus:ring-primary outline-none transition-all resize-none"></textarea>
                            </div>

                            <button type="submit" class="w-full h-12 bg-primary text-white font-bold rounded-lg shadow-lg shadow-primary/20 hover:bg-blue-600 transition-all">
                                Send Message
                            </button>
                        </form>
                    {/if}
                </div>
            </div>
        </div>
    </main>

    <Footer />
</div>
