import type { Card, Rating } from '../types';
import { DEFAULT_CORPUS } from '../data/defaultCorpus';

export const MINUTE_MS = 60 * 1000;
export const DAY_MS = 24 * 60 * 60 * 1000;
export const HARD_UNKNOWN_MINUTES = 15;

export function generateCustomKey(): string {
  if (typeof window !== 'undefined' && window.crypto && typeof window.crypto.randomUUID === 'function') {
    return `custom_${window.crypto.randomUUID()}`;
  }
  return `custom_${Date.now()}_${Math.random().toString(36).slice(2, 10)}`;
}

export function normalizeCard(card: Partial<Card> & { id?: number | string }, fallbackIndex = 0): Card {
  const isDefaultId =
    typeof card.id === 'number' &&
    card.id >= 1 &&
    card.id <= DEFAULT_CORPUS.length &&
    !card.isCustom;

  return {
    id: card.id ?? Date.now() + fallbackIndex,
    cardKey: card.cardKey || (isDefaultId ? `default_${card.id}` : generateCustomKey()),
    german: String(card.german || '').trim(),
    russian: String(card.russian || '').trim(),
    example_de: String(card.example_de || '').trim(),
    example_ru: String(card.example_ru || '').trim(),
    context: String(card.context || '').trim(),
    tags: String(card.tags || '').trim(),
    isCustom: Boolean(card.isCustom ?? !isDefaultId),
    reps: Number(card.reps) || 0,
    interval: Number(card.interval) || 0,
    nextReview: Number(card.nextReview) || 0,
    updatedAt: Number(card.updatedAt) || 0,
  };
}

export function getDefaultDeck(): Card[] {
  return DEFAULT_CORPUS.map((c, idx) =>
    normalizeCard({ ...c, cardKey: `default_${c.id}`, isCustom: false, updatedAt: 0 }, idx)
  );
}

export function getEndOfTodayMs(now = Date.now()): number {
  const d = new Date(now);
  d.setHours(23, 59, 59, 999);
  return d.getTime();
}

/**
 * Unknown word: either never learned (reps === 0) or still scheduled to be repeated today.
 */
export function isUnknownCard(card: Card, now = Date.now()): boolean {
  if (card.reps === 0) return true;
  if (!card.nextReview || card.nextReview <= getEndOfTodayMs(now)) return true;
  return false;
}

export function getRatingPreviewLabels(card: Card, now = Date.now()): Record<Rating, string> {
  const unknown = isUnknownCard(card, now);
  const baseInterval = card.interval || 1;
  const hardLabel = unknown
    ? `${HARD_UNKNOWN_MINUTES} мин`
    : `${Math.max(1, Math.round(baseInterval * 1.2))} дн.`;
  const goodDays = Math.max(2, Math.round(baseInterval * 2.0));
  const easyDays = Math.max(4, Math.round(baseInterval * 2.8));

  return {
    again: '1 мин',
    hard: hardLabel,
    good: `${goodDays} дн.`,
    easy: `${easyDays} дн.`,
  };
}

export interface RateResult {
  updatedCard: Card;
  requeueInSession: boolean;
  requeueDelaySlots: number;
}

export function applyCardRating(card: Card, rate: Rating, now = Date.now()): RateResult {
  const updated: Card = { ...card, updatedAt: now };
  const unknown = isUnknownCard(card, now);

  if (rate === 'again') {
    updated.reps = 0;
    updated.interval = 0;
    updated.nextReview = now + MINUTE_MS;
    return { updatedCard: updated, requeueInSession: true, requeueDelaySlots: 3 };
  }

  if (rate === 'hard') {
    if (unknown) {
      // Unknown word: repeat in 15 minutes today and keep it in the active session
      updated.reps = Math.max(0, card.reps);
      updated.interval = 0;
      updated.nextReview = now + HARD_UNKNOWN_MINUTES * MINUTE_MS;
      return { updatedCard: updated, requeueInSession: true, requeueDelaySlots: 6 };
    }
    updated.reps = (card.reps || 0) + 1;
    updated.interval = Math.max(1, (card.interval || 1) * 1.2);
    updated.nextReview = now + Math.round(updated.interval * DAY_MS);
    return { updatedCard: updated, requeueInSession: false, requeueDelaySlots: 0 };
  }

  if (rate === 'good') {
    updated.reps = (card.reps || 0) + 1;
    updated.interval = Math.max(2, (card.interval || 1) * 2.0);
    updated.nextReview = now + Math.round(updated.interval * DAY_MS);
    return { updatedCard: updated, requeueInSession: false, requeueDelaySlots: 0 };
  }

  // easy
  updated.reps = (card.reps || 0) + 2;
  updated.interval = Math.max(4, (card.interval || 1) * 2.8);
  updated.nextReview = now + Math.round(updated.interval * DAY_MS);
  return { updatedCard: updated, requeueInSession: false, requeueDelaySlots: 0 };
}

function shuffle<T>(arr: T[]): T[] {
  const copy = [...arr];
  for (let i = copy.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1));
    [copy[i], copy[j]] = [copy[j], copy[i]];
  }
  return copy;
}

/**
 * Builds the study queue while capping the number of simultaneously active unknown words
 * (due today + newly introduced) to `maxActiveUnknown`.
 */
export function buildSessionQueue(
  deck: Card[],
  dailyLimit: number,
  dailyReviewedCount: number,
  maxActiveUnknown: number,
  forceMore = false,
  now = Date.now()
): Card[] {
  const remainingToday = Math.max(0, dailyLimit - dailyReviewedCount);
  const sessionCap = forceMore ? Math.min(dailyLimit, 20) : remainingToday;

  if (sessionCap <= 0) return [];

  const endOfToday = getEndOfTodayMs(now);
  const dueToday = shuffle(
    deck.filter((c) => c.reps > 0 && (!c.nextReview || c.nextReview <= endOfToday))
  );
  const newCards = shuffle(deck.filter((c) => c.reps === 0));
  const futureCards = shuffle(deck.filter((c) => c.reps > 0 && c.nextReview > endOfToday));

  // Cap simultaneously active unknown cards (dueToday + newCards) to maxActiveUnknown
  const safeMaxUnknown = Math.max(1, maxActiveUnknown);
  const activeDue = dueToday.slice(0, safeMaxUnknown);
  const newSlots = Math.max(0, safeMaxUnknown - activeDue.length);
  const activeNew = newCards.slice(0, newSlots);

  const activePool = [...activeDue, ...activeNew];
  const pool = activePool.length > 0 ? activePool : forceMore ? futureCards : [];

  return pool.slice(0, sessionCap);
}

export function formatNextReview(card: Card, now = Date.now()): string {
  if (!card.reps && !card.nextReview) return 'Ещё не начато';
  if (!card.nextReview || card.nextReview <= now) return 'Повторить сейчас';
  const diffMinutes = Math.ceil((card.nextReview - now) / MINUTE_MS);
  if (diffMinutes < 60) return `Через ${diffMinutes} мин.`;
  const diffHours = Math.ceil(diffMinutes / 60);
  if (diffHours < 24) return `Через ${diffHours} ч.`;
  const diffDays = Math.ceil(diffHours / 24);
  return `Через ${diffDays} дн.`;
}
