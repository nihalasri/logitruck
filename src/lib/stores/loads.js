import { writable } from 'svelte/store';
import { supabase } from '$lib/supabase';

export const loadsStore = writable([]);

const loadLoads = async () => {
    try {
        const response = await fetch('/api/loads');
        
        if (!response.ok) {
            throw new Error(`Error loading loads: ${response.statusText}`);
        }
        
        const data = await response.json();
        loadsStore.set(data);
    } catch (error) {
        console.error('Error loading loads:', error);
    }
};

// Initial load
if (typeof window !== 'undefined') {
    loadLoads();

    // Subscribe to changes
    supabase
        .channel('loads')
        .on('postgres_changes', { event: '*', schema: 'public', table: 'loads' }, payload => {
            console.log('Change received!', payload);
            loadLoads(); // Reload or handle granular updates
        })
        .subscribe();
}
