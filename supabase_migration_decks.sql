-- Migration: Add user_decks cabinet & move all existing cards into the 'default' deck
-- Run this script once in Supabase Dashboard -> SQL Editor -> New Query

-- 1. Create user_decks table
create table if not exists public.user_decks (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  deck_key text not null,
  name text not null,
  description text not null default '',
  is_default boolean not null default false,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint user_decks_user_deck_key_unique unique (user_id, deck_key)
);

create index if not exists idx_user_decks_user_id on public.user_decks(user_id);

-- 2. Enable RLS & policies for user_decks
alter table public.user_decks enable row level security;

drop policy if exists "Users can view own decks" on public.user_decks;
create policy "Users can view own decks"
  on public.user_decks for select
  using (auth.uid() = user_id);

drop policy if exists "Users can insert own decks" on public.user_decks;
create policy "Users can insert own decks"
  on public.user_decks for insert
  with check (auth.uid() = user_id);

drop policy if exists "Users can update own decks" on public.user_decks;
create policy "Users can update own decks"
  on public.user_decks for update
  using (auth.uid() = user_id)
  with check (auth.uid() = user_id);

drop policy if exists "Users can delete own decks" on public.user_decks;
create policy "Users can delete own decks"
  on public.user_decks for delete
  using (auth.uid() = user_id);

-- 3. Add deck_key to user_cards & active_deck_key to user_profiles
alter table public.user_cards add column if not exists deck_key text not null default 'default';
create index if not exists idx_user_cards_user_deck on public.user_cards(user_id, deck_key);

alter table public.user_profiles add column if not exists active_deck_key text not null default 'default';

-- 4. Backfill: create the 'default' deck for all existing users and assign existing cards to 'default'
insert into public.user_decks (user_id, deck_key, name, description, is_default)
select distinct user_id, 'default', 'Deutsch B1–B2', 'Built-in B1–B2 vocabulary & grammar', true
from (
  select user_id from public.user_profiles
  union
  select user_id from public.user_cards
) existing_users
on conflict (user_id, deck_key) do nothing;

update public.user_cards
set deck_key = 'default'
where deck_key is null or deck_key = '';
