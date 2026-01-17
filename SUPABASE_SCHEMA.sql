    -- Enable UUID extension
    create extension if not exists "uuid-ossp";

    -- 1. PROFILES (Public user data)
    create table public.profiles (
      id uuid references auth.users on delete cascade primary key,
      full_name text,
      role text check (role in ('client', 'driver', 'admin')),
      company_name text,
      avatar_url text,
      created_at timestamp with time zone default timezone('utc'::text, now()) not null
    );

    -- Enable RLS for profiles
    alter table public.profiles enable row level security;

    create policy "Public profiles are viewable by everyone" 
    on public.profiles for select using (true);

    create policy "Users can insert their own profile" 
    on public.profiles for insert with check (auth.uid() = id);

    create policy "Users can update their own profile" 
    on public.profiles for update using (auth.uid() = id);


    -- 2. LOADS (Shipments)
    create table public.loads (
      id uuid default uuid_generate_v4() primary key,
      client_id uuid references public.profiles(id),
      driver_id uuid references public.profiles(id), -- Null until assigned
      origin text not null,
      destination text not null,
      pickup_date timestamp with time zone,
      delivery_date timestamp with time zone,
      cargo_type text,
      weight text,
      distance text,
      price numeric,
      status text default 'Open' check (status in ('Open', 'Bidding', 'In Transit', 'Delivered', 'Cancelled')),
      created_at timestamp with time zone default timezone('utc'::text, now()) not null
    );

    -- Enable RLS for loads
    alter table public.loads enable row level security;

    -- Everyone can see loads (drivers need to browse)
    create policy "Loads are viewable by everyone" 
    on public.loads for select using (true);

    -- Only clients can maintain their own loads
    create policy "Clients can insert loads" 
    on public.loads for insert with check (auth.uid() = client_id);

    create policy "Clients can update their own loads" 
    on public.loads for update using (auth.uid() = client_id);


    -- 3. BIDS (Drivers bidding on loads)
    create table public.bids (
      id uuid default uuid_generate_v4() primary key,
      load_id uuid references public.loads(id) on delete cascade not null,
      driver_id uuid references public.profiles(id) not null,
      amount numeric not null,
      status text default 'pending' check (status in ('pending', 'accepted', 'rejected')),
      created_at timestamp with time zone default timezone('utc'::text, now()) not null
    );

    -- Enable RLS for bids
    alter table public.bids enable row level security;

    create policy "Users can see bids for their loads or their own bids" 
    on public.bids for select 
    using (
      auth.uid() = driver_id 
      or 
      exists (select 1 from public.loads where loads.id = bids.load_id and loads.client_id = auth.uid())
    );

    create policy "Drivers can insert bids" 
    on public.bids for insert 
    with check (auth.uid() = driver_id);


    -- 4. TRANSACTIONS (Wallet)
    create table public.transactions (
      id uuid default uuid_generate_v4() primary key,
      user_id uuid references public.profiles(id) not null,
      amount numeric not null, -- Positive for credit, negative for debit
      type text not null, -- 'deposit', 'payment', 'refund'
      description text,
      created_at timestamp with time zone default timezone('utc'::text, now()) not null
    );

    -- Enable RLS for transactions
    alter table public.transactions enable row level security;

    create policy "Users can view their own transactions" 
    on public.transactions for select using (auth.uid() = user_id);


    -- 5. FUNCTION TO HANDLE NEW USER SIGNUP (Optional but recommended)
    -- This automatically creates a profile when a user signs up via Supabase Auth
    create or replace function public.handle_new_user() 
    returns trigger as $$
    begin
      insert into public.profiles (id, full_name, role, avatar_url)
      values (new.id, new.raw_user_meta_data->>'full_name', new.raw_user_meta_data->>'role', new.raw_user_meta_data->>'avatar_url');
      return new;
    end;
    $$ language plpgsql security definer;

    create or replace trigger on_auth_user_created
      after insert on auth.users
      for each row execute procedure public.handle_new_user();

    -- 6. GPS TRACKING (Real-time location)
    create table public.gps_tracking (
      id uuid default uuid_generate_v4() primary key,
      load_id uuid references public.loads(id) not null,
      driver_id uuid references public.profiles(id) not null,
      latitude numeric not null,
      longitude numeric not null,
      speed numeric, -- km/h
      heading numeric, -- degrees
      recorded_at timestamp with time zone default timezone('utc'::text, now()) not null
    );

    -- Enable RLS for GPS
    alter table public.gps_tracking enable row level security;

    create policy "Everyone can view tracking for active loads"
    on public.gps_tracking for select
    using (true); -- Ideally restrict to client/driver of the load, but public for demo is easier

    create policy "Drivers can insert their own location"
    on public.gps_tracking for insert
    with check (auth.uid() = driver_id);


    -- 7. CERTIFICATES / DOCUMENTS
    create table public.certificates (
      id uuid default uuid_generate_v4() primary key,
      user_id uuid references public.profiles(id) not null,
      type text not null, -- 'license', 'insurance', 'registration'
      file_url text not null,
      expiry_date date,
      status text default 'pending' check (status in ('pending', 'verified', 'rejected')),
      created_at timestamp with time zone default timezone('utc'::text, now()) not null
    );

    -- Enable RLS for certificates
    alter table public.certificates enable row level security;

    create policy "Users can view their own certificates"
    on public.certificates for select using (auth.uid() = user_id);

    create policy "Users can upload their own certificates"
    on public.certificates for insert with check (auth.uid() = user_id);


    -- 8. PAYMENTS (Specific load payments)
    create table public.payments (
      id uuid default uuid_generate_v4() primary key,
      load_id uuid references public.loads(id) not null,
      payer_id uuid references public.profiles(id) not null, -- Client
      payee_id uuid references public.profiles(id) not null, -- Driver
      amount numeric not null,
      status text default 'pending' check (status in ('pending', 'processing', 'completed', 'failed')),
      payment_method text, -- 'card', 'wallet', 'bank_transfer'
      provider_id text, -- Stripe/PayPal ID
      created_at timestamp with time zone default timezone('utc'::text, now()) not null
    );

    -- Enable RLS for payments
    alter table public.payments enable row level security;

    create policy "Users can view their own payments"
    on public.payments for select 
    using (auth.uid() = payer_id or auth.uid() = payee_id);
