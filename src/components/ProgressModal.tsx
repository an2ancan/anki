import { useState } from 'react';
import type { Card, ProgressFilter } from '../types';
import { formatNextReview, getEndOfTodayMs } from '../lib/srs';

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

const FILTER_LABELS: Record<ProgressFilter, string> = {
  all: 'Все',
  mastered: 'Выучены',
  learning: 'Учим',
  new: 'Не выучены',
  custom: 'Мои',
};

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
  const [search, setSearch] = useState('');

  if (!isOpen) return null;

  const total = deck.length;
  const masteredCards = deck.filter((c) => c.reps >= 3);
  const learningCards = deck.filter((c) => c.reps > 0 && c.reps < 3);
  const newCards = deck.filter((c) => c.reps === 0);
  const customCards = deck.filter((c) => c.isCustom);
  const endOfToday = getEndOfTodayMs();
  const dueCount = deck.filter((c) => c.reps > 0 && (!c.nextReview || c.nextReview <= endOfToday)).length;

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
        c.german.toLowerCase().includes(query) ||
        c.russian.toLowerCase().includes(query) ||
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
      <div className="bg-white dark:bg-slate-900 border border-slate-200 dark:border-slate-800 w-full max-w-lg rounded-t-3xl sm:rounded-3xl p-4 sm:p-6 shadow-2xl flex flex-col max-h-[90dvh] overflow-hidden">
        <div className="flex items-center justify-between pb-3 border-b border-slate-200 dark:border-slate-800">
          <div>
            <h3 id="progressModalTitle" className="text-sm font-bold">
              Прогресс обучения
            </h3>
            <p className="text-[10px] text-slate-400">
              Всего: {total} • Выучено: {masteredCards.length} ({masteredPct}%) • Осталось:{' '}
              {total - masteredCards.length}
            </p>
          </div>
          <button type="button" onClick={onClose} className="text-slate-400 p-1" aria-label="Закрыть">
            <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M6 18L18 6M6 6l12 12" />
            </svg>
          </button>
        </div>

        <div className="py-3 space-y-2.5 flex-none">
          <div className="grid grid-cols-3 gap-2 text-center">
            <button
              type="button"
              onClick={() => onFilterChange('mastered')}
              className="p-2 rounded-2xl bg-emerald-50 dark:bg-emerald-950/50 border border-emerald-200 dark:border-emerald-800/60 transition"
            >
              <div className="text-lg font-black text-emerald-600 dark:text-emerald-400 leading-tight">
                {masteredCards.length}
              </div>
              <div className="text-[10px] font-semibold text-emerald-700 dark:text-emerald-300">
                Выучено
              </div>
            </button>
            <button
              type="button"
              onClick={() => onFilterChange('learning')}
              className="p-2 rounded-2xl bg-amber-50 dark:bg-amber-950/50 border border-amber-200 dark:border-amber-800/60 transition"
            >
              <div className="text-lg font-black text-amber-600 dark:text-amber-400 leading-tight">
                {learningCards.length}
              </div>
              <div className="text-[10px] font-semibold text-amber-700 dark:text-amber-300">
                В процессе
              </div>
            </button>
            <button
              type="button"
              onClick={() => onFilterChange('new')}
              className="p-2 rounded-2xl bg-blue-50 dark:bg-blue-950/50 border border-blue-200 dark:border-blue-800/60 transition"
            >
              <div className="text-lg font-black text-blue-600 dark:text-blue-400 leading-tight">
                {newCards.length}
              </div>
              <div className="text-[10px] font-semibold text-blue-700 dark:text-blue-300">
                Не выучено
              </div>
            </button>
          </div>

          <div>
            <div className="flex justify-between text-[10px] text-slate-500 dark:text-slate-400 mb-1">
              <span>
                Освоено: {masteredPct}% ({masteredCards.length}/{total})
              </span>
              <span>К повторению сегодня: {dueCount}</span>
            </div>
            <div className="w-full h-2 rounded-full bg-slate-200 dark:bg-slate-800 overflow-hidden flex">
              <div className="bg-emerald-500 h-full transition-all duration-300" style={{ width: `${masteredPct}%` }} />
              <div
                className="bg-amber-400 h-full transition-all duration-300"
                style={{ width: `${Math.min(100 - masteredPct, learningPct)}%` }}
              />
            </div>
          </div>

          <div className="flex gap-1 overflow-x-auto pb-0.5 text-[11px]">
            {(['all', 'mastered', 'learning', 'new', 'custom'] as ProgressFilter[]).map((f) => (
              <button
                key={f}
                type="button"
                onClick={() => onFilterChange(f)}
                className={`px-2.5 py-1 rounded-lg font-bold whitespace-nowrap ${
                  f === filter
                    ? 'bg-blue-600 text-white'
                    : 'bg-slate-100 dark:bg-slate-800 text-slate-600 dark:text-slate-300'
                }`}
              >
                {FILTER_LABELS[f]} ({counts[f]})
              </button>
            ))}
          </div>

          <input
            type="search"
            value={search}
            onChange={(e) => setSearch(e.target.value)}
            placeholder="Поиск слова, перевода или тега..."
            className="w-full text-xs p-2 border border-slate-300 dark:border-slate-700 rounded-xl bg-slate-50 dark:bg-slate-950 focus:outline-none focus:border-blue-500"
          />
        </div>

        <div className="flex-1 overflow-y-auto space-y-1.5 pr-0.5 text-xs">
          {sorted.length === 0 ? (
            <div className="text-center text-slate-400 py-8 text-xs">
              В этой категории пока нет карточек.
            </div>
          ) : (
            sorted.map((card) => (
              <div
                key={card.cardKey}
                className="p-2.5 rounded-2xl bg-slate-50 dark:bg-slate-800/60 border border-slate-200 dark:border-slate-700 flex items-center justify-between gap-2"
              >
                <div className="min-w-0 flex-1">
                  <div className="flex items-center gap-1.5 mb-0.5">
                    {card.reps >= 3 ? (
                      <span className="px-1.5 py-0.5 rounded text-[9px] font-bold bg-emerald-100 dark:bg-emerald-950 text-emerald-700 dark:text-emerald-300 flex-none">
                        Выучено ×{card.reps}
                      </span>
                    ) : card.reps > 0 ? (
                      <span className="px-1.5 py-0.5 rounded text-[9px] font-bold bg-amber-100 dark:bg-amber-950 text-amber-700 dark:text-amber-300 flex-none">
                        Учим ×{card.reps}
                      </span>
                    ) : (
                      <span className="px-1.5 py-0.5 rounded text-[9px] font-bold bg-blue-100 dark:bg-blue-950 text-blue-700 dark:text-blue-300 flex-none">
                        Новая
                      </span>
                    )}
                    {card.isCustom && (
                      <span className="px-1.5 py-0.5 rounded text-[9px] font-bold bg-purple-100 dark:bg-purple-950 text-purple-700 dark:text-purple-300 flex-none">
                        Моя
                      </span>
                    )}
                    <span className="text-[10px] text-slate-400 truncate">
                      {formatNextReview(card)}
                    </span>
                  </div>
                  <div className="font-bold text-slate-900 dark:text-white truncate">{card.german}</div>
                  <div className="text-[11px] text-slate-500 dark:text-slate-400 truncate">
                    {card.russian}
                  </div>
                </div>

                <div className="flex items-center gap-1 flex-none">
                  <button
                    type="button"
                    onClick={() => onSpeak(card.german)}
                    className="p-1.5 rounded-lg bg-white dark:bg-slate-900 border border-slate-200 dark:border-slate-700 text-blue-600 dark:text-blue-400 hover:bg-blue-50 dark:hover:bg-slate-800 transition"
                    title="Озвучить"
                  >
                    <svg className="w-3.5 h-3.5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
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
                    className="px-2 py-1 rounded-lg bg-blue-600 hover:bg-blue-700 text-white text-[10px] font-bold transition"
                  >
                    Учить
                  </button>
                  {card.reps > 0 && (
                    <button
                      type="button"
                      onClick={() => onResetCard(card.cardKey)}
                      className="px-1.5 py-1 rounded-lg bg-slate-200 dark:bg-slate-700 text-slate-600 dark:text-slate-300 text-[10px] font-bold hover:bg-rose-100 hover:text-rose-700 dark:hover:bg-rose-950 dark:hover:text-rose-300 transition"
                      title="Сбросить прогресс карточки"
                    >
                      ↺
                    </button>
                  )}
                </div>
              </div>
            ))
          )}
        </div>
      </div>
    </div>
  );
}
