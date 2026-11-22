-- Supabase Schema for Deutsch B1-B2 Anki Mobile
-- Run this entire script in your Supabase Dashboard -> SQL Editor -> New Query

-- 1. User profiles (daily goal & daily progress)
create table if not exists public.user_profiles (
  user_id uuid primary key references auth.users(id) on delete cascade,
  daily_limit integer not null default 60,
  today_date text not null default '',
  today_count integer not null default 0,
  updated_at timestamptz not null default now()
);

-- 2. User cards (both progress on built-in cards and custom user-created cards)
create table if not exists public.user_cards (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  card_key text not null,
  german text not null,
  russian text not null,
  example_de text not null default '',
  example_ru text not null default '',
  context text not null default '',
  tags text not null default '',
  is_custom boolean not null default false,
  reps integer not null default 0,
  interval double precision not null default 0,
  next_review bigint not null default 0,
  updated_at timestamptz not null default now(),
  constraint user_cards_user_card_key_unique unique (user_id, card_key)
);

create index if not exists idx_user_cards_user_id on public.user_cards(user_id);

-- 3. Enable Row Level Security (RLS)
alter table public.user_profiles enable row level security;
alter table public.user_cards enable row level security;

-- 4. RLS Policies for user_profiles
drop policy if exists "Users can view own profile" on public.user_profiles;
create policy "Users can view own profile"
  on public.user_profiles for select
  using (auth.uid() = user_id);

drop policy if exists "Users can insert own profile" on public.user_profiles;
create policy "Users can insert own profile"
  on public.user_profiles for insert
  with check (auth.uid() = user_id);

drop policy if exists "Users can update own profile" on public.user_profiles;
create policy "Users can update own profile"
  on public.user_profiles for update
  using (auth.uid() = user_id)
  with check (auth.uid() = user_id);

-- 5. RLS Policies for user_cards
drop policy if exists "Users can view own cards" on public.user_cards;
create policy "Users can view own cards"
  on public.user_cards for select
  using (auth.uid() = user_id);

drop policy if exists "Users can insert own cards" on public.user_cards;
create policy "Users can insert own cards"
  on public.user_cards for insert
  with check (auth.uid() = user_id);

drop policy if exists "Users can update own cards" on public.user_cards;
create policy "Users can update own cards"
  on public.user_cards for update
  using (auth.uid() = user_id)
  with check (auth.uid() = user_id);

drop policy if exists "Users can delete own cards" on public.user_cards;
create policy "Users can delete own cards"
  on public.user_cards for delete
  using (auth.uid() = user_id);
