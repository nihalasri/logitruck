<script>
  import '../../layout.css';
  import ClientSidebar from '$lib/components/ClientSidebar.svelte';
</script>

<div class="bg-background-light dark:bg-background-dark text-slate-900 dark:text-white font-display antialiased flex h-screen overflow-hidden">
    <ClientSidebar activePage="settings" />

    <main class="flex-1 flex flex-col overflow-hidden">
        <header class="h-16 border-b border-slate-200 dark:border-slate-800 flex items-center px-8 bg-white dark:bg-background-dark">
            <h2 class="text-xl font-bold">Settings</h2>
        </header>

        <div class="flex-1 overflow-y-auto p-8 max-w-2xl">
            <div class="space-y-8">
                <section>
                    <h3 class="text-lg font-bold mb-4">Profile Information</h3>
                    <div class="grid grid-cols-1 gap-4">
                        <label class="block">
                            <span class="text-sm font-medium text-slate-500">Company Name</span>
                            <input type="text" value="Logistics Inc." class="mt-1 block w-full rounded-lg border border-slate-200 dark:border-slate-800 bg-white dark:bg-background-dark px-4 py-2 focus:ring-2 focus:ring-primary outline-none" />
                        </label>
                        <label class="block">
                            <span class="text-sm font-medium text-slate-500">Email Address</span>
                            <input type="email" value="demo@example.com" class="mt-1 block w-full rounded-lg border border-slate-200 dark:border-slate-800 bg-white dark:bg-background-dark px-4 py-2 focus:ring-2 focus:ring-primary outline-none" />
                        </label>
                    </div>
                </section>

                <section>
                    <h3 class="text-lg font-bold mb-4">Security</h3>
                    <button class="bg-primary text-white px-4 py-2 rounded-lg font-bold text-sm">Change Password</button>
                </section>

                <section class="pt-8 border-t border-slate-200 dark:border-slate-800">
                    <button class="bg-red-500 text-white px-4 py-2 rounded-lg font-bold text-sm">Delete Account</button>
                </section>
            </div>
        </div>
    </main>
</div>
