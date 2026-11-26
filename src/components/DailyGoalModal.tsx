import { useI18n } from '../lib/I18nContext';

interface DailyGoalModalProps {
  isOpen: boolean;
  reviewedCount: number;
  dailyLimit: number;
  streak: number;
  onContinue: () => void;
  onOpenStats: () => void;
  onClose: () => void;
}

const CONFETTI_PIECES = [
  { left: '6%', color: '#3b82f6', w: 8, h: 12, delay: '0s', dur: '2.1s' },
  { left: '14%', color: '#f59e0b', w: 10, h: 7, delay: '0.15s', dur: '2.4s' },
  { left: '22%', color: '#10b981', w: 7, h: 11, delay: '0.05s', dur: '2.0s' },
  { left: '30%', color: '#ec4899', w: 9, h: 9, delay: '0.25s', dur: '2.3s' },
  { left: '38%', color: '#6366f1', w: 8, h: 13, delay: '0.1s', dur: '2.5s' },
  { left: '46%', color: '#f97316', w: 10, h: 8, delay: '0.3s', dur: '2.2s' },
  { left: '54%', color: '#14b8a6', w: 8, h: 12, delay: '0.08s', dur: '2.1s' },
  { left: '62%', color: '#eab308', w: 9, h: 7, delay: '0.22s', dur: '2.4s' },
  { left: '70%', color: '#8b5cf6', w: 7, h: 12, delay: '0.12s', dur: '2.3s' },
  { left: '78%', color: '#ef4444', w: 10, h: 8, delay: '0.28s', dur: '2.0s' },
  { left: '86%', color: '#3b82f6', w: 8, h: 11, delay: '0.04s', dur: '2.5s' },
  { left: '93%', color: '#10b981', w: 9, h: 9, delay: '0.18s', dur: '2.2s' },
  { left: '18%', color: '#a855f7', w: 7, h: 10, delay: '0.45s', dur: '2.3s' },
  { left: '42%', color: '#22c55e', w: 9, h: 7, delay: '0.5s', dur: '2.4s' },
  { left: '66%', color: '#f43f5e', w: 8, h: 11, delay: '0.4s', dur: '2.1s' },
  { left: '82%', color: '#06b6d4', w: 10, h: 8, delay: '0.55s', dur: '2.3s' },
];

export function DailyGoalModal({
  isOpen,
  reviewedCount,
  dailyLimit,
  streak,
  onContinue,
  onOpenStats,
  onClose,
}: DailyGoalModalProps) {
  const { t } = useI18n();

  if (!isOpen) return null;

  return (
    <div
      role="dialog"
      aria-modal="true"
      aria-labelledby="dailyGoalTitle"
      onClick={(e) => e.target === e.currentTarget && onClose()}
      className="fixed inset-0 bg-slate-900/65 backdrop-blur-sm z-50 flex items-center justify-center p-4"
    >
      <div className="relative overflow-hidden bg-white dark:bg-slate-900 border border-emerald-200/80 dark:border-emerald-800/60 w-full max-w-sm rounded-3xl p-6 shadow-2xl text-center animate-reveal">
        {/* Pure-CSS Confetti Overlay */}
        <div className="absolute inset-0 overflow-hidden pointer-events-none" aria-hidden="true">
          {CONFETTI_PIECES.map((p, idx) => (
            <span
              key={idx}
              className="confetti-piece"
              style={
                {
                  left: p.left,
                  width: `${p.w}px`,
                  height: `${p.h}px`,
                  backgroundColor: p.color,
                  '--delay': p.delay,
                  '--dur': p.dur,
                } as React.CSSProperties
              }
            />
          ))}
        </div>

        <div className="relative z-10 space-y-4">
          <div className="w-16 h-16 mx-auto rounded-2xl bg-gradient-to-br from-emerald-400 to-teal-600 text-white flex items-center justify-center text-3xl shadow-lg shadow-emerald-500/30 animate-pop">
            🎉
          </div>

          <div className="space-y-2">
            <h3
              id="dailyGoalTitle"
              className="text-xl font-extrabold tracking-tight text-slate-900 dark:text-white text-balance"
            >
              {t.goalCelebrationTitle}
            </h3>
            <p className="text-sm text-slate-600 dark:text-slate-300 leading-relaxed text-balance">
              {t.goalCelebrationBody(reviewedCount, dailyLimit)}
            </p>
          </div>

          <div className="inline-flex items-center gap-3 px-4 py-2 rounded-2xl bg-emerald-50 dark:bg-emerald-950/50 border border-emerald-200/70 dark:border-emerald-800/60 text-xs font-bold tabular-nums">
            <span className="text-emerald-700 dark:text-emerald-300">
              ✓ {reviewedCount}/{dailyLimit}
            </span>
            <span className="text-slate-300 dark:text-slate-700">|</span>
            <span className="text-orange-600 dark:text-orange-300">
              🔥 {streak} {t.unitDay}
            </span>
          </div>

          <div className="space-y-2 pt-1">
            <button
              type="button"
              onClick={onContinue}
              className="w-full py-3.5 bg-gradient-to-r from-blue-600 to-indigo-600 hover:from-blue-700 hover:to-indigo-700 text-white font-bold text-sm rounded-2xl shadow-lg shadow-blue-600/25 active:scale-[0.98] transition"
            >
              {t.goalCelebrationContinue}
            </button>
            <button
              type="button"
              onClick={onOpenStats}
              className="w-full py-2.5 bg-slate-100 dark:bg-slate-800 hover:bg-slate-200 dark:hover:bg-slate-700 text-slate-700 dark:text-slate-200 font-bold text-xs rounded-xl transition"
            >
              {t.goalCelebrationStats}
            </button>
          </div>
        </div>
      </div>
    </div>
  );
}
