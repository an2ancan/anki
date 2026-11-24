import { createClient } from '@supabase/supabase-js';
import type { Card, DailyStats, SpeechSettings } from '../types';
import { DEFAULT_CORPUS } from '../data/defaultCorpus';
import { getDefaultDeck, normalizeCard } from './srs';
import { mergeReviewHistories } from './stats';
import { getTodayKey } from './storage';

export const SUPABASE_URL = 'https://cvvjnztfqsnipldixbzd.supabase.co';
export const SUPABASE_ANON_KEY = 'sb_publishable_TGjo5mNuueYhv4EaI_8vWQ_wopUkkvX';

export const supabase = createClient(SUPABASE_URL, SUPABASE_ANON_KEY);

interface SupabaseCardRow {
  id?: string;
  user_id: string;
  card_key: string;
  german: string;
  russian: string;
  example_de: string;
  example_ru: string;
  context: string;
  tags: string;
  is_custom: boolean;
  reps: number;
  interval: number;
  next_review: number;
  updated_at: string;
}

function cardToRow(userId: string, card: Card): SupabaseCardRow {
  return {
    user_id: userId,
    card_key: card.cardKey,
    german: card.german,
    russian: card.russian,
    example_de: card.example_de || '',
    example_ru: card.example_ru || '',
    context: card.context || '',
    tags: card.tags || '',
    is_custom: Boolean(card.isCustom),
    reps: Number(card.reps) || 0,
    interval: Number(card.interval) || 0,
    next_review: Number(card.nextReview) || 0,
    updated_at: new Date(card.updatedAt || Date.now()).toISOString(),
  };
}

function rowToCard(row: SupabaseCardRow): Card {
  const defaultMatch = DEFAULT_CORPUS.find((c) => `default_${c.id}` === row.card_key);
  return normalizeCard({
    id: defaultMatch ? defaultMatch.id : row.id,
    cardKey: row.card_key,
    german: row.german,
    russian: row.russian,
    example_de: row.example_de,
    example_ru: row.example_ru,
    context: row.context,
    tags: row.tags,
    isCustom: row.is_custom,
    reps: row.reps,
    interval: row.interval,
    nextReview: row.next_review,
    updatedAt: row.updated_at ? Date.parse(row.updated_at) : Date.now(),
  });
}

export async function syncProfileToSupabase(
  userId: string,
  stats: DailyStats,
  speech?: SpeechSettings
): Promise<void> {
  const payload: Record<string, unknown> = {
    user_id: userId,
    daily_limit: stats.dailyLimit,
    today_date: getTodayKey(),
    today_count: stats.dailyReviewedCount,
    max_active_unknown: stats.maxActiveUnknown,
    active_card_keys: stats.activeCardKeys,
    current_streak: stats.currentStreak,
    best_streak: stats.bestStreak,
    last_study_date: stats.lastStudyDate,
    review_history: stats.reviewHistory,
    updated_at: new Date().toISOString(),
  };
  if (speech) {
    payload.tts_engine = speech.engine;
    payload.google_voice = speech.googleVoiceName;
    payload.google_tts_key = speech.googleApiKey.trim();
  }
  const { error } = await supabase.from('user_profiles').upsert(payload, { onConflict: 'user_id' });
  if (error) throw error;
}

export async function syncCardsToSupabase(userId: string, cards: Card[]): Promise<void> {
  if (cards.length === 0) return;
  const rows = cards.map((c) => cardToRow(userId, c));
  const { error } = await supabase
    .from('user_cards')
    .upsert(rows, { onConflict: 'user_id,card_key' });
  if (error) throw error;
}

export async function deleteCardFromSupabase(userId: string, cardKey: string): Promise<void> {
  const { error } = await supabase
    .from('user_cards')
    .delete()
    .eq('user_id', userId)
    .eq('card_key', cardKey);
  if (error) throw error;
}

