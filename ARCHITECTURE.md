# Architecture & Code Walkthrough — Deutsch B1–B2 Anki Mobile

This document describes the application architecture, spaced repetition (SRS) algorithm, Supabase cloud synchronization, speech synthesis pipeline, and key modules.

---

## 1. High-Level Architecture

The app is built as a **Local-First SPA** using **React 19 + TypeScript + Vite + Tailwind CSS v4**:
- Every user action (flipping a card, rating, adding/deleting a card, updating limits) is persisted immediately to `localStorage` for instant, zero-latency UX and offline support.
- Once signed in via **Supabase Auth**, per-card progress, custom cards, streaks, review history, and study preferences synchronize asynchronously with PostgreSQL protected by **Row Level Security (RLS)**.

```mermaid
flowchart TD
  subgraph UI["UI Layer (React Components)"]
    Header["Header.tsx<br/>(deck switcher, mode, + Card CTA, profile, settings)"]
    Ribbon["StatusRibbon.tsx<br/>(daily goal, streak 🔥, counters, progress bar)"]
    Card["FlashCard.tsx<br/>(card flip, audio, 4 dynamic rating buttons)"]
    Decks["DecksView.tsx<br/>(personal cabinet: create/delete decks, CSV, study)"]
    Stats["StatsView.tsx<br/>(streaks, 14-day chart, 7-day forecast)"]
    Modals["Modals<br/>SettingsModal / AddCardModal / AuthModal / ProgressModal + InfoTip"]
  end

  App["App.tsx<br/>(central state, keyboard shortcuts, sync orchestration)"]

  subgraph Logic["Business Logic (src/lib)"]
    SRS["srs.ts<br/>(SRS, 5-min Hard cooldown, persistent active queue)"]
    StatsLib["stats.ts<br/>(streaks 🔥, 90-day review history)"]
    Storage["storage.ts<br/>(user-scoped localStorage + migration)"]
    Speech["speech.ts + audioCache.ts<br/>(Google Cloud TTS + IndexedDB / Web Speech)"]
    SupaLib["supabase.ts<br/>(Auth + bidirectional merge sync)"]
  end

  Data["data/defaultCorpus.ts<br/>(70 built-in B1–B2 cards)"]
  LS[("Browser localStorage")]
  IDB[("Browser IndexedDB<br/>(MP3 audio cache)")]
  EdgeTTS["Supabase Edge Function: bright-action<br/>(JWT + allowlist + GOOGLE_TTS_API_KEY)"]
  GoogleTTS[("Google Cloud TTS API<br/>(WaveNet / Neural2)")]
  SupaDB[("Supabase Cloud<br/>Auth + Postgres RLS")]

  UI <--> App
  App --> SRS
  App --> StatsLib
  App --> Storage
  App --> Speech
  App --> SupaLib
  SRS --> Data
  Storage <--> LS
  Speech <--> IDB
  Speech -.->|"master key (default)"| EdgeTTS
  EdgeTTS -.-> GoogleTTS
  SupaLib <--> SupaDB
```

---

## 2. Project Structure

