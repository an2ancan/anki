-- Supabase Schema for Deutsch B1-B2 Anki Mobile
-- Run this entire script in your Supabase Dashboard -> SQL Editor -> New Query

-- 1. User profiles (daily goal, daily progress, active study queue, streaks, and TTS settings)
create table if not exists public.user_profiles (
  user_id uuid primary key references auth.users(id) on delete cascade,
  daily_limit integer not null default 60,
  today_date text not null default '',
  today_count integer not null default 0,
  active_deck_key text not null default 'default',
  max_active_unknown integer not null default 5,
  active_card_keys text[] not null default '{}',
  current_streak integer not null default 0,
  best_streak integer not null default 0,
  last_study_date text not null default '',
  review_history jsonb not null default '{}'::jsonb,
  tts_engine text not null default 'google',
  google_voice text not null default 'de-DE-Wavenet-C',
  google_tts_key text not null default '',
  updated_at timestamptz not null default now()
);

-- Safe migration for existing installations:
alter table public.user_profiles add column if not exists active_deck_key text not null default 'default';
alter table public.user_profiles add column if not exists max_active_unknown integer not null default 5;
alter table public.user_profiles add column if not exists active_card_keys text[] not null default '{}';
alter table public.user_profiles add column if not exists current_streak integer not null default 0;
alter table public.user_profiles add column if not exists best_streak integer not null default 0;
alter table public.user_profiles add column if not exists last_study_date text not null default '';
alter table public.user_profiles add column if not exists review_history jsonb not null default '{}'::jsonb;
alter table public.user_profiles add column if not exists tts_engine text not null default 'google';
alter table public.user_profiles add column if not exists google_voice text not null default 'de-DE-Wavenet-C';
alter table public.user_profiles add column if not exists google_tts_key text not null default '';

-- 1b. User decks (personal cabinet with default + custom decks)
create table if not exists public.user_decks (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  deck_key text not null,
  name text not null,
  description text not null default '',
  orig_lang text not null default 'RU',
  learning_lang text not null default 'DE',
  is_default boolean not null default false,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint user_decks_user_deck_key_unique unique (user_id, deck_key)
);

alter table public.user_decks add column if not exists orig_lang text not null default 'RU';
alter table public.user_decks add column if not exists learning_lang text not null default 'DE';
create index if not exists idx_user_decks_user_id on public.user_decks(user_id);

-- 2. User cards (language-agnostic: learning <-> orig)
create table if not exists public.user_cards (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  deck_key text not null default 'default',
  card_key text not null,
  learning text not null,
  orig text not null,
  example_learning text not null default '',
  example_orig text not null default '',
  context text not null default '',
  tags text not null default '',
  is_custom boolean not null default false,
  reps integer not null default 0,
  interval double precision not null default 0,
  next_review bigint not null default 0,
  updated_at timestamptz not null default now(),
  constraint user_cards_user_card_key_unique unique (user_id, card_key)
);

alter table public.user_cards add column if not exists deck_key text not null default 'default';
create index if not exists idx_user_cards_user_id on public.user_cards(user_id);
create index if not exists idx_user_cards_user_deck on public.user_cards(user_id, deck_key);

-- 3. Enable Row Level Security (RLS)
alter table public.user_profiles enable row level security;
alter table public.user_decks enable row level security;
alter table public.user_cards enable row level security;

-- 3b. RLS Policies for user_decks
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

-- 6. Self-service Account Deletion RPC (deletes auth.users row + cascades profile, decks, cards)
create or replace function public.delete_my_account()
returns void
language plpgsql
security definer
set search_path = public, auth
as $$
declare
  v_uid uuid := auth.uid();
begin
  if v_uid is null then
    raise exception 'Not authenticated';
  end if;

  delete from auth.users where id = v_uid;
end;
$$;

revoke all on function public.delete_my_account() from public;
grant execute on function public.delete_my_account() to authenticated;
