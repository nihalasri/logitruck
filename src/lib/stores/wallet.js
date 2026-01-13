import { writable } from 'svelte/store';

export const walletBalance = writable(2450.00);

export const formatCurrency = (value) => {
    return new Intl.NumberFormat('en-US', { style: 'currency', currency: 'USD' }).format(value);
};
