import { DEFAULT_DECK_KEY, type Card, type DailyStats, type Deck, type SpeechSettings } from '../types';
import { normalizeCard } from './srs';

export function getTodayKey(): string {
  const d = new Date();
  return `${d.getFullYear()}-${String(d.getMonth() + 1).padStart(2, '0')}-${String(d.getDate()).padStart(2, '0')}`;
}

export function getStoragePrefix(userId: string | null): string {
  return userId ? `anki_u_${userId}_` : 'anki_guest_';
}

export function clearUserLocalData(userId: string): void {
  const prefix = getStoragePrefix(userId);
  const keysToRemove: string[] = [];
  for (let i = 0; i < localStorage.length; i++) {
    const key = localStorage.key(i);
    if (key && key.startsWith(prefix)) {
      keysToRemove.push(key);
    }
  }
  keysToRemove.forEach((key) => localStorage.removeItem(key));
}

export function loadLocalDeck(userId: string | null): Card[] {
  const prefix = getStoragePrefix(userId);
  const stored =
    localStorage.getItem(`${prefix}corpus_v4`) ||
    (!userId ? localStorage.getItem('anki_de_corpus_v3') : null);

  if (stored) {
    try {
      const parsed = JSON.parse(stored);
      if (Array.isArray(parsed)) {
        return parsed
          .map((c, idx) => normalizeCard(c, idx))
          .filter((c) => c.isCustom || c.reps > 0 || c.updatedAt > 0);
      }
    } catch {
      // Fallback to empty deck
    }
  }
  return [];
}

export function saveLocalDeck(userId: string | null, deck: Card[]): void {
  localStorage.setItem(`${getStoragePrefix(userId)}corpus_v4`, JSON.stringify(deck));
}

export function loadLocalDecks(userId: string | null): Deck[] {
  const prefix = getStoragePrefix(userId);
  const stored = localStorage.getItem(`${prefix}decks_v1`);
  if (stored) {
    try {
      const parsed = JSON.parse(stored);
      if (Array.isArray(parsed)) {
        return parsed
          .filter((d) => !(d.isDefault && Number(d.updatedAt || 0) === 0))
          .map((d) => ({
            deckKey: String(d.deckKey || DEFAULT_DECK_KEY),
            name: String(d.name || 'Deck'),
            description: String(d.description || ''),
            origLang: String(d.origLang || 'RU').toUpperCase(),
            learningLang: String(d.learningLang || 'DE').toUpperCase(),
            isDefault: Boolean(d.isDefault),
            createdAt: Number(d.createdAt) || 0,
            updatedAt: Number(d.updatedAt) || 0,
          }));
      }
    } catch {
      // Fallback below
    }
  }
  return [];
}

export function saveLocalDecks(userId: string | null, decks: Deck[]): void {
  localStorage.setItem(`${getStoragePrefix(userId)}decks_v1`, JSON.stringify(decks));
}

