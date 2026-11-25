import { DEFAULT_DECK_KEY, type Card, type QueueItem, type Rating, type StudyMode } from '../types';
import { translations, type Locale } from './i18n';

export const MINUTE_MS = 60 * 1000;
export const DAY_MS = 24 * 60 * 60 * 1000;
export const HARD_COOLDOWN_MINUTES = 5;
export const GOOD_FIRST_MINUTES = 10;

export function generateDeckKey(): string {
  if (typeof window !== 'undefined' && window.crypto && typeof window.crypto.randomUUID === 'function') {
    return `deck_${window.crypto.randomUUID()}`;
  }
  return `deck_${Date.now()}_${Math.random().toString(36).slice(2, 10)}`;
}

export function generateCustomKey(): string {
  if (typeof window !== 'undefined' && window.crypto && typeof window.crypto.randomUUID === 'function') {
    return `custom_${window.crypto.randomUUID()}`;
  }
  return `custom_${Date.now()}_${Math.random().toString(36).slice(2, 10)}`;
}

type LegacyCardInput = Partial<Card> & {
  id?: number | string;
  german?: string;
  russian?: string;
  example_de?: string;
  example_ru?: string;
};

export function normalizeCard(card: LegacyCardInput, fallbackIndex = 0): Card {
  return {
    id: card.id ?? Date.now() + fallbackIndex,
    deckKey: String(card.deckKey || DEFAULT_DECK_KEY).trim() || DEFAULT_DECK_KEY,
    cardKey: card.cardKey || generateCustomKey(),
    learning: String(card.learning ?? card.german ?? '').trim(),
    orig: String(card.orig ?? card.russian ?? '').trim(),
    example_learning: String(card.example_learning ?? card.example_de ?? '').trim(),
    example_orig: String(card.example_orig ?? card.example_ru ?? '').trim(),
    context: String(card.context || '').trim(),
    tags: String(card.tags || '').trim(),
    isCustom: Boolean(card.isCustom ?? true),
    reps: Number(card.reps) || 0,
    interval: Number(card.interval) || 0,
    nextReview: Number(card.nextReview) || 0,
    updatedAt: Number(card.updatedAt) || 0,
  };
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

export function getRatingPreviewLabels(card: Card, locale: Locale = 'ru'): Record<Rating, string> {
  const t = translations[locale];
  const baseInterval = card.interval || 1;
  const goodLabel =
    card.reps === 0
      ? `${GOOD_FIRST_MINUTES} ${t.unitMin}`
      : `${card.interval > 0 ? Math.max(2, Math.round(card.interval * 2.0)) : 1} ${t.unitDay}`;
  const easyDays = Math.max(4, Math.round(baseInterval * 2.8));

  return {
    again: `1 ${t.unitMin}`,
    hard: `${HARD_COOLDOWN_MINUTES} ${t.unitMin}`,
    good: goodLabel,
    easy: `${easyDays} ${t.unitDay}`,
  };
}

export interface RateResult {
  updatedCard: Card;
  requeueInSession: boolean;
  requeueDelaySlots: number;
  delayUntilMs: number | null;
}

export function applyCardRating(card: Card, rate: Rating, now = Date.now()): RateResult {
  const updated: Card = { ...card, updatedAt: now };

  if (rate === 'again') {
    // Reduce progress more than a single step (-2 reps) without resetting everything to 0,
    // and always keep the card in the active session queue.
    updated.reps = Math.max(0, (card.reps || 0) - 2);
    updated.interval = card.interval > 0 ? Math.max(0, Math.floor(card.interval * 0.4)) : 0;
    updated.nextReview = now + MINUTE_MS;
    return { updatedCard: updated, requeueInSession: true, requeueDelaySlots: 3, delayUntilMs: null };
  }

  if (rate === 'hard') {
    // Does not change progress (reps/interval stay the same); removes card from queue for 5 min.
    const readyAt = now + HARD_COOLDOWN_MINUTES * MINUTE_MS;
    updated.reps = card.reps || 0;
    updated.interval = card.interval || 0;
    updated.nextReview = readyAt;
    return { updatedCard: updated, requeueInSession: false, requeueDelaySlots: 0, delayUntilMs: readyAt };
  }

  if (rate === 'good') {
    if ((card.reps || 0) === 0) {
      // First "Good": remove from queue for 10 minutes
      const readyAt = now + GOOD_FIRST_MINUTES * MINUTE_MS;
      updated.reps = 1;
      updated.interval = 0;
      updated.nextReview = readyAt;
      return { updatedCard: updated, requeueInSession: false, requeueDelaySlots: 0, delayUntilMs: readyAt };
    }
    updated.reps = (card.reps || 0) + 1;
    updated.interval = card.interval > 0 ? Math.max(2, card.interval * 2.0) : 1;
    updated.nextReview = now + Math.round(updated.interval * DAY_MS);
    return { updatedCard: updated, requeueInSession: false, requeueDelaySlots: 0, delayUntilMs: null };
  }

  // easy
  updated.reps = (card.reps || 0) + 2;
  updated.interval = Math.max(4, (card.interval || 1) * 2.8);
  updated.nextReview = now + Math.round(updated.interval * DAY_MS);
  return { updatedCard: updated, requeueInSession: false, requeueDelaySlots: 0, delayUntilMs: null };
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
 * Reconciles the persistent active queue of new & hard/due-now cards (capped at `maxActiveUnknown`).
 * - Excludes cards currently on a short cooldown (e.g. 5-min "Hard" delay: nextReview > now).
 * - Prioritizes hard/due-now cards (nextReview > 0 && nextReview <= now) ahead of brand-new cards.
 */
export function reconcileActiveQueue(
  deck: Card[],
  currentActiveKeys: string[],
  maxActiveUnknown: number,
  now = Date.now()
): { activeKeys: string[]; activeCards: Card[] } {
  const safeMax = Math.max(1, maxActiveUnknown);
  const deckMap = new Map(deck.map((c) => [c.cardKey, c]));

  const isHardDueNow = (c: Card) => c.nextReview > 0 && c.nextReview <= now;
  const isNewReady = (c: Card) => c.reps === 0 && (!c.nextReview || c.nextReview <= now);
  const isEligibleNow = (c: Card) => isHardDueNow(c) || isNewReady(c);

  // 1. Reserve 10% of active slots (at least 1 when max >= 2 and new cards exist) for random new words
  const allNewReady = deck.filter((c) => isNewReady(c));
  const reservedNewSlots =
    safeMax >= 2 && allNewReady.length > 0
      ? Math.min(allNewReady.length, Math.max(1, Math.round(safeMax * 0.1)))
      : 0;
  const maxDueSlots = safeMax - reservedNewSlots;

  // Prioritize hard/due-now cards first (largest overdue gap `now - nextReview` first)
  const priorityDue = deck
    .filter((c) => isHardDueNow(c))
    .sort((a, b) => a.nextReview - b.nextReview);

  const keptKeys: string[] = [];
  const seen = new Set<string>();

  for (const card of priorityDue) {
    if (keptKeys.length >= maxDueSlots) break;
    keptKeys.push(card.cardKey);
    seen.add(card.cardKey);
  }

  // 2. Keep previously active eligible cards in their existing order (respecting the new-word reserve)
  for (const key of currentActiveKeys) {
    if (keptKeys.length >= safeMax) break;
    if (seen.has(key)) continue;
    const card = deckMap.get(key);
    if (!card || !isEligibleNow(card)) continue;
    if (isHardDueNow(card) && keptKeys.filter((k) => {
      const c = deckMap.get(k);
      return c ? isHardDueNow(c) : false;
    }).length >= maxDueSlots) {
      continue;
    }
    keptKeys.push(key);
    seen.add(key);
  }

  // 3. Fill remaining slots with random brand-new cards (at least the 10% reserve)
  if (keptKeys.length < safeMax) {
    const newCandidates = shuffle(allNewReady.filter((c) => !seen.has(c.cardKey)));
    for (const candidate of newCandidates) {
      if (keptKeys.length >= safeMax) break;
      keptKeys.push(candidate.cardKey);
      seen.add(candidate.cardKey);
    }
  }

  // 4. If slots are still free (e.g. fewer new cards than reserved), backfill with remaining due cards
  if (keptKeys.length < safeMax) {
    for (const card of priorityDue) {
      if (keptKeys.length >= safeMax) break;
      if (seen.has(card.cardKey)) continue;
      keptKeys.push(card.cardKey);
      seen.add(card.cardKey);
    }
  }

  const activeCards = keptKeys
    .map((k) => deckMap.get(k))
    .filter((c): c is Card => Boolean(c));

  return { activeKeys: keptKeys, activeCards };
}

/**
 * Expands priority-ordered cards into QueueItems while preserving time-based priority
 * (largest overdue gap `now - nextReview` appears earliest).
 * In 'mixed' mode, pass 1 shows all cards in priority order with alternating directions,
 * and pass 2 shows the opposite side in the same priority order so both sides are separated.
 */
export function expandCardsToQueueItems(cards: Card[], mode: StudyMode): QueueItem[] {
  if (mode !== 'mixed') {
    return cards.map((card) => ({ card, direction: mode }));
  }
  const firstPass: QueueItem[] = cards.map((card, i) => ({
    card,
    direction: i % 2 === 0 ? 'learning-orig' : 'orig-learning',
  }));
  const secondPass: QueueItem[] = cards.map((card, i) => ({
    card,
    direction: i % 2 === 0 ? 'orig-learning' : 'learning-orig',
  }));
  return [...firstPass, ...secondPass];
}

/**
 * Builds the study queue from the persistent active unknown queue, ordered by overdue time
 * (largest `now - nextReview` gap first).
 * In 'mixed' mode, `maxActiveUnknown` words (e.g. 5) produce `2 * maxActiveUnknown` items (10)
 * so both DE->RU and RU->DE sides are practiced in the same queue.
 */
export function buildSessionQueue(
  deck: Card[],
  dailyLimit: number,
  dailyReviewedCount: number,
  maxActiveUnknown: number,
  currentActiveKeys: string[] = [],
  mode: StudyMode = 'mixed',
  forceMore = false,
  now = Date.now()
): { queue: QueueItem[]; activeKeys: string[] } {
  const remainingToday = Math.max(0, dailyLimit - dailyReviewedCount);
  const sessionCap = forceMore ? Math.min(dailyLimit, 20) : remainingToday;

  const { activeKeys, activeCards } = reconcileActiveQueue(deck, currentActiveKeys, maxActiveUnknown, now);

  if (sessionCap <= 0) return { queue: [], activeKeys };

  const endOfToday = getEndOfTodayMs(now);
  const futureCards = deck
    .filter((c) => c.reps > 0 && c.nextReview > endOfToday)
    .sort((a, b) => a.nextReview - b.nextReview);
  const poolCards = activeCards.length > 0 ? activeCards : forceMore ? futureCards : [];
  const items = expandCardsToQueueItems(poolCards, mode);

  return { queue: items.slice(0, sessionCap), activeKeys };
}

export function formatNextReview(card: Card, locale: Locale = 'ru', now = Date.now()): string {
  const t = translations[locale];
  if (!card.reps && !card.nextReview) return t.notStarted;
  if (!card.nextReview || card.nextReview <= now) return t.reviewNow;
  const diffMinutes = Math.ceil((card.nextReview - now) / MINUTE_MS);
  if (diffMinutes < 60) return t.inTime(diffMinutes, t.unitMin);
  const diffHours = Math.ceil(diffMinutes / 60);
  if (diffHours < 24) return t.inTime(diffHours, t.unitHour);
  const diffDays = Math.ceil(diffHours / 24);
  return t.inTime(diffDays, t.unitDay);
}
