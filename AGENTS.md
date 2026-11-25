# AGENTS.md — Total Recall (Anki Mobile)

## Project Overview
A local-first mobile web app (**Total Recall**) for learning vocabulary and grammar across any language pair (`orig ↔ learning`) with spaced repetition (SRS), Supabase cloud sync (Email, Password Reset, Google OAuth), language-aware Google Cloud TTS (via Supabase Edge Function + IndexedDB MP3 cache), streaks, and statistics.

- **Stack**: React 19, TypeScript (`strict: true`), Vite 6, Tailwind CSS v4, `@supabase/supabase-js` v2.
- **Deployment**: GitHub Pages via `.github/workflows/deploy.yml` (Node 24).
- **Documentation Language**: Keep all documentation (`README.md`, `ARCHITECTURE.md`, `AGENTS.md`) in **English**.

## Key Modules
- `src/types.ts` — Language-agnostic data types (`Deck` with `origLang`/`learningLang`, `Card` with `learning`/`orig`/`example_learning`/`example_orig`, `QueueItem`, `DailyStats`, `SpeechSettings`).
- `src/data/starterDecks.ts` — Starter deck catalog (RU↔EN, RU↔DE, EN↔DE, RU↔FR, EN↔FR, DE↔FR across A1–A2, B1, B2, C1) with short UI descriptions, dynamic Supabase word counts, and CSV corpora stored in Supabase `catalog_corpora`.
- `src/lib/srs.ts` — SRS rating rules (`Again` = `-2 reps` & stays in queue; `Hard` = no progress change & 5-min removal; first `Good` = 10-min removal; subsequent `Good`/`Easy` = day intervals), time-priority queue with 10% random new-word reserve, two-sided `mixed` expansion.
- `src/lib/stats.ts` — Streak calculation (`currentStreak`, `bestStreak`) and 90-day `reviewHistory`.
- `src/lib/i18n.ts` & `src/lib/I18nContext.tsx` — Live RU/EN UI localization (`useI18n()`, persisted in `anki_ui_lang`).
- `src/lib/storage.ts` — User-scoped `localStorage` persistence (`anki_guest_*` / `anki_u_<id>_*`), including `decks_v1` and `active_deck_key`.
- `src/lib/audioCache.ts` & `src/lib/speech.ts` — Google Cloud TTS (default `de-DE-Wavenet-C` via Edge Function `bright-action`) with `IndexedDB` MP3 cache, `Web Speech API` fallback, and request-ID audio cancellation on card switch.
- `src/lib/supabase.ts` — Supabase client and bidirectional merge sync (`user_profiles`, `user_decks`, `user_cards`).
- `supabase/functions/tts/index.ts` — Deno Edge Function proxying Google Cloud TTS with JWT verification, free-tier voice allowlist, and 300-char limit.
- `src/components/` — `Header`, `StatusRibbon`, `FlashCard`, `DecksView`, `StatsView`, `SettingsModal`, `AddCardModal`, `AuthModal`, `ProgressModal`, `AiPromptBuilder`, `StarterDecksCatalog`, `InfoTip`.

## Mandatory Agent Workflow (Run on Every Code Change)
1. **Update `ARCHITECTURE.md`**: Whenever code, data models, SRS rules, sync flows, or components change, update `ARCHITECTURE.md` (in English) to stay 100% in sync with the implementation.
2. **Update `README.md`**: Whenever user-facing features, setup steps, migrations, or scripts change, update `README.md` (in English) accordingly.
3. **Run Linter & Build**: Always run `npm run lint` and `npm run build` after edits and fix all reported errors before finishing.
4. **Update `AGENTS.md`**: Keep this `AGENTS.md` file updated whenever project structure, scripts, conventions, or core rules change.
