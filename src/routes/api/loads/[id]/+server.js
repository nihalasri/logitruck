import { json } from '@sveltejs/kit';
import { supabase } from '$lib/supabase';

// PATCH /api/loads/[id] - Update a load
export async function PATCH({ params, request }) {
    const { id } = params;
    const body = await request.json();

    const { data, error } = await supabase
        .from('loads')
        .update(body)
        .eq('id', id)
        .select();

    if (error) {
        return json({ error: error.message }, { status: 500 });
    }

    return json(data);
}

// DELETE /api/loads/[id] - Delete a load
export async function DELETE({ params }) {
    const { id } = params;

    const { error } = await supabase
        .from('loads')
        .delete()
        .eq('id', id);

    if (error) {
        return json({ error: error.message }, { status: 500 });
    }

    return json({ message: 'Load deleted successfully' });
}
