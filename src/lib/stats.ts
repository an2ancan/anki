import type { DailyStats } from '../types';
import { getTodayKey } from './storage';

export function getDateKeyOffset(daysOffset: number, baseDate = new Date()): string {
  const d = new Date(baseDate);
  d.setDate(d.getDate() + daysOffset);
  return `${d.getFullYear()}-${String(d.getMonth() + 1).padStart(2, '0')}-${String(d.getDate()).padStart(2, '0')}`;
}

/**
 * Returns the live displayed streak (0 if the user missed yesterday and hasn't studied today).
 */
export function getEffectiveStreak(stats: DailyStats, now = new Date()): number {
  const today = getDateKeyOffset(0, now);
  const yesterday = getDateKeyOffset(-1, now);
  if (stats.lastStudyDate === today || stats.lastStudyDate === yesterday) {
    return stats.currentStreak;
  }
  return 0;
}

/**
 * Records 1 completed review for today, updating streak counters and pruning history to 90 days.
 */
export function recordReviewInStats(stats: DailyStats, now = new Date()): DailyStats {
  const today = getDateKeyOffset(0, now);
  const yesterday = getDateKeyOffset(-1, now);

  let nextStreak = stats.currentStreak;
  if (stats.lastStudyDate === today) {
    nextStreak = Math.max(1, stats.currentStreak);
  } else if (stats.lastStudyDate === yesterday) {
    nextStreak = stats.currentStreak + 1;
  } else {
    nextStreak = 1;
  }

  const nextBest = Math.max(stats.bestStreak, nextStreak);
  const nextHistory: Record<string, number> = { ...(stats.reviewHistory || {}) };
  nextHistory[today] = (nextHistory[today] || 0) + 1;

  // Keep only the latest 90 days in history
  const cutoffKey = getDateKeyOffset(-90, now);
  for (const key of Object.keys(nextHistory)) {
    if (key < cutoffKey) delete nextHistory[key];
  }

  return {
    ...stats,
    dailyReviewedCount: stats.dailyReviewedCount + 1,
    currentStreak: nextStreak,
    bestStreak: nextBest,
    lastStudyDate: today,
    reviewHistory: nextHistory,
  };
}

export function mergeReviewHistories(
  a: Record<string, number>,
  b: Record<string, number>
): Record<string, number> {
  const merged: Record<string, number> = { ...a };
  for (const [date, count] of Object.entries(b)) {
    merged[date] = Math.max(merged[date] || 0, Number(count) || 0);
  }
  const today = getTodayKey();
  if (merged[today] === undefined) {
    // Keep clean
  }
  return merged;
}
