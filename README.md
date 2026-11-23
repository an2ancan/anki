# Deutsch B1–B2 Anki Mobile

A personal mobile-first web app for learning German vocabulary and grammar (B1–B2 level) using spaced repetition (Anki), built-in German speech synthesis, custom user cards, detailed progress tracking, and cloud sync via **Supabase**.

## Features

- **70 Built-in Cards**: 50 vocabulary cards + 20 B1–B2 grammar cards with German/Russian examples and grammatical context.
- **Custom User Cards**: Add your own cards via the `+` button in the header or bulk import/export via CSV, plus search and delete custom cards in settings.
- **Learning Progress Dashboard**: View how many cards are mastered (`reps >= 3`), in progress (`1–2` reps), or unlearned (`0` reps), filter and search all cards, jump straight into practicing any card, or reset a card's progress.
- **Supabase Auth & Cloud Sync**: Sign up / sign in with Email + Password; automatically syncs per-card progress, custom cards, and daily stats across devices with Row Level Security (RLS).
- **Offline / Guest Mode**: Works locally in `localStorage` without signing in.
- **German Speech Engine**: Supports both the default browser **Web Speech API** and on-demand **Google Cloud Text-to-Speech (`de-DE-Neural2` / `WaveNet`)** with local `IndexedDB` MP3 caching and automatic fallback.
- **Dark / Light Theme** and mobile-friendly touch layout.

### Optional: Google Cloud TTS Setup (1M free chars/month)
1. In [Google Cloud Console](https://console.cloud.google.com/), enable **Cloud Text-to-Speech API**.
2. Create an API key under **APIs & Services → Credentials** (optionally restrict it to the Text-to-Speech API and your GitHub Pages domain).
3. In the app, open **Settings (⚙) → Голос и произношение → Google Cloud TTS**, choose a voice (e.g. `de-DE-Neural2-C`), and paste your API key. Generated audio clips are cached locally in `IndexedDB`.

---

## Supabase Setup Guide (5 Minutes)

### Step 1. Create a Supabase Project
1. Go to [supabase.com](https://supabase.com/) and sign in.
2. Click **New Project**, choose a name, database password, and region, then click **Create new project**.

### Step 2. Create Tables & Row Level Security (RLS)
1. Open **SQL Editor** → **New query** in the left sidebar.
2. Copy the entire contents of [`supabase_schema.sql`](./supabase_schema.sql) and paste it into the editor.
3. Click **Run** (`Ctrl+Enter`). This creates the `user_profiles` and `user_cards` tables with RLS policies so each user can only access their own data.

### Step 3. Configure Email Authentication
1. Go to **Authentication** → **Sign In / Providers** → **Email**.
2. Make sure the **Email** provider is enabled.
3. *(Optional, for instant sign-up without email verification)* Disable **Confirm email** and save.
   - Alternatively, you can create users manually under **Authentication → Users → Add user → Create new user**.

### Step 4. Get Your API Credentials
1. Open **Project Settings** → **API** (or **Data API / API Keys**).
2. Copy:
   - **Project URL** (e.g. `https://<project-id>.supabase.co`)
   - **Publishable key** (`sb_publishable_...`) or legacy **anon / public key**

### Step 5. Connect the App to Supabase

You can configure Supabase in either of two ways:

- **Option A (Recommended for GitHub Pages / multi-device use):**
  Edit `SUPABASE_CONFIG` near the top of `<script>` in `index.html`:
  ```js
  const SUPABASE_CONFIG = {
    url: 'https://YOUR_PROJECT_ID.supabase.co',
    anonKey: 'YOUR_SUPABASE_PUBLISHABLE_OR_ANON_KEY'
  };
  ```
  > Storing the publishable/anon key in client-side code is safe because access is restricted by the **Row Level Security (RLS)** policies defined in `supabase_schema.sql`.

- **Option B (No code edits):**
  Open the app in your browser → click **Войти** (top right) → expand **Настройки подключения Supabase** → paste your URL and key → click **Сохранить**.

---

## How to Use

1. **Run or Deploy**:
   - Open `index.html` directly in a browser, or deploy via **GitHub Pages** (*Settings → Pages → Deploy from branch `main`*).
2. **Sign In & Sync**:
   - Click the profile button (**Войти**) in the top bar to register or log in.
   - Progress and custom cards sync automatically after each review, card creation, or deletion. You can also trigger a manual sync from the profile modal.
3. **Track Progress**:
   - Tap **`Сегодня: X / 60`** or any of the **`Новые` / `Учим` / `Выучено`** counters in the status bar to open the **Progress Dashboard**.
   - Filter cards by status (`Все`, `Выучены`, `Учим`, `Не выучены`, `Мои`), search, pronounce, jump directly to studying a card, or reset its progress (`↺`).
4. **Add & Manage Custom Cards**:
   - Click **`+`** in the top bar to add a card manually.
   - Open **Settings (⚙)** to search/delete your custom cards or bulk import/export CSV (`German;Russian;Example_DE;Example_RU;Context;Tags`).
5. **Keyboard Shortcuts (Desktop)**:
   - `Space` — flip card / show answer
   - `1` — Again, `2` — Hard, `3` — Good, `4` — Easy
   - `Esc` — close open modal