```text
anki/
├── index.html                      # Minimal Vite HTML entry point
├── package.json                    # Dependencies (React 19, Supabase, Vite, Tailwind v4)
├── tsconfig.json                   # Strict TypeScript config (strict: true)
├── vite.config.ts                  # Vite + React + Tailwind CSS v4 config (base: '/')
├── public/
│   └── CNAME                       # Custom GitHub Pages domain (larecall.org)
├── supabase_schema.sql                  # PostgreSQL tables, RLS policies, and safe migrations
├── supabase_migration_decks.sql         # Migration: user_decks & moving cards to 'default' deck
├── supabase_migration_orig_learning.sql # Migration: language-agnostic orig <-> learning schema
├── supabase_migration_catalog.sql       # Migration: public.catalog_corpora table (CSV in Supabase)
├── supabase_seed_catalog.sql            # SQL seed inserting A1-A2, B1, B2, C1 (DE/EN/RU) CSVs into Supabase
├── supabase_seed_catalog_fr.sql         # SQL seed inserting FR-A1-A2..FR-C1 (FR/EN/RU/DE) CSVs into Supabase
├── supabase_migrate_default_cards.sql   # One-off migration moving legacy 70 default cards to user profile
├── supabase/
│   └── functions/
│       └── tts/
│           └── index.ts            # Edge Function: Google Cloud TTS proxy with master key
├── .github/workflows/deploy.yml    # Automated Node 24 build & GitHub Pages deployment
└── src/
    ├── main.tsx                    # React root mount
    ├── index.css                   # Tailwind v4 import, color-scheme, focus rings, reveal animation & safe-area styles
    ├── types.ts                    # Shared TypeScript interfaces and types
    ├── App.tsx                     # Root state container, effects, and hotkeys
    ├── data/
    │   └── starterDecks.ts         # Starter deck metadata & Supabase CSV/count loader (catalog_corpora)
    ├── lib/
    │   ├── srs.ts                  # Spaced repetition, 5-min Hard delay, active queue
    │   ├── stats.ts                # Streak tracking (🔥), 90-day review history & merge
    │   ├── i18n.ts                 # RU/EN UI translation dictionary
    │   ├── I18nContext.tsx         # React i18n context & useI18n() hook (persisted in localStorage)
    │   ├── storage.ts              # User-scoped localStorage persistence
    │   ├── audioCache.ts           # IndexedDB MP3 blob cache for Google Cloud TTS
    │   ├── speech.ts               # Speech engine: Google Cloud TTS + Web Speech fallback
    │   └── supabase.ts             # Supabase client and fullSync / upsert / delete logic
    └── components/
        ├── Header.tsx              # Frosted-glass 2-tier bar: LaRecall brand/deck switcher, labeled + Card CTA pill, auth, settings + study direction bar
        ├── StatusRibbon.tsx        # Daily goal pill, clickable streak 🔥, counters (tabular-nums), gradient progress bar
        ├── FlashCard.tsx           # Elevated flashcard surface, animated answer reveal panel, audio pills & dynamic rating buttons
        ├── DecksView.tsx           # Personal cabinet: create/delete decks, starter catalog, add cards, CSV import/export
        ├── StatsView.tsx           # Statistics page: streaks, 14-day chart, 7-day forecast
        ├── SettingsModal.tsx       # UI language, theme, language-aware voice, limits, starter decks, custom cards
        ├── AddCardModal.tsx        # Form to create a new custom card
        ├── AuthModal.tsx           # Email sign in/up, password reset, Google OAuth, sync & starter decks
        ├── ProgressModal.tsx       # Card-by-card progress list, filters, search, reset
        ├── AiPromptBuilder.tsx     # Dynamic AI CSV prompt generator (languages, CEFR level, topic)
        ├── StarterDecksCatalog.tsx # Reusable starter deck catalog with dynamic Supabase word counts
        └── InfoTip.tsx             # Tap/click "?" in-app help popover component
```

---

## 3. Data Model & Supabase Schema

### Card Model (`src/types.ts`)

Both built-in and user-created cards share the same `Card` interface:

| Field | Type | Description |
| :--- | :--- | :--- |
| `cardKey` | `string` | Unique key: `default_1`…`default_70` for built-in cards, `custom_<uuid>` for user cards |
| `deckKey` | `string` | Parent deck key (`'default'` or `deck_<uuid>`) |
| `learning`, `orig` | `string` | Target term/phrase being learned and source/native translation (language-agnostic) |
| `example_learning`, `example_orig` | `string` | Contextual example sentence in the learning language and its translation |
| `context`, `tags` | `string` | Grammar note (e.g. `Verb (+ Dat.)`) and tags |
| `isCustom` | `boolean` | Distinguishes user-created cards from built-in cards |
| `reps` | `number` | Successful repetitions: `0` = New, `1–2` = Learning, `≥ 3` = Mastered |
| `interval` | `number` | Current review interval in days |
| `nextReview` | `number` | Unix timestamp (ms) for the next scheduled review |
| `updatedAt` | `number` | Unix timestamp (ms) of last modification (used for cloud conflict resolution) |

### PostgreSQL Schema (`supabase_schema.sql`)

