-- Migration: Make cards & decks language-agnostic (orig <-> learning)
-- Safe & idempotent: run once in Supabase Dashboard -> SQL Editor -> New Query

-- 1. Add orig_lang and learning_lang to user_decks
alter table public.user_decks add column if not exists orig_lang text not null default 'RU';
alter table public.user_decks add column if not exists learning_lang text not null default 'DE';

update public.user_decks
set orig_lang = 'RU', learning_lang = 'DE'
where deck_key = 'default';

-- 2. Safely rename language-specific columns in user_cards to learning / orig
do $$
begin
  if exists (
    select 1 from information_schema.columns
    where table_schema = 'public' and table_name = 'user_cards' and column_name = 'german'
  ) and not exists (
    select 1 from information_schema.columns
    where table_schema = 'public' and table_name = 'user_cards' and column_name = 'learning'
  ) then
    alter table public.user_cards rename column german to learning;
  end if;

  if exists (
    select 1 from information_schema.columns
    where table_schema = 'public' and table_name = 'user_cards' and column_name = 'russian'
  ) and not exists (
    select 1 from information_schema.columns
    where table_schema = 'public' and table_name = 'user_cards' and column_name = 'orig'
  ) then
    alter table public.user_cards rename column russian to orig;
  end if;

  if exists (
    select 1 from information_schema.columns
    where table_schema = 'public' and table_name = 'user_cards' and column_name = 'example_de'
  ) and not exists (
    select 1 from information_schema.columns
    where table_schema = 'public' and table_name = 'user_cards' and column_name = 'example_learning'
  ) then
    alter table public.user_cards rename column example_de to example_learning;
  end if;

  if exists (
    select 1 from information_schema.columns
    where table_schema = 'public' and table_name = 'user_cards' and column_name = 'example_ru'
  ) and not exists (
    select 1 from information_schema.columns
    where table_schema = 'public' and table_name = 'user_cards' and column_name = 'example_orig'
  ) then
    alter table public.user_cards rename column example_ru to example_orig;
  end if;
end $$;
