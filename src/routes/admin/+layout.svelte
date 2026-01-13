<script>
    import AdminSidebar from '$lib/components/AdminSidebar.svelte';
    let { children } = $props();
</script>

<div class="min-h-screen bg-slate-50 flex">
    <AdminSidebar />
    <div class="pl-64 flex-1 min-h-screen w-full">
        {@render children()}
    </div>
</div>
