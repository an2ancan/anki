import type { Card, QueueItem, Rating, StudyMode } from '../types';
import { DEFAULT_CORPUS } from '../data/defaultCorpus';

export const MINUTE_MS = 60 * 1000;
export const DAY_MS = 24 * 60 * 60 * 1000;
export const HARD_UNKNOWN_MINUTES = 5;

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
  const goodDays = card.interval > 0 ? Math.max(2, Math.round(card.interval * 2.0)) : 1;
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
  delayUntilMs: number | null;
}

export function applyCardRating(card: Card, rate: Rating, now = Date.now()): RateResult {
  const updated: Card = { ...card, updatedAt: now };
  const unknown = isUnknownCard(card, now);

  if (rate === 'again') {
    updated.reps = 0;
    updated.interval = 0;
    updated.nextReview = now + MINUTE_MS;
    return { updatedCard: updated, requeueInSession: true, requeueDelaySlots: 3, delayUntilMs: null };
  }

  if (rate === 'hard') {
    if (unknown) {
      // Unknown word: hide from queue for 5 minutes, then return with top priority
      const readyAt = now + HARD_UNKNOWN_MINUTES * MINUTE_MS;
      updated.reps = Math.max(0, card.reps);
      updated.interval = 0;
      updated.nextReview = readyAt;
      return { updatedCard: updated, requeueInSession: false, requeueDelaySlots: 0, delayUntilMs: readyAt };
    }
    updated.reps = (card.reps || 0) + 1;
    updated.interval = Math.max(1, (card.interval || 1) * 1.2);
    updated.nextReview = now + Math.round(updated.interval * DAY_MS);
    return { updatedCard: updated, requeueInSession: false, requeueDelaySlots: 0, delayUntilMs: null };
  }

  if (rate === 'good') {
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

  // 1. Always prioritize hard/due-now cards first
  const priorityDue = deck
    .filter((c) => isHardDueNow(c))
    .sort((a, b) => a.nextReview - b.nextReview);

  const keptKeys: string[] = [];
  const seen = new Set<string>();

  for (const card of priorityDue) {
    if (keptKeys.length >= safeMax) break;
    keptKeys.push(card.cardKey);
    seen.add(card.cardKey);
  }

  // 2. Keep previously active eligible cards in their existing order
  for (const key of currentActiveKeys) {
    if (keptKeys.length >= safeMax) break;
    if (seen.has(key)) continue;
    const card = deckMap.get(key);
    if (card && isEligibleNow(card)) {
      keptKeys.push(key);
      seen.add(key);
    }
  }

  // 3. Fill remaining slots with brand-new cards (reps === 0, not on cooldown)
  if (keptKeys.length < safeMax) {
    const newCandidates = shuffle(
      deck.filter((c) => !seen.has(c.cardKey) && isNewReady(c))
    );
    for (const candidate of newCandidates) {
      if (keptKeys.length >= safeMax) break;
      keptKeys.push(candidate.cardKey);
      seen.add(candidate.cardKey);
    }
  }

  const activeCards = keptKeys
    .map((k) => deckMap.get(k))
    .filter((c): c is Card => Boolean(c));

  return { activeKeys: keptKeys, activeCards };
}

/**
 * Expands cards into QueueItems. In 'mixed' mode, each card gets BOTH sides ('de-ru' and 'ru-de')
 * shuffled so the two sides of the same word are separated when possible.
 */
export function expandCardsToQueueItems(cards: Card[], mode: StudyMode): QueueItem[] {
  if (mode !== 'mixed') {
    return cards.map((card) => ({ card, direction: mode }));
  }
  const firstPass: QueueItem[] = shuffle(cards).map((card) => ({ card, direction: 'de-ru' }));
  const secondPass: QueueItem[] = shuffle(cards).map((card) => ({ card, direction: 'ru-de' }));
  // Interleave so both sides are in the same queue without immediately repeating back-to-back
  const combined: QueueItem[] = [];
  for (let i = 0; i < Math.max(firstPass.length, secondPass.length); i++) {
    if (firstPass[i]) combined.push(firstPass[i]);
    if (secondPass[i]) combined.push(secondPass[i]);
  }
  return combined;
}

/**
 * Builds the study queue from the persistent active unknown queue.
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
  const futureCards = shuffle(deck.filter((c) => c.reps > 0 && c.nextReview > endOfToday));
  const poolCards = activeCards.length > 0 ? activeCards : forceMore ? futureCards : [];
  const items = expandCardsToQueueItems(poolCards, mode);

  return { queue: items.slice(0, sessionCap), activeKeys };
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
