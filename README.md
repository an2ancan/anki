# Anki Mobile — Spaced Repetition Flashcards

A local-first mobile web app for language learning (shipped with a 70-card German B1–B2 default deck) built with **React 19, TypeScript, Vite, and Tailwind CSS v4**, featuring a personal deck cabinet, language-agnostic `orig ↔ learning` cards, spaced repetition (SRS), streaks & statistics, live **RU/EN** UI localization, **Supabase** cloud sync, and **Google Cloud TTS** via a Supabase Edge Function with `IndexedDB` MP3 caching.

> For a detailed technical breakdown and Mermaid diagrams, see [`ARCHITECTURE.md`](./ARCHITECTURE.md).

---

## Features

- **Personal Deck Cabinet**: Create and delete custom decks with any language pair (`origLang` → `learningLang`, e.g. `RU → DE`, `EN → ES`), switch active decks, and track mastery per deck.
- **Language-Agnostic Cards (`orig ↔ learning`)**: Cards display `learning (DE) → orig (RU)` or `orig (RU) → learning (DE)` based on the active deck's language pair. Includes 70 built-in B1–B2 German cards in the `default` deck.
- **Smart Spaced Repetition (SRS)**:
  - **Again**: reduces progress (`-2 reps`) without wiping it to 0 and keeps the card in the active queue.
  - **Hard**: keeps progress unchanged and removes the card from the queue for **5 minutes**, then returns it first with priority.
  - **Good**: first `Good` removes the card for **10 minutes**; subsequent `Good` ratings schedule by days (`1d → 2d → 4d → 8d…`).
  - **Easy**: jumps ahead (`+2 reps`, `4d+`).
  - **Persistent Active Queue**: caps simultaneous unknown words (default `5`, synced to Supabase), prioritizes the most overdue cards first, reserves **10%** for random new words, and in **Mixed** mode requires **both sides** (`learning → orig` & `orig → learning`) to pass before advancing.
- **Streaks & Statistics**: Daily streak counter (`🔥`), best record (`🏆`), daily progress bar (`Today: x/y`), 14-day activity chart, deck mastery breakdown, and 7-day review forecast.
- **Add Cards & CSV Import/Export**: Add single cards to any deck (`+`) or bulk import/export CSV (`Learning;Orig;Example_Learning;Example_Orig;Context;Tags`).
- **Google Cloud TTS + Offline Fallback**: Uses `de-DE-Wavenet-C` by default via a secure Supabase Edge Function (master key stored in Supabase Secrets, free-tier voice allowlist) with local `IndexedDB` MP3 caching, automatic fallback to browser `Web Speech API`, and immediate audio cancellation on card switch.
- **Live RU / EN UI Switcher**, **In-App Help (`?`)**, **Dark / Light Theme**, and **Offline Guest Mode**.

---

## Local Development

```bash
npm install
npm run dev      # Start local Vite dev server
npm run lint     # Strict TypeScript check (tsc --noEmit)
npm run build    # Type-check & production build to dist/
```

---

## Supabase Setup Guide

### 1. Database Schema & Migrations
- **Fresh setup**: Open **Supabase Dashboard → SQL Editor → New query**, paste [`supabase_schema.sql`](./supabase_schema.sql), and click **Run**.
- **Upgrading an existing database**: Run [`supabase_migration_decks.sql`](./supabase_migration_decks.sql) followed by [`supabase_migration_orig_learning.sql`](./supabase_migration_orig_learning.sql).

### 2. Email Authentication
1. Go to **Authentication → Sign In / Providers → Email** and ensure Email is enabled.
2. *(Optional)* Disable **Confirm email** for instant sign-up, or add your site URL under **Authentication → URL Configuration → Site URL**.

### 3. Google Cloud TTS Edge Function (Optional Master Key)
1. Enable **Cloud Text-to-Speech API** in [Google Cloud Console](https://console.cloud.google.com/) and create an API key (restrict it to **Cloud Text-to-Speech API**; leave *Application restrictions* as **None** for server-side calls).
2. In Supabase Dashboard → **Edge Functions → Secrets**, add `GOOGLE_TTS_API_KEY`.
3. Deploy [`supabase/functions/tts/index.ts`](./supabase/functions/tts/index.ts) under **Edge Functions** and turn **OFF** *Verify JWT with legacy secret* (the function verifies user JWTs directly via `auth.getUser()`).

---

## Deployment (GitHub Pages)

The repository includes [`.github/workflows/deploy.yml`](./.github/workflows/deploy.yml) (Node 24):
1. In GitHub repo **Settings → Pages**, set **Source** to **GitHub Actions**.
2. Push to `main` — GitHub Actions automatically builds `dist/` and deploys to GitHub Pages.

---

## Keyboard Shortcuts (Desktop)

- `Space` — flip card / reveal answer
- `1` — Again, `2` — Hard, `3` — Good, `4` — Easy
- `Esc` — close any open modal
