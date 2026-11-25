-- Migration: Add public.catalog_corpora table for storing starter deck CSVs in Supabase
-- Safe & idempotent: run once in Supabase Dashboard -> SQL Editor -> New Query

create table if not exists public.catalog_corpora (
  level text primary key,
  title text not null,
  word_count integer not null default 0,
  csv_content text not null,
  updated_at timestamptz not null default now()
);

alter table public.catalog_corpora enable row level security;

drop policy if exists "Anyone can read starter catalog" on public.catalog_corpora;
create policy "Anyone can read starter catalog"
  on public.catalog_corpora for select
  using (true);
