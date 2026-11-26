import type { Card, Direction, Rating } from '../types';
import { getRatingPreviewLabels } from '../lib/srs';
import { useI18n } from '../lib/I18nContext';

interface FlashCardProps {
  card: Card;
  origLang: string;
  learningLang: string;
  direction: Direction;
  isFlipped: boolean;
  onFlip: () => void;
  onRate: (rate: Rating) => void;
  onSpeakAll: () => void;
  onSpeakTerm: () => void;
  onSpeakExample: () => void;
}

export function FlashCard({
  card,
  origLang,
  learningLang,
  direction,
  isFlipped,
  onFlip,
  onRate,
  onSpeakAll,
  onSpeakTerm,
  onSpeakExample,
}: FlashCardProps) {
  const { locale, t } = useI18n();
  const promptText = direction === 'learning-orig' ? card.learning : card.orig;
  const promptExample = direction === 'learning-orig' ? card.example_learning : card.example_orig;
  const answerText = direction === 'learning-orig' ? card.orig : card.learning;
  const answerExample = direction === 'learning-orig' ? card.example_orig : card.example_learning;
  const labels = getRatingPreviewLabels(card, locale);
  const directionBadge =
    direction === 'learning-orig'
      ? `${learningLang} → ${origLang}`
      : `${origLang} → ${learningLang}`;

  return (
    <div className="flex-1 flex flex-col justify-between overflow-hidden">
      <div
        onClick={(e) => {
          if ((e.target as HTMLElement).closest('button')) return;
          if (!isFlipped) onFlip();
        }}
        className="flex-1 flex flex-col justify-between bg-white dark:bg-slate-900 border border-slate-200/80 dark:border-slate-800/80 rounded-3xl p-5 sm:p-6 shadow-xl shadow-slate-900/[0.06] dark:shadow-black/30 active:scale-[0.995] transition duration-150 cursor-pointer overflow-y-auto"
      >
        <div className="flex items-center justify-between gap-2 pb-3 border-b border-slate-100 dark:border-slate-800/80">
          <span className="text-xs font-bold tracking-wide px-2.5 py-1 rounded-full bg-slate-100 dark:bg-slate-800 text-slate-700 dark:text-slate-200 flex-none">
            {directionBadge}
          </span>
          <span className="text-xs text-slate-400 dark:text-slate-400 font-medium truncate max-w-[200px]">
            {card.context || (card.isCustom ? t.myCardBadge : '')}
          </span>
          <button
            type="button"
            onClick={(e) => {
              e.stopPropagation();
              onSpeakAll();
            }}
            className="p-2 text-blue-600 dark:text-blue-400 rounded-full bg-blue-50/80 dark:bg-blue-950/50 hover:bg-blue-100 dark:hover:bg-blue-900/60 transition flex-none"
            title={t.speakTitle}
            aria-label={t.speakTitle}
          >
            <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path
                strokeLinecap="round"
                strokeLinejoin="round"
                strokeWidth="2"
                d="M15.536 8.464a5 5 0 010 7.072m2.828-9.9a9 9 0 010 12.728M5.586 15H4a1 1 0 01-1-1v-4a1 1 0 011-1h1.586l4.707-4.707C10.923 3.663 12 4.109 12 5v14c0 .891-1.077 1.337-1.707.707L5.586 15z"
              />
            </svg>
          </button>
        </div>

        <div className="my-auto py-4 text-center">
          <h2 className="text-2xl sm:text-[30px] font-extrabold tracking-tight text-slate-900 dark:text-white leading-snug text-balance">
            {promptText}
          </h2>
          {promptExample && (
            <div className="mt-3 text-sm sm:text-base text-slate-600 dark:text-slate-300 leading-relaxed font-normal italic text-balance">
              <p>{promptExample}</p>
            </div>
          )}
          {!isFlipped && (
            <div className="mt-6 text-xs text-slate-400 font-semibold uppercase tracking-wider animate-pulse">
              {t.tapToFlip}
            </div>
          )}
        </div>

        {isFlipped && (
          <div className="my-2 p-4 rounded-2xl bg-blue-50/75 dark:bg-blue-950/35 border border-blue-100 dark:border-blue-900/50 text-center animate-reveal">
            <div className="text-xl sm:text-2xl font-bold text-blue-700 dark:text-blue-300 mb-1.5 leading-snug text-balance">
              {answerText}
            </div>
            {answerExample && (
              <div className="text-sm sm:text-[15px] text-slate-600 dark:text-slate-300 italic leading-relaxed text-balance">
                {answerExample}
              </div>
            )}
          </div>
        )}

        <div className="flex justify-between items-center text-xs text-slate-400 pt-3 border-t border-slate-100 dark:border-slate-800/80 tabular-nums">
          <span>
            {t.repsLabel}: {card.reps || 0}
          </span>
          <span className="truncate max-w-[160px]">
            {card.tags ? `#${card.tags.split(' ')[0]}` : ''}
          </span>
        </div>
      </div>

      <div className="flex-none mt-3">
        {isFlipped && (
          <div className="flex items-center justify-center gap-2 mb-2.5">
            <button
              type="button"
              onClick={onSpeakTerm}
              className="flex-1 py-2 px-3 bg-white dark:bg-slate-900 border border-slate-200/80 dark:border-slate-800 text-slate-700 dark:text-slate-200 rounded-xl text-[13px] font-semibold flex items-center justify-center gap-1.5 shadow-sm hover:bg-slate-50 dark:hover:bg-slate-800 active:scale-95 transition"
            >
              <svg className="w-4 h-4 text-blue-500" fill="currentColor" viewBox="0 0 20 20">
                <path d="M10 18a8 8 0 100-16 8 8 0 000 16zM9.555 7.168A1 1 0 008 8v4a1 1 0 001.555.832l3-2a1 1 0 000-1.664l-3-2z" />
              </svg>
              {t.wordBtn}
            </button>
            <button
              type="button"
              onClick={onSpeakExample}
              className="flex-1 py-2 px-3 bg-white dark:bg-slate-900 border border-slate-200/80 dark:border-slate-800 text-slate-700 dark:text-slate-200 rounded-xl text-[13px] font-semibold flex items-center justify-center gap-1.5 shadow-sm hover:bg-slate-50 dark:hover:bg-slate-800 active:scale-95 transition"
            >
              <svg className="w-4 h-4 text-blue-500" fill="currentColor" viewBox="0 0 20 20">
                <path d="M10 18a8 8 0 100-16 8 8 0 000 16zM9.555 7.168A1 1 0 008 8v4a1 1 0 001.555.832l3-2a1 1 0 000-1.664l-3-2z" />
              </svg>
              {t.exampleBtn}
            </button>
          </div>
        )}

        {!isFlipped ? (
          <button
            type="button"
            onClick={onFlip}
            className="w-full py-4 bg-gradient-to-r from-blue-600 to-indigo-600 hover:from-blue-700 hover:to-indigo-700 text-white font-bold text-base rounded-2xl shadow-lg shadow-blue-600/25 active:scale-[0.98] transition flex items-center justify-center gap-2"
          >
            {t.showAnswer}
          </button>
        ) : (
          <div className="grid grid-cols-4 gap-2 w-full">
            <button
              type="button"
              onClick={() => onRate('again')}
              className="h-14 rounded-2xl bg-rose-100/90 dark:bg-rose-950/80 hover:bg-rose-200/80 dark:hover:bg-rose-900/80 text-rose-700 dark:text-rose-200 font-bold text-[13px] flex flex-col items-center justify-center active:scale-95 transition border border-rose-300/50 dark:border-rose-800/60"
            >
              <span>{t.rateAgain}</span>
              <span className="text-[11px] opacity-75 font-semibold tabular-nums">{labels.again}</span>
            </button>
            <button
              type="button"
              onClick={() => onRate('hard')}
              className="h-14 rounded-2xl bg-amber-100/90 dark:bg-amber-950/80 hover:bg-amber-200/80 dark:hover:bg-amber-900/80 text-amber-700 dark:text-amber-200 font-bold text-[13px] flex flex-col items-center justify-center active:scale-95 transition border border-amber-300/50 dark:border-amber-800/60"
            >
              <span>{t.rateHard}</span>
              <span className="text-[11px] opacity-75 font-semibold tabular-nums">{labels.hard}</span>
            </button>
            <button
              type="button"
              onClick={() => onRate('good')}
              className="h-14 rounded-2xl bg-blue-100/90 dark:bg-blue-950/80 hover:bg-blue-200/80 dark:hover:bg-blue-900/80 text-blue-700 dark:text-blue-200 font-bold text-[13px] flex flex-col items-center justify-center active:scale-95 transition border border-blue-300/50 dark:border-blue-800/60"
            >
              <span>{t.rateGood}</span>
              <span className="text-[11px] opacity-75 font-semibold tabular-nums">{labels.good}</span>
            </button>
            <button
              type="button"
              onClick={() => onRate('easy')}
              className="h-14 rounded-2xl bg-emerald-100/90 dark:bg-emerald-950/80 hover:bg-emerald-200/80 dark:hover:bg-emerald-900/80 text-emerald-700 dark:text-emerald-200 font-bold text-[13px] flex flex-col items-center justify-center active:scale-95 transition border border-emerald-300/50 dark:border-emerald-800/60"
            >
              <span>{t.rateEasy}</span>
              <span className="text-[11px] opacity-75 font-semibold tabular-nums">{labels.easy}</span>
            </button>
          </div>
        )}
      </div>
    </div>
  );
}
