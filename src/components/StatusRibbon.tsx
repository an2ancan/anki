import type { ProgressFilter } from '../types';
import { useI18n } from '../lib/I18nContext';

interface StatusRibbonProps {
  dailyReviewedCount: number;
  dailyLimit: number;
  streak: number;
  newCount: number;
  learningCount: number;
  masteredCount: number;
  onOpenStats: () => void;
  onOpenProgress: (filter: ProgressFilter) => void;
}

export function StatusRibbon({
  dailyReviewedCount,
  dailyLimit,
  streak,
  newCount,
  learningCount,
  masteredCount,
  onOpenStats,
  onOpenProgress,
}: StatusRibbonProps) {
  const { t } = useI18n();
  const goalReached = dailyReviewedCount >= dailyLimit;
  const dailyProgressPercent =
    dailyLimit > 0 ? Math.min(100, Math.round((dailyReviewedCount / dailyLimit) * 100)) : 100;

  return (
    <div className="flex-none max-w-md w-full mx-auto px-3 pt-2">
      <div className="flex items-center justify-between gap-1 text-[11px] font-medium text-slate-500 dark:text-slate-400">
        <div className="flex items-center gap-1">
          <button
            type="button"
            onClick={onOpenStats}
            className={`flex items-center gap-1 px-2 py-0.5 rounded-md font-bold hover:opacity-90 transition ${
              goalReached
                ? 'bg-emerald-100 dark:bg-emerald-950 text-emerald-700 dark:text-emerald-300'
                : 'bg-blue-100 dark:bg-blue-950 text-blue-700 dark:text-blue-300'
            }`}
            title={t.openStatsTitle}
          >
            <span>
              {t.today}: {dailyReviewedCount}/{dailyLimit}
            </span>
            <svg className="w-3 h-3 opacity-75" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path
                strokeLinecap="round"
                strokeLinejoin="round"
                strokeWidth="2"
                d="M9 19v-6a2 2 0 00-2-2H5a2 2 0 00-2 2v6a2 2 0 002 2h2a2 2 0 002-2zm0 0V9a2 2 0 012-2h2a2 2 0 012 2v10m-6 0a2 2 0 002 2h2a2 2 0 002-2m0 0V5a2 2 0 012-2h2a2 2 0 012 2v14a2 2 0 01-2 2h-2a2 2 0 01-2-2z"
              />
            </svg>
          </button>

          <button
            type="button"
            onClick={onOpenStats}
            className="px-1.5 py-0.5 rounded-md font-bold bg-orange-100 dark:bg-orange-950/70 text-orange-700 dark:text-orange-300 hover:opacity-90 transition"
            title={t.streakTitle}
          >
            🔥 {streak}
          </button>
        </div>

        <div className="flex items-center gap-1 text-[10px]">
          <button
            type="button"
            onClick={() => onOpenProgress('new')}
            className="text-blue-600 dark:text-blue-400 hover:underline font-semibold"
          >
            {t.newLabel}: {newCount}
          </button>
          <span>•</span>
          <button
            type="button"
            onClick={() => onOpenProgress('learning')}
            className="text-amber-600 dark:text-amber-400 hover:underline font-semibold"
          >
            {t.learningLabel}: {learningCount}
          </button>
          <span>•</span>
          <button
            type="button"
            onClick={() => onOpenProgress('mastered')}
            className="text-emerald-600 dark:text-emerald-400 hover:underline font-semibold"
          >
            {t.masteredLabel}: {masteredCount}
          </button>
        </div>
      </div>

      <div className="w-full bg-slate-200 dark:bg-slate-800 rounded-full h-1.5 mt-1.5 overflow-hidden">
        <div
          className={`h-1.5 transition-all duration-300 ${goalReached ? 'bg-emerald-500' : 'bg-blue-600'}`}
          style={{ width: `${dailyProgressPercent}%` }}
        />
      </div>
    </div>
  );
}
