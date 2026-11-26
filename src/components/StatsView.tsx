import type { Card, DailyStats, ProgressFilter } from '../types';
import { getDateKeyOffset, getEffectiveStreak } from '../lib/stats';
import { DAY_MS, getCardStage } from '../lib/srs';
import { useI18n } from '../lib/I18nContext';

interface StatsViewProps {
  deck: Card[];
  stats: DailyStats;
  onBackToStudy: () => void;
  onOpenProgress: (filter: ProgressFilter) => void;
}

export function StatsView({ deck, stats, onBackToStudy, onOpenProgress }: StatsViewProps) {
  const { t } = useI18n();
  const now = new Date();
  const effectiveStreak = getEffectiveStreak(stats, now);
  const history = stats.reviewHistory || {};

  const last14Days = Array.from({ length: 14 }, (_, idx) => {
    const offset = idx - 13;
    const key = getDateKeyOffset(offset, now);
    const d = new Date(now);
    d.setDate(d.getDate() + offset);
    const label = `${d.getDate()}.${String(d.getMonth() + 1).padStart(2, '0')}`;
    const count = history[key] || 0;
    return { key, label, count, isToday: offset === 0 };
  });

  const maxDayCount = Math.max(stats.dailyLimit, ...last14Days.map((d) => d.count), 10);
  const totalReviews = Object.values(history).reduce((acc, n) => acc + (Number(n) || 0), 0);
  const activeDaysCount = Object.values(history).filter((n) => n > 0).length;
  const avgPerActiveDay = activeDaysCount > 0 ? Math.round(totalReviews / activeDaysCount) : 0;

  const total = deck.length;
  const mastered = deck.filter((c) => getCardStage(c) === 'mastered').length;
  const learning = deck.filter((c) => getCardStage(c) === 'learning').length;
  const unlearned = deck.filter((c) => getCardStage(c) === 'new').length;
  const masteredPct = total > 0 ? Math.round((mastered / total) * 100) : 0;
  const learningPct = total > 0 ? Math.round((learning / total) * 100) : 0;

  const startOfTomorrow = new Date(now);
  startOfTomorrow.setHours(24, 0, 0, 0);
  const forecast = Array.from({ length: 7 }, (_, i) => {
    const from = startOfTomorrow.getTime() + i * DAY_MS;
    const to = from + DAY_MS;
    const count = deck.filter((c) => c.nextReview >= from && c.nextReview < to).length;
    const d = new Date(from);
    const label = i === 0 ? t.tomorrow : `${d.getDate()}.${String(d.getMonth() + 1).padStart(2, '0')}`;
    return { label, count };
  });
  const maxForecast = Math.max(...forecast.map((f) => f.count), 5);

  return (
    <div className="flex-1 overflow-y-auto py-1 space-y-3.5 pb-6">
      <div className="flex items-center justify-between">
        <h2 className="text-base font-black tracking-tight">{t.statsTitle}</h2>
        <button
          type="button"
          onClick={onBackToStudy}
          className="px-3.5 py-2 bg-blue-600 hover:bg-blue-700 text-white rounded-xl text-xs font-bold transition"
        >
          {t.backToCards}
        </button>
      </div>

      <div className="grid grid-cols-2 gap-2.5">
        <div className="bg-white dark:bg-slate-900 border border-slate-200 dark:border-slate-800 rounded-2xl p-3.5 shadow-sm">
          <div className="text-xs font-bold uppercase tracking-wider text-orange-500">
            {t.currentStreak}
          </div>
          <div className="text-2xl font-black mt-1 flex items-baseline gap-1 tabular-nums">
            <span>🔥 {effectiveStreak}</span>
            <span className="text-xs font-semibold text-slate-400">{t.unitDay}</span>
          </div>
          <div className="text-xs text-slate-500 dark:text-slate-400 mt-1">
            {t.recordPrefix}: 🏆 {stats.bestStreak} {t.unitDay}
          </div>
        </div>

        <div className="bg-white dark:bg-slate-900 border border-slate-200 dark:border-slate-800 rounded-2xl p-3.5 shadow-sm">
          <div className="text-xs font-bold uppercase tracking-wider text-blue-500">
            {t.totalReviews}
          </div>
          <div className="text-2xl font-black mt-1 tabular-nums">{totalReviews}</div>
          <div className="text-xs text-slate-500 dark:text-slate-400 mt-1">
            {t.avgPerDay}: {avgPerActiveDay} {t.perActiveDay}
          </div>
        </div>
      </div>

      <div className="bg-white dark:bg-slate-900 border border-slate-200 dark:border-slate-800 rounded-2xl p-4 shadow-sm">
        <div className="flex items-center justify-between mb-3">
          <span className="text-sm font-bold">{t.activity14Days}</span>
          <span className="text-xs text-slate-500 dark:text-slate-400">
            {t.goalLabel}: {stats.dailyLimit} {t.perDay}
          </span>
        </div>
        <div className="flex items-end justify-between gap-1 h-32 pt-2">
          {last14Days.map((day) => {
            const heightPct = Math.round((day.count / maxDayCount) * 100);
            const hitGoal = day.count >= stats.dailyLimit;
            return (
              <div key={day.key} className="flex-1 flex flex-col items-center h-full justify-end group">
                <div className="text-[10px] text-slate-500 dark:text-slate-400 mb-0.5 font-semibold tabular-nums">
                  {day.count > 0 ? day.count : ''}
                </div>
                <div className="w-full flex-1 flex items-end">
                  <div
                    title={`${day.label}: ${day.count}`}
                    className={`w-full rounded-t-md transition-all duration-300 ${
                      hitGoal
                        ? 'bg-emerald-500'
                        : day.count > 0
                          ? day.isToday
                            ? 'bg-blue-600'
                            : 'bg-blue-400 dark:bg-blue-500'
                          : 'bg-slate-200 dark:bg-slate-800'
                    }`}
                    style={{ height: `${Math.max(day.count > 0 ? 10 : 4, heightPct)}%` }}
                  />
                </div>
                <div
                  className={`text-[10px] mt-1 tabular-nums ${
                    day.isToday ? 'font-black text-blue-600 dark:text-blue-400' : 'text-slate-400'
                  }`}
                >
                  {day.label.split('.')[0]}
                </div>
              </div>
            );
          })}
        </div>
      </div>

      <div className="bg-white dark:bg-slate-900 border border-slate-200 dark:border-slate-800 rounded-2xl p-4 shadow-sm space-y-3">
        <div className="flex items-center justify-between">
          <span className="text-sm font-bold">
            {t.deckMastery} ({masteredPct}%)
          </span>
          <button
            type="button"
            onClick={() => onOpenProgress('all')}
            className="text-xs font-bold text-blue-600 dark:text-blue-400 hover:underline"
          >
            {t.allCardsLink}
          </button>
        </div>

        <div className="w-full h-2.5 rounded-full bg-slate-200 dark:bg-slate-800 overflow-hidden flex">
          <div className="bg-emerald-500 h-full" style={{ width: `${masteredPct}%` }} />
          <div
            className="bg-amber-400 h-full"
            style={{ width: `${Math.min(100 - masteredPct, learningPct)}%` }}
          />
        </div>

        <div className="grid grid-cols-3 gap-2 text-center">
          <button
            type="button"
            onClick={() => onOpenProgress('mastered')}
            className="p-2.5 rounded-xl bg-emerald-50 dark:bg-emerald-950/40 text-emerald-700 dark:text-emerald-300 font-bold"
          >
            <div className="text-lg font-black tabular-nums">{mastered}</div>
            <div className="text-xs">{t.masteredLabel}</div>
          </button>
          <button
            type="button"
            onClick={() => onOpenProgress('learning')}
            className="p-2.5 rounded-xl bg-amber-50 dark:bg-amber-950/40 text-amber-700 dark:text-amber-300 font-bold"
          >
            <div className="text-lg font-black tabular-nums">{learning}</div>
            <div className="text-xs">{t.learningLabel}</div>
          </button>
          <button
            type="button"
            onClick={() => onOpenProgress('new')}
            className="p-2.5 rounded-xl bg-blue-50 dark:bg-blue-950/40 text-blue-700 dark:text-blue-300 font-bold"
          >
            <div className="text-lg font-black tabular-nums">{unlearned}</div>
            <div className="text-xs">{t.newLabel}</div>
          </button>
        </div>
      </div>

      <div className="bg-white dark:bg-slate-900 border border-slate-200 dark:border-slate-800 rounded-2xl p-4 shadow-sm">
        <div className="text-sm font-bold mb-3">{t.forecast7Days}</div>
        <div className="grid grid-cols-7 gap-1.5 items-end h-24">
          {forecast.map((f) => {
            const pct = Math.round((f.count / maxForecast) * 100);
            return (
              <div key={f.label} className="flex flex-col items-center h-full justify-end">
                <div className="text-[10px] text-slate-500 dark:text-slate-400 font-semibold mb-0.5 tabular-nums">
                  {f.count > 0 ? f.count : ''}
                </div>
                <div className="w-full flex-1 flex items-end">
                  <div
                    className={`w-full rounded-t-md ${
                      f.count > 0 ? 'bg-indigo-500' : 'bg-slate-200 dark:bg-slate-800'
                    }`}
                    style={{ height: `${Math.max(f.count > 0 ? 14 : 6, pct)}%` }}
                  />
                </div>
                <div className="text-[10px] text-slate-400 mt-1 truncate max-w-full">{f.label}</div>
              </div>
            );
          })}
        </div>
      </div>
    </div>
  );
}