export async function fullSyncWithSupabase(
  userId: string,
  localDeck: Card[],
  localStats: DailyStats,
  localSpeech: SpeechSettings
): Promise<{ mergedDeck: Card[]; mergedStats: DailyStats; mergedSpeech: SpeechSettings }> {
  const today = getTodayKey();
  const [profileRes, cardsRes] = await Promise.all([
    supabase.from('user_profiles').select('*').eq('user_id', userId).maybeSingle(),
    supabase.from('user_cards').select('*').eq('user_id', userId),
  ]);

  if (profileRes.error) throw profileRes.error;
  if (cardsRes.error) throw cardsRes.error;

  const mergedStats: DailyStats = { ...localStats };
  const mergedSpeech: SpeechSettings = { ...localSpeech };

  if (profileRes.data) {
    if (profileRes.data.daily_limit >= 5) {
      mergedStats.dailyLimit = profileRes.data.daily_limit;
    }
    if (profileRes.data.today_date === today) {
      mergedStats.dailyReviewedCount = Math.max(
        mergedStats.dailyReviewedCount,
        Number(profileRes.data.today_count) || 0
      );
    }
    if (profileRes.data.max_active_unknown >= 1) {
      mergedStats.maxActiveUnknown = Number(profileRes.data.max_active_unknown);
    }
    if (Array.isArray(profileRes.data.active_card_keys) && profileRes.data.active_card_keys.length > 0) {
      mergedStats.activeCardKeys = profileRes.data.active_card_keys.map(String);
    }
    if (profileRes.data.review_history && typeof profileRes.data.review_history === 'object') {
      mergedStats.reviewHistory = mergeReviewHistories(
        mergedStats.reviewHistory,
        profileRes.data.review_history as Record<string, number>
      );
    }
    mergedStats.bestStreak = Math.max(
      mergedStats.bestStreak,
      Number(profileRes.data.best_streak) || 0
    );
    const remoteDate = String(profileRes.data.last_study_date || '');
    if (remoteDate > mergedStats.lastStudyDate) {
      mergedStats.lastStudyDate = remoteDate;
      mergedStats.currentStreak = Number(profileRes.data.current_streak) || 0;
    } else if (remoteDate === mergedStats.lastStudyDate) {
      mergedStats.currentStreak = Math.max(
        mergedStats.currentStreak,
        Number(profileRes.data.current_streak) || 0
      );
    }
    if (profileRes.data.google_tts_key && !mergedSpeech.googleApiKey) {
      mergedSpeech.googleApiKey = String(profileRes.data.google_tts_key);
    }
    if (profileRes.data.google_voice) {
      mergedSpeech.googleVoiceName = String(profileRes.data.google_voice);
    }
    if (profileRes.data.tts_engine === 'google' || profileRes.data.tts_engine === 'system') {
      if (profileRes.data.google_tts_key || !mergedSpeech.googleApiKey) {
        mergedSpeech.engine = profileRes.data.tts_engine;
      }
    }
  }
  await syncProfileToSupabase(userId, mergedStats, mergedSpeech);

  const mergedMap = new Map<string, Card>();
  getDefaultDeck().forEach((c) => mergedMap.set(c.cardKey, c));

  localDeck.forEach((localCard) => {
    const normalized = normalizeCard(localCard);
    const existing = mergedMap.get(normalized.cardKey);
    if (!existing || normalized.isCustom || normalized.reps > 0 || normalized.updatedAt > existing.updatedAt) {
      mergedMap.set(normalized.cardKey, normalized);
    }
  });

  const remoteMap = new Map<string, Card>();
  ((cardsRes.data as SupabaseCardRow[]) || []).forEach((row) => {
    const remoteCard = rowToCard(row);
    remoteMap.set(remoteCard.cardKey, remoteCard);
    const localCard = mergedMap.get(remoteCard.cardKey);
    if (!localCard || remoteCard.updatedAt >= localCard.updatedAt) {
      mergedMap.set(remoteCard.cardKey, remoteCard);
    }
  });

  const toPush: Card[] = [];
  mergedMap.forEach((card) => {
    const remoteCard = remoteMap.get(card.cardKey);
    const hasLocalProgress = card.isCustom || card.reps > 0 || card.updatedAt > 0;
    if (hasLocalProgress && (!remoteCard || card.updatedAt > remoteCard.updatedAt)) {
      toPush.push(card);
    }
  });

  if (toPush.length > 0) {
    await syncCardsToSupabase(userId, toPush);
  }

  return { mergedDeck: Array.from(mergedMap.values()), mergedStats, mergedSpeech };
}
