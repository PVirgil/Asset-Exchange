create extension if not exists pgcrypto;
create table if not exists public.assets (
 id text primary key,
 slug text unique not null,
 symbol text not null,
 name text not null,
 asset_class text not null,
 category text,
 currency text not null default 'USD',
 description text,
 metadata jsonb not null default '{}'::jsonb,
 created_at timestamptz not null default now(),
 updated_at timestamptz not null default now()
);
create table if not exists public.price_observations (
 id bigint generated always as identity primary key,
 asset_id text not null references public.assets(id) on delete cascade,
 price numeric not null check(price>=0),
 currency text not null default 'USD',
 observed_at timestamptz not null default now(),
 source text not null,
 metadata jsonb not null default '{}'::jsonb
);
create index if not exists price_asset_time_idx on public.price_observations(asset_id, observed_at desc);
create table if not exists public.valuations (
 id uuid primary key default gen_random_uuid(),
 asset_id text not null references public.assets(id) on delete cascade,
 estimated_value numeric not null check(estimated_value>=0),
 confidence smallint check(confidence between 0 and 100),
 methodology_version text not null,
 inputs jsonb not null default '{}'::jsonb,
 valued_at timestamptz not null default now()
);
create table if not exists public.watchlists (
 id uuid primary key default gen_random_uuid(),
 user_id uuid not null references auth.users(id) on delete cascade,
 name text not null default 'Watchlist',
 created_at timestamptz not null default now()
);
create table if not exists public.watchlist_items (
 watchlist_id uuid references public.watchlists(id) on delete cascade,
 asset_id text references public.assets(id) on delete cascade,
 created_at timestamptz not null default now(),
 primary key(watchlist_id,asset_id)
);
create table if not exists public.portfolios (
 id uuid primary key default gen_random_uuid(),
 user_id uuid not null references auth.users(id) on delete cascade,
 name text not null,
 created_at timestamptz not null default now()
);
create table if not exists public.holdings (
 id uuid primary key default gen_random_uuid(),
 portfolio_id uuid not null references public.portfolios(id) on delete cascade,
 asset_id text not null references public.assets(id),
 quantity numeric not null,
 cost_basis numeric,
 metadata jsonb not null default '{}'::jsonb
);
alter table public.assets enable row level security;
alter table public.price_observations enable row level security;
alter table public.valuations enable row level security;
alter table public.watchlists enable row level security;
alter table public.watchlist_items enable row level security;
alter table public.portfolios enable row level security;
alter table public.holdings enable row level security;
create policy "public read assets" on public.assets for select using (true);
create policy "public read prices" on public.price_observations for select using (true);
create policy "public read valuations" on public.valuations for select using (true);
create policy "own watchlists" on public.watchlists for all using (auth.uid()=user_id) with check(auth.uid()=user_id);
create policy "own watchlist items" on public.watchlist_items for all using (exists(select 1 from public.watchlists w where w.id=watchlist_id and w.user_id=auth.uid())) with check (exists(select 1 from public.watchlists w where w.id=watchlist_id and w.user_id=auth.uid()));
create policy "own portfolios" on public.portfolios for all using (auth.uid()=user_id) with check(auth.uid()=user_id);
create policy "own holdings" on public.holdings for all using (exists(select 1 from public.portfolios p where p.id=portfolio_id and p.user_id=auth.uid())) with check (exists(select 1 from public.portfolios p where p.id=portfolio_id and p.user_id=auth.uid()));