```mermaid
erDiagram
  AUTH_USERS ||--o| USER_PROFILES : "has 1"
  AUTH_USERS ||--o{ USER_DECKS : "owns many"
  AUTH_USERS ||--o{ USER_CARDS : "owns many"

  AUTH_USERS {
    uuid id PK
    text email
  }

  USER_PROFILES {
    uuid user_id PK,FK
    integer daily_limit
    text today_date
    integer today_count
    text active_deck_key
    integer max_active_unknown
    text_array active_card_keys
    integer current_streak
    integer best_streak
    text last_study_date
    jsonb review_history
    text tts_engine
    text google_voice
    text google_tts_key
    timestamptz updated_at
  }

  USER_DECKS {
    uuid id PK
    uuid user_id FK
    text deck_key "UNIQUE (user_id, deck_key)"
    text name
    text description
    text orig_lang "default: 'RU'"
    text learning_lang "default: 'DE'"
    boolean is_default
    timestamptz created_at
    timestamptz updated_at
  }

  USER_CARDS {
    uuid id PK
    uuid user_id FK
    text deck_key "default: 'default'"
    text card_key "UNIQUE (user_id, card_key)"
    text learning
    text orig
    text example_learning
    text example_orig
    text context
    text tags
    boolean is_custom
    integer reps
    double interval
    bigint next_review
    timestamptz updated_at
  }
```

> **Why aren't all 70 built-in cards inserted into `user_cards` on first login?**
> The base corpus ships inside `defaultCorpus.ts`. Only cards with progress (`reps > 0` or `updatedAt > 0`) or custom cards (`is_custom = true`) are written to Supabase. On any new device, the client merges `defaultCorpus.ts` with rows from `user_cards`.

---

## 4. Spaced Repetition (SRS) & Active Queue

All scheduling logic lives as pure functions in `src/lib/srs.ts`.

### Definition of an "Unknown Word" (`isUnknownCard`)
A card is considered **unknown** if:
1. `card.reps === 0` (never learned or reset via "Again"), OR
2. `card.nextReview <= endOfToday` (still scheduled for review today, not yet promoted to tomorrow+).

### Rating Rules (`applyCardRating`)

```mermaid
flowchart TD
  Start["User rates a card"] --> Check{"Rating?"}

  Check -->|"1. Again"| Again["reps = max(0, reps - 2)<br/>interval = floor(interval × 0.4)<br/>nextReview = now + 1 min<br/>Always stays in session queue (+3 slots)"]

  Check -->|"2. Hard"| Hard["Progress unchanged (reps & interval kept)<br/>nextReview = now + 5 min<br/>Removed from queue for 5 min → returns first"]

  Check -->|"3. Good"| FirstGood{"First Good?<br/>(reps == 0)"}
  FirstGood -->|"Yes"| Good10["reps = 1, interval = 0<br/>nextReview = now + 10 min<br/>Removed from queue for 10 min → returns first"]
  FirstGood -->|"No (reps >= 1)"| GoodDays["reps += 1<br/>interval = 1 day (then ×2.0)<br/>nextReview = now + interval days"]

  Check -->|"4. Easy"| Easy["reps += 2<br/>interval = max(4, interval × 2.8) days<br/>nextReview = now + interval days"]
```

Button interval previews (`1 мин`, `5 мин`, `10 мин` / `1 дн.`, `4 дн.`) are computed dynamically per card via `getRatingPreviewLabels(card)`.

### Persistent Active Queue & Both-Sides Mastery (`reconcileActiveQueue` + `expandCardsToQueueItems`)
1. `user_profiles` (and `localStorage`) stores `max_active_unknown` (default **`5`**) and the exact **`active_card_keys`** array so the same active words survive page reloads and sync across devices.
2. **Time-based priority + 10% random new words**: Only **hard/due-now** cards (`nextReview <= now`) and **new** cards (`reps === 0`) occupy the active queue. Due cards are strictly sorted by `nextReview` ascending — the larger the overdue gap (`now - nextReview`), the earlier the card appears. At the same time, **10% of the queue** (`max(1, round(maxActiveUnknown × 0.1))` when `maxActiveUnknown >= 2` and new cards remain) is reserved for random new words so fresh vocabulary keeps flowing even when many reviews are due. Cards on a 5-minute "Hard" cooldown are temporarily hidden until their timer expires, then immediately return to the front (most overdue first).
3. **Random queue draw**: `expandCardsToQueueItems` shuffles the selected active words into randomized `QueueItem`s (`DE → RU` / `RU → DE`). In **Mixed** mode, `5` active words expand into **`10` queue items** across two independently shuffled passes (pass 1 with alternating directions, pass 2 with the opposite sides, avoiding back-to-back repeats across the boundary). Newly reconciled words added mid-session are also inserted at random positions in the remaining queue.
4. **Two-sided promotion**: `App.tsx` tracks completed sides in `passedSidesRef`. A card only advances its SRS level (`reps` / `nextReview`) and gets replaced by the next word in `active_card_keys` once **both** sides have passed.

---

## 5. Authentication & Sync Flow (`src/lib/supabase.ts`)

