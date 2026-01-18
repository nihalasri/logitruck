<script>
    import { onMount } from 'svelte';
    import { supabase } from '$lib/supabase';

    import { fade, fly } from 'svelte/transition';

    let notifications = $state([]);
    let isLoading = $state(true);

    onMount(async () => {
        await fetchNotifications();
    });

    async function fetchNotifications() {
        try {
            const { data: { user } } = await supabase.auth.getUser();
            if (!user) return;

            const { data, error } = await supabase
                .from('notifications')
                .select('*')
                .eq('user_id', user.id)
                .order('created_at', { ascending: false });

            if (error) throw error;
            notifications = data || [];
        } catch (error) {
            console.error('Error fetching notifications:', error);
        } finally {
            isLoading = false;
        }
    }

    async function markAsRead(id) {
        try {
            const { error } = await supabase
                .from('notifications')
                .update({ is_read: true })
                .eq('id', id);

            if (!error) {
                notifications = notifications.map(n => n.id === id ? { ...n, is_read: true } : n);
            }
        } catch (err) {
            console.error('Error marking as read:', err);
        }
    }

    async function deleteNotification(id) {
         try {
            const { error } = await supabase
                .from('notifications')
                .delete()
                .eq('id', id);

            if (!error) {
                notifications = notifications.filter(n => n.id !== id);
            }
        } catch (err) {
            console.error('Error deleting notification:', err);
        }
    }

    function getIcon(type) {
        switch (type) {
            case 'success': return 'check_circle';
            case 'warning': return 'warning';
            case 'error': return 'error';
            default: return 'notifications';
        }
    }

    function getColor(type) {
        switch (type) {
            case 'success': return 'text-emerald-500 bg-emerald-500/10';
            case 'warning': return 'text-amber-500 bg-amber-500/10';
            case 'error': return 'text-red-500 bg-red-500/10';
            default: return 'text-blue-500 bg-blue-500/10';
        }
    }
</script>

    <main class="flex-1 flex flex-col h-full overflow-hidden relative">
        <!-- Header -->
        <header class="flex items-center justify-between glass border-b border-slate-200 px-8 py-5 h-20 shrink-0 z-20">
             <div class="flex items-center gap-4 lg:hidden">
                <a href="/" class="text-xl font-black tracking-tight ml-12 text-slate-900">LogiTruck</a>
            </div>
            <div class="hidden lg:block">
                <h1 class="text-xl font-black tracking-tight text-slate-900">Notifications</h1>
            </div>
             <div class="flex items-center gap-6">
                <button class="relative p-2.5 rounded-xl text-primary bg-primary/5 hover:bg-primary/10 transition-all micro-interaction">
                    <span class="material-symbols-outlined text-[22px]">notifications</span>
                    {#if notifications.some(n => !n.is_read)}
                        <span class="absolute top-2.5 right-2.5 h-2 w-2 rounded-full bg-red-500 ring-2 ring-white"></span>
                    {/if}
                </button>
            </div>
        </header>

        <div class="flex-1 overflow-y-auto p-8 bg-[radial-gradient(40%_40%_at_50%_0%,rgba(29,78,216,0.03)_0%,transparent_100%)]">
            <div class="max-w-3xl mx-auto space-y-6">
                
                {#if isLoading}
                    <div class="flex flex-col items-center justify-center py-20">
                         <div class="size-10 border-4 border-slate-200 border-t-primary rounded-full animate-spin mb-4"></div>
                         <p class="text-slate-500 font-bold text-sm">Loading notifications...</p>
                    </div>
                {:else if notifications.length === 0}
                    <div class="text-center py-20 opacity-50">
                        <span class="material-symbols-outlined text-6xl text-slate-300 mb-4">notifications_off</span>
                        <h3 class="text-xl font-black text-slate-900">All caught up!</h3>
                        <p class="text-slate-500 font-medium">You have no new notifications.</p>
                    </div>
                {:else}
                    {#each notifications as note (note.id)}
                        <div 
                            in:fly={{ y: 20, duration: 300 }}
                            out:fade
                            class="group relative p-6 rounded-2xl border transition-all duration-300 {note.is_read ? 'bg-white border-slate-100' : 'bg-white border-primary/20 shadow-lg shadow-primary/5'}"
                        >
                            <div class="flex items-start gap-4">
                                <div class="size-12 rounded-xl flex items-center justify-center shrink-0 {getColor(note.type)}">
                                    <span class="material-symbols-outlined text-2xl">{getIcon(note.type)}</span>
                                </div>
                                <div class="flex-1 min-w-0 pt-1">
                                    <div class="flex items-start justify-between gap-4 mb-1">
                                        <h3 class="text-base font-black text-slate-900 leading-tight {note.is_read ? '' : 'text-primary'}">
                                            {note.title}
                                            {#if !note.is_read}
                                                <span class="ml-2 inline-block size-2 rounded-full bg-primary align-middle"></span>
                                            {/if}
                                        </h3>
                                        <span class="text-[10px] font-bold text-slate-400 whitespace-nowrap">
                                            {new Date(note.created_at).toLocaleDateString()} • {new Date(note.created_at).toLocaleTimeString([], {hour: '2-digit', minute:'2-digit'})}
                                        </span>
                                    </div>
                                    <p class="text-slate-500 text-sm font-medium leading-relaxed">{note.message}</p>
                                </div>
                                <div class="flex flex-col gap-2 opacity-0 group-hover:opacity-100 transition-opacity">
                                    {#if !note.is_read}
                                        <button onclick={() => markAsRead(note.id)} class="text-xs font-bold text-primary hover:underline" title="Mark as read">
                                            read
                                        </button>
                                    {/if}
                                    <button onclick={() => deleteNotification(note.id)} class="text-slate-400 hover:text-red-500 transition-colors" title="Delete">
                                        <span class="material-symbols-outlined text-lg">delete</span>
                                    </button>
                                </div>
                            </div>
                        </div>
                    {/each}
                {/if}

            </div>
        </div>
    </main>

