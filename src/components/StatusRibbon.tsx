import { useI18n } from '../lib/I18nContext';

interface StatusRibbonProps {
  dailyReviewedCount: number;
  dailyLimit: number;
  streak: number;
  onOpenStats: () => void;
  onOpenQuickAdd: () => void;
}

export function StatusRibbon({
  dailyReviewedCount,
  dailyLimit,
  streak,
  onOpenStats,
  onOpenQuickAdd,
}: StatusRibbonProps) {
  const { t } = useI18n();
  const goalReached = dailyReviewedCount >= dailyLimit;
  const dailyProgressPercent =
    dailyLimit > 0 ? Math.min(100, Math.round((dailyReviewedCount / dailyLimit) * 100)) : 100;

  return (
    <div className="flex-none max-w-lg w-full mx-auto px-3.5 pt-2.5">
      <div className="flex items-center justify-between gap-2 text-xs font-medium text-slate-500 dark:text-slate-400">
        <div className="flex items-center gap-1.5 flex-none">
          <button
            type="button"
            onClick={onOpenStats}
            className={`flex items-center gap-1.5 px-2.5 py-1 rounded-full font-bold tabular-nums whitespace-nowrap hover:opacity-90 transition border ${
              goalReached
                ? 'bg-emerald-50 border-emerald-200/90 dark:bg-emerald-950/90 dark:border-emerald-800/60 text-emerald-700 dark:text-emerald-300'
                : 'bg-blue-50 border-blue-200/90 dark:bg-blue-950/90 dark:border-blue-800/60 text-blue-700 dark:text-blue-300'
            }`}
            title={t.openStatsTitle}
          >
            <span>
              {t.today}: {dailyReviewedCount}/{dailyLimit}
            </span>
            <svg className="w-3.5 h-3.5 opacity-80 flex-none" fill="none" stroke="currentColor" viewBox="0 0 24 24">
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
            className="px-2.5 py-1 rounded-full font-bold tabular-nums whitespace-nowrap bg-amber-50 border border-amber-200/90 dark:bg-orange-950/80 dark:border-orange-800/60 text-amber-800 dark:text-orange-300 hover:opacity-90 transition"
            title={t.streakTitle}
          >
            🔥 {streak}
          </button>
        </div>

        <button
          type="button"
          onClick={onOpenQuickAdd}
          className="w-8 h-8 rounded-full bg-gradient-to-r from-blue-600 to-indigo-600 hover:from-blue-700 hover:to-indigo-700 text-white shadow-sm shadow-blue-600/25 active:scale-95 transition flex items-center justify-center flex-none"
          title={t.quickAddTitle}
          aria-label={t.quickAddTitle}
        >
          <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2.5" d="M12 4v16m8-8H4" />
          </svg>
        </button>
      </div>

      <div className="w-full bg-stone-200/90 dark:bg-slate-800 rounded-full h-2 mt-2 overflow-hidden">
        <div
          className={`h-2 rounded-full transition-all duration-300 ${
            goalReached
              ? 'bg-gradient-to-r from-emerald-500 to-teal-500'
              : 'bg-gradient-to-r from-blue-600 to-indigo-500'
          }`}
          style={{ width: `${dailyProgressPercent}%` }}
        />
      </div>
    </div>
  );
}