```mermaid
sequenceDiagram
  actor User
  participant App as App.tsx + storage.ts
  participant Supa as Supabase Auth & Postgres

  User->>App: Sign In (Email + Password)
  App->>Supa: auth.signInWithPassword()
  Supa-->>App: Session (user.id + JWT)
  App->>App: loadLocalDeck(user.id)

  App->>Supa: SELECT user_profiles & user_cards (RLS: auth.uid() = user_id)
  Supa-->>App: Cloud profile, streaks, active queue & cards

  App->>App: Merge defaultCorpus + local + remote<br/>(newest updatedAt wins, reviewHistory takes max per day)
  App->>App: Persist merged state to localStorage & sync SettingsModal inputs
  App->>Supa: UPSERT locally newer cards & profile
  Supa-->>App: OK → status "Synced"

  Note over User,Supa: During study (rate / add / delete)
  User->>App: Rates a card
  App->>App: Instantly updates React state, streaks & localStorage
  App--)Supa: Async UPSERT of 1 card + user_profiles
```

---

## 6. Speech Engine & Edge Function (`src/lib/speech.ts`, `src/lib/audioCache.ts`, `supabase/functions/tts/index.ts`)

```mermaid
flowchart LR
  Play["Speak card request"] --> Clean["cleanGermanSpeechText()<br/>(strip grammar notes)"]
  Clean --> Engine{"Engine?"}
  Engine -->|"System (fallback)"| WebSpeech["Web Speech API<br/>(highest-ranked German voice)"]
  Engine -->|"Google Cloud TTS (default)"| Cache{"MP3 in<br/>IndexedDB?"}
  Cache -->|"Yes"| Audio["HTMLAudioElement.play()"]
  Cache -->|"No"| KeyMode{"Personal key<br/>provided?"}
  KeyMode -->|"No (master key)"| Edge["Supabase Edge Function: bright-action<br/>(JWT + allowlist + 300-char limit)"] --> API["Google Cloud TTS API"]
  KeyMode -->|"Yes"| API
  API -->|"OK"| Save["Save MP3 blob to IndexedDB"] --> Audio
  API -->|"Error / offline"| WebSpeech
```

- **Server-side master key (`supabase/functions/tts/index.ts`, deployed slug `bright-action`)**: reads `GOOGLE_TTS_API_KEY` from **Supabase Secrets** (never exposed to the browser), verifies the user's JWT (`auth.getUser()`), enforces a strict free-tier allowlist (`de-DE-Wavenet-B/C`, `de-DE-Neural2-B/C/D/F`, default `de-DE-Wavenet-C`), and caps text length at `300` characters.
- **IndexedDB MP3 cache (`audioCache.ts`)**: caches generated MP3 blobs locally under `voice|rate|pitch|text` so repeated card reviews cost zero API quota and work offline.
- **Automatic fallback & card-switch interruption**: if unauthenticated (without a personal key), offline, or on API error, playback seamlessly falls back to `Web Speech API`. Switching to a new card or leaving the study view calls `stopActiveAudio()`, immediately halting current playback and cancelling any in-flight TTS fetch via a request-ID guard.

---

## 7. Streaks, Statistics & Deployment

- **UI Internationalization (`src/lib/i18n.ts` + `src/lib/I18nContext.tsx`)**: full live RU/EN switching via the header `RU/EN` button or `SettingsModal`, persisted in `localStorage` (`anki_ui_lang`).
- **Daily Progress Bar (`StatusRibbon.tsx`)**: reflects `dailyReviewedCount / dailyLimit` (matching the `Today: x/y` badge and turning green once the daily goal is met).
- **Streaks & History (`src/lib/stats.ts` + `src/components/StatsView.tsx`)**: tracks `currentStreak`, `bestStreak`, `lastStudyDate`, and a rolling 90-day `reviewHistory` map (`YYYY-MM-DD → count`). `StatsView` renders a 14-day activity bar chart, deck mastery breakdown, and a 7-day upcoming review forecast.
- **In-App Help (`src/components/InfoTip.tsx`)**: tap/click `?` popovers inside `SettingsModal` explain each setting on both mobile and desktop.
- **Build & Deploy**: `vite.config.ts` sets `base: '/'`, `public/CNAME` preserves the custom domain (`larecall.org`), and `.github/workflows/deploy.yml` runs `npm ci && npm run build` on Node 24 to publish `dist/` to GitHub Pages on every push to `main`.
