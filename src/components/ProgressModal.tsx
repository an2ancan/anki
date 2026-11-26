import { useState } from 'react';
import type { Card, ProgressFilter } from '../types';
import { formatNextReview, getCardStage, getEndOfTodayMs } from '../lib/srs';
import { useI18n } from '../lib/I18nContext';

interface ProgressModalProps {
  isOpen: boolean;
  onClose: () => void;
  deck: Card[];
  filter: ProgressFilter;
  onFilterChange: (filter: ProgressFilter) => void;
  onSpeak: (text: string) => void;
  onPracticeCard: (cardKey: string) => void;
  onResetCard: (cardKey: string) => void;
}

export function ProgressModal({
  isOpen,
  onClose,
  deck,
  filter,
  onFilterChange,
  onSpeak,
  onPracticeCard,
  onResetCard,
}: ProgressModalProps) {
  const { locale, t } = useI18n();
  const [search, setSearch] = useState('');

  if (!isOpen) return null;

  const filterLabels: Record<ProgressFilter, string> = {
    all: t.filterAll,
    mastered: t.filterMastered,
    learning: t.filterLearning,
    new: t.filterNew,
    custom: t.filterCustom,
  };

  const total = deck.length;
  const masteredCards = deck.filter((c) => getCardStage(c) === 'mastered');
  const learningCards = deck.filter((c) => getCardStage(c) === 'learning');
  const newCards = deck.filter((c) => getCardStage(c) === 'new');
  const customCards = deck.filter((c) => c.isCustom);
  const endOfToday = getEndOfTodayMs();
  const dueCount = deck.filter(
    (c) => getCardStage(c) !== 'new' && (!c.nextReview || c.nextReview <= endOfToday)
  ).length;

  const masteredPct = total > 0 ? Math.round((masteredCards.length / total) * 100) : 0;
  const learningPct = total > 0 ? Math.round((learningCards.length / total) * 100) : 0;

  const counts: Record<ProgressFilter, number> = {
    all: total,
    mastered: masteredCards.length,
    learning: learningCards.length,
    new: newCards.length,
    custom: customCards.length,
  };

  let list = deck;
  if (filter === 'mastered') list = masteredCards;
  else if (filter === 'learning') list = learningCards;
  else if (filter === 'new') list = newCards;
  else if (filter === 'custom') list = customCards;

  const query = search.trim().toLowerCase();
  if (query) {
    list = list.filter(
      (c) =>
        c.learning.toLowerCase().includes(query) ||
        c.orig.toLowerCase().includes(query) ||
        c.tags.toLowerCase().includes(query) ||
        c.context.toLowerCase().includes(query)
    );
  }

  const sorted = [...list].sort((a, b) => b.reps - a.reps || b.updatedAt - a.updatedAt);

  return (
    <div
      role="dialog"
      aria-modal="true"
      aria-labelledby="progressModalTitle"
      onClick={(e) => e.target === e.currentTarget && onClose()}
      className="fixed inset-0 bg-slate-900/60 backdrop-blur-sm z-50 flex items-end sm:items-center justify-center p-0 sm:p-4"
    >
      <div className="bg-white dark:bg-slate-900 border border-slate-200 dark:border-slate-800 w-full max-w-lg rounded-t-3xl sm:rounded-3xl p-5 sm:p-6 shadow-2xl flex flex-col max-h-[90dvh] overflow-hidden">
        <div className="flex items-center justify-between pb-3 border-b border-slate-200 dark:border-slate-800">
          <div>
            <h3 id="progressModalTitle" className="text-base font-bold">
              {t.progressTitle}
            </h3>
            <p className="text-xs text-slate-500 dark:text-slate-400">
              {t.progressSubtitle(total, masteredCards.length, masteredPct)}
            </p>
          </div>
          <button type="button" onClick={onClose} className="text-slate-400 hover:text-slate-600 dark:hover:text-slate-200 p-1" aria-label={t.close}>
            <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M6 18L18 6M6 6l12 12" />
            </svg>
          </button>
        </div>

        <div className="py-3.5 space-y-3 flex-none">
          <div className="grid grid-cols-3 gap-2 text-center">
            <button
              type="button"
              onClick={() => onFilterChange('mastered')}
              className="p-2.5 rounded-2xl bg-emerald-50 dark:bg-emerald-950/50 border border-emerald-200 dark:border-emerald-800/60 transition"
            >
              <div className="text-xl font-black text-emerald-600 dark:text-emerald-400 leading-tight tabular-nums">
                {masteredCards.length}
              </div>
              <div className="text-xs font-semibold text-emerald-700 dark:text-emerald-300 mt-0.5">
                {t.masteredLabel}
              </div>
            </button>
            <button
              type="button"
              onClick={() => onFilterChange('learning')}
              className="p-2.5 rounded-2xl bg-amber-50 dark:bg-amber-950/50 border border-amber-200 dark:border-amber-800/60 transition"
            >
              <div className="text-xl font-black text-amber-600 dark:text-amber-400 leading-tight tabular-nums">
                {learningCards.length}
              </div>
              <div className="text-xs font-semibold text-amber-700 dark:text-amber-300 mt-0.5">
                {t.inProgressLabel}
              </div>
            </button>
            <button
              type="button"
              onClick={() => onFilterChange('new')}
              className="p-2.5 rounded-2xl bg-blue-50 dark:bg-blue-950/50 border border-blue-200 dark:border-blue-800/60 transition"
            >
              <div className="text-xl font-black text-blue-600 dark:text-blue-400 leading-tight tabular-nums">
                {newCards.length}
              </div>
              <div className="text-xs font-semibold text-blue-700 dark:text-blue-300 mt-0.5">
                {t.unlearnedLabel}
              </div>
            </button>
          </div>

          <div>
            <div className="flex justify-between text-xs text-slate-500 dark:text-slate-400 mb-1.5 tabular-nums">
              <span>{t.masteredPctLabel(masteredPct, masteredCards.length, total)}</span>
              <span>{t.dueTodayLabel(dueCount)}</span>
            </div>
            <div className="w-full h-2.5 rounded-full bg-slate-200 dark:bg-slate-800 overflow-hidden flex">
              <div className="bg-emerald-500 h-full transition-all duration-300" style={{ width: `${masteredPct}%` }} />
              <div
                className="bg-amber-400 h-full transition-all duration-300"
                style={{ width: `${Math.min(100 - masteredPct, learningPct)}%` }}
              />
            </div>
          </div>

          <div className="flex gap-1.5 overflow-x-auto pb-0.5 text-xs">
            {(['all', 'mastered', 'learning', 'new', 'custom'] as ProgressFilter[]).map((f) => (
              <button
                key={f}
                type="button"
                onClick={() => onFilterChange(f)}
                className={`px-3 py-1.5 rounded-xl font-bold whitespace-nowrap ${
                  f === filter
                    ? 'bg-blue-600 text-white'
                    : 'bg-slate-100 dark:bg-slate-800 text-slate-600 dark:text-slate-300'
                }`}
              >
                {filterLabels[f]} ({counts[f]})
              </button>
            ))}
          </div>

          <input
            type="search"
            value={search}
            onChange={(e) => setSearch(e.target.value)}
            placeholder={t.searchProgressPlaceholder}
            className="w-full text-sm p-2.5 border border-slate-300 dark:border-slate-700 rounded-xl bg-slate-50 dark:bg-slate-950 focus:outline-none focus:border-blue-500"
          />
        </div>

        <div className="flex-1 overflow-y-auto space-y-2 pr-0.5 text-sm">
          {sorted.length === 0 ? (
            <div className="text-center text-slate-400 py-8 text-sm">{t.emptyCategory}</div>
          ) : (
            sorted.map((card) => {
              const stage = getCardStage(card);
              return (
              <div
                key={card.cardKey}
                className="p-3 rounded-2xl bg-slate-50 dark:bg-slate-800/60 border border-slate-200 dark:border-slate-700 flex items-center justify-between gap-2"
              >
                <div className="min-w-0 flex-1">
                  <div className="flex items-center gap-1.5 mb-1">
                    {stage === 'mastered' ? (
                      <span className="px-2 py-0.5 rounded-md text-[11px] font-bold bg-emerald-100 dark:bg-emerald-950 text-emerald-700 dark:text-emerald-300 flex-none">
                        {t.masteredLabel} ×{card.reps}
                      </span>
                    ) : stage === 'learning' ? (
                      <span className="px-2 py-0.5 rounded-md text-[11px] font-bold bg-amber-100 dark:bg-amber-950 text-amber-700 dark:text-amber-300 flex-none">
                        {t.learningLabel} ×{card.reps}
                      </span>
                    ) : (
                      <span className="px-2 py-0.5 rounded-md text-[11px] font-bold bg-blue-100 dark:bg-blue-950 text-blue-700 dark:text-blue-300 flex-none">
                        {t.badgeNew}
                      </span>
                    )}
                    {card.isCustom && (
                      <span className="px-2 py-0.5 rounded-md text-[11px] font-bold bg-purple-100 dark:bg-purple-950 text-purple-700 dark:text-purple-300 flex-none">
                        {t.badgeCustom}
                      </span>
                    )}
                    <span className="text-xs text-slate-400 truncate">
                      {formatNextReview(card, locale)}
                    </span>
                  </div>
                  <div className="font-bold text-slate-900 dark:text-white truncate">{card.learning}</div>
                  <div className="text-xs text-slate-500 dark:text-slate-400 truncate">
                    {card.orig}
                  </div>
                </div>

                <div className="flex items-center gap-1.5 flex-none">
                  <button
                    type="button"
                    onClick={() => onSpeak(card.learning)}
                    className="p-2 rounded-xl bg-white dark:bg-slate-900 border border-slate-200 dark:border-slate-700 text-blue-600 dark:text-blue-400 hover:bg-blue-50 dark:hover:bg-slate-800 transition"
                    title={t.speakTitle}
                  >
                    <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                      <path
                        strokeLinecap="round"
                        strokeLinejoin="round"
                        strokeWidth="2"
                        d="M15.536 8.464a5 5 0 010 7.072M5.586 15H4a1 1 0 01-1-1v-4a1 1 0 011-1h1.586l4.707-4.707C10.923 3.663 12 4.109 12 5v14c0 .891-1.077 1.337-1.707.707L5.586 15z"
                      />
                    </svg>
                  </button>
                  <button
                    type="button"
                    onClick={() => onPracticeCard(card.cardKey)}
                    className="px-2.5 py-1.5 rounded-xl bg-blue-600 hover:bg-blue-700 text-white text-xs font-bold transition"
                  >
                    {t.studyBtn}
                  </button>
                  {stage !== 'new' && (
                    <button
                      type="button"
                      onClick={() => onResetCard(card.cardKey)}
                      className="px-2 py-1.5 rounded-xl bg-slate-200 dark:bg-slate-700 text-slate-600 dark:text-slate-300 text-xs font-bold hover:bg-rose-100 hover:text-rose-700 dark:hover:bg-rose-950 dark:hover:text-rose-300 transition"
                      title={t.resetCardTitle}
                    >
                      ↺
                    </button>
                  )}
                </div>
              </div>
              );
            })
          )}
        </div>
      </div>
    </div>
  );
}
