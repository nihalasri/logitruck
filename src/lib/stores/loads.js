import { writable } from 'svelte/store';

const initialLoads = [
    { id: 'L-8942', route: 'Chicago, IL → Dallas, TX', cargo: 'Electronics', status: 'In Transit', date: 'Oct 24, 2026' },
    { id: 'L-8941', route: 'New York, NY → Boston, MA', cargo: 'Furniture', status: 'Delivered', date: 'Oct 20, 2026' },
    { id: 'L-8940', route: 'Atlanta, GA → Miami, FL', cargo: 'Produce', status: 'Pending', date: 'Oct 26, 2026' }
];

// Initialize from localStorage if available, otherwise use initialLoads
const storedLoads = typeof window !== 'undefined' ? JSON.parse(localStorage.getItem('loads')) : null;
export const loadsStore = writable(storedLoads || initialLoads);

// Subscribe to store changes to update localStorage
if (typeof window !== 'undefined') {
    loadsStore.subscribe(value => {
        localStorage.setItem('loads', JSON.stringify(value));
    });
}
