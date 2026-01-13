import { json } from '@sveltejs/kit';
import { supabase } from '$lib/supabase';

// GET /api/loads - Fetch all loads
export async function GET() {
    const { data, error } = await supabase
        .from('loads')
        .select('*')
        .order('created_at', { ascending: false });

    if (error) {
        return json({ error: error.message }, { status: 500 });
    }

    return json(data);
}

// POST /api/loads - Create a new load
export async function POST({ request }) {
    const body = await request.json();
    const { data, error } = await supabase
        .from('loads')
        .insert(body)
        .select();

    if (error) {
        return json({ error: error.message }, { status: 500 });
    }

    return json(data, { status: 201 });
}