export function loadLocalDailyStats(userId: string | null): DailyStats {
  const prefix = getStoragePrefix(userId);
  const legacyLimit = !userId ? localStorage.getItem('anki_daily_limit') : null;
  const legacyDate = !userId ? localStorage.getItem('anki_today_date') : null;
  const legacyCount = !userId ? localStorage.getItem('anki_today_count') : null;

  const dailyLimit = parseInt(localStorage.getItem(`${prefix}daily_limit`) || legacyLimit || '60', 10);
  const maxActiveUnknown = parseInt(localStorage.getItem(`${prefix}max_active_unknown`) || '5', 10);

  const savedDate = localStorage.getItem(`${prefix}today_date`) || legacyDate;
  const today = getTodayKey();
  let dailyReviewedCount = 0;

  if (savedDate === today) {
    dailyReviewedCount = parseInt(localStorage.getItem(`${prefix}today_count`) || legacyCount || '0', 10);
  } else {
    localStorage.setItem(`${prefix}today_date`, today);
    localStorage.setItem(`${prefix}today_count`, '0');
  }

  let activeCardKeys: string[] = [];
  try {
    const rawKeys = localStorage.getItem(`${prefix}active_card_keys`);
    if (rawKeys) {
      const parsed = JSON.parse(rawKeys);
      if (Array.isArray(parsed)) activeCardKeys = parsed.map(String);
    }
  } catch {
    activeCardKeys = [];
  }

  let reviewHistory: Record<string, number> = {};
  try {
    const rawHistory = localStorage.getItem(`${prefix}review_history`);
    if (rawHistory) {
      const parsed = JSON.parse(rawHistory);
      if (parsed && typeof parsed === 'object') reviewHistory = parsed;
    }
  } catch {
    reviewHistory = {};
  }

  const activeDeckKey = localStorage.getItem(`${prefix}active_deck_key`) || '';
  const currentStreak = parseInt(localStorage.getItem(`${prefix}current_streak`) || '0', 10);
  const bestStreak = parseInt(localStorage.getItem(`${prefix}best_streak`) || '0', 10);
  const lastStudyDate = localStorage.getItem(`${prefix}last_study_date`) || '';

  return {
    dailyLimit: Number.isNaN(dailyLimit) ? 60 : dailyLimit,
    dailyReviewedCount: Number.isNaN(dailyReviewedCount) ? 0 : dailyReviewedCount,
    activeDeckKey,
    maxActiveUnknown: Number.isNaN(maxActiveUnknown) ? 5 : maxActiveUnknown,
    activeCardKeys,
    currentStreak: Number.isNaN(currentStreak) ? 0 : currentStreak,
    bestStreak: Number.isNaN(bestStreak) ? 0 : bestStreak,
    lastStudyDate,
    reviewHistory,
  };
}

export function saveLocalDailyStats(userId: string | null, stats: DailyStats): void {
  const prefix = getStoragePrefix(userId);
  localStorage.setItem(`${prefix}daily_limit`, String(stats.dailyLimit));
  localStorage.setItem(`${prefix}today_date`, getTodayKey());
  localStorage.setItem(`${prefix}today_count`, String(stats.dailyReviewedCount));
  localStorage.setItem(`${prefix}active_deck_key`, stats.activeDeckKey || '');
  localStorage.setItem(`${prefix}max_active_unknown`, String(stats.maxActiveUnknown));
  localStorage.setItem(`${prefix}active_card_keys`, JSON.stringify(stats.activeCardKeys || []));
  localStorage.setItem(`${prefix}current_streak`, String(stats.currentStreak || 0));
  localStorage.setItem(`${prefix}best_streak`, String(stats.bestStreak || 0));
  localStorage.setItem(`${prefix}last_study_date`, stats.lastStudyDate || '');
  localStorage.setItem(`${prefix}review_history`, JSON.stringify(stats.reviewHistory || {}));
}

export function loadSpeechSettings(): SpeechSettings {
  const savedEngine = localStorage.getItem('anki_tts_engine');
  return {
    engine: savedEngine === 'system' ? 'system' : 'google',
    voiceName: localStorage.getItem('anki_de_voice_name') || '',
    googleVoiceName: localStorage.getItem('anki_google_voice') || 'de-DE-Wavenet-C',
    googleApiKey: localStorage.getItem('anki_google_tts_key') || '',
    rate: parseFloat(localStorage.getItem('anki_speech_rate') || '0.92') || 0.92,
    pitch: parseFloat(localStorage.getItem('anki_speech_pitch') || '1.0') || 1.0,
    autoPlay: localStorage.getItem('anki_autoplay') !== 'false',
  };
}

export function saveSpeechSettings(settings: SpeechSettings): void {
  localStorage.setItem('anki_tts_engine', settings.engine);
  if (settings.voiceName) localStorage.setItem('anki_de_voice_name', settings.voiceName);
  localStorage.setItem('anki_google_voice', settings.googleVoiceName);
  localStorage.setItem('anki_google_tts_key', settings.googleApiKey.trim());
  localStorage.setItem('anki_speech_rate', String(settings.rate));
  localStorage.setItem('anki_speech_pitch', String(settings.pitch));
  localStorage.setItem('anki_autoplay', String(settings.autoPlay));
}
