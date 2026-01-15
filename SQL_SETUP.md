# Supabase Database Setup

To fix the "Could not find the table" error, you need to create the `loads` table in your Supabase database.

1.  Go to your [Supabase Dashboard](https://supabase.com/dashboard).
2.  Open the **SQL Editor** (icon on the left sidebar).
3.  Click **New Query**.
4.  Copy and paste the SQL code below into the editor.
5.  Click **Run** (bottom right).

```sql
-- Create the 'loads' table
create table public.loads (
  id text primary key,
  origin text not null,
  destination text not null,
  cargo_type text,
  weight text,
  distance text,
  price text,
  status text default 'Open',
  pickup_date text,
  created_at timestamp with time zone default timezone('utc'::text, now()) not null
);

-- Enable Row Level Security (RLS)
alter table public.loads enable row level security;

-- Policy: Allow everyone to view loads (drivers need to see them)
create policy "Public loads are viewable by everyone" 
on public.loads for select 
using (true);

-- Policy: Allow logged-in users (clients) to post loads
create policy "Authenticated users can insert loads" 
on public.loads for insert 
with check (auth.role() = 'authenticated');
```

Once you run this, try posting a shipment again.
