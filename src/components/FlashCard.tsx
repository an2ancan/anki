import type { Card, Direction, Rating } from '../types';
import { getRatingPreviewLabels } from '../lib/srs';

interface FlashCardProps {
  card: Card;
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
  direction,
  isFlipped,
  onFlip,
  onRate,
  onSpeakAll,
  onSpeakTerm,
  onSpeakExample,
}: FlashCardProps) {
  const promptText = direction === 'de-ru' ? card.german : card.russian;
  const promptExample = direction === 'de-ru' ? card.example_de : card.example_ru;
  const answerText = direction === 'de-ru' ? card.russian : card.german;
  const answerExample = direction === 'de-ru' ? card.example_ru : card.example_de;
  const labels = getRatingPreviewLabels(card);

  return (
    <div className="flex-1 flex flex-col justify-between overflow-hidden">
      <div
        onClick={(e) => {
          if ((e.target as HTMLElement).closest('button')) return;
          if (!isFlipped) onFlip();
        }}
        className="flex-1 flex flex-col justify-between bg-white dark:bg-slate-900 border border-slate-200 dark:border-slate-800 rounded-3xl p-4 sm:p-5 shadow-md active:scale-[0.99] transition duration-150 cursor-pointer overflow-y-auto"
      >
        <div className="flex items-center justify-between pb-2 border-b border-slate-100 dark:border-slate-800">
          <span className="text-[10px] font-black tracking-widest px-2 py-0.5 rounded bg-slate-100 dark:bg-slate-800 text-slate-600 dark:text-slate-300">
            {direction === 'de-ru' ? 'DE → RU' : 'RU → DE'}
          </span>
          <span className="text-[11px] text-slate-400 font-medium truncate max-w-[190px]">
            {card.context || (card.isCustom ? 'Моя карточка' : '')}
          </span>
          <button
            type="button"
            onClick={(e) => {
              e.stopPropagation();
              onSpeakAll();
            }}
            className="p-1.5 text-blue-600 dark:text-blue-400 rounded-full hover:bg-blue-50 dark:hover:bg-slate-800 transition"
            title="Произнести"
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

        <div className="my-auto py-2 text-center">
          <h2 className="text-xl sm:text-2xl font-black text-slate-900 dark:text-white leading-snug">
            {promptText}
          </h2>
          {promptExample && (
            <div className="mt-2 text-xs sm:text-sm text-slate-600 dark:text-slate-300 leading-relaxed font-normal italic">
              <p>{promptExample}</p>
            </div>
          )}
          {!isFlipped && (
            <div className="mt-4 text-[10px] text-slate-400 font-semibold uppercase tracking-wider animate-pulse">
              Нажмите на карточку для ответа
            </div>
          )}
        </div>

        {isFlipped && (
          <div className="pt-3 border-t border-slate-100 dark:border-slate-800 text-center">
            <div className="text-lg sm:text-xl font-bold text-blue-600 dark:text-blue-400 mb-1 leading-snug">
              {answerText}
            </div>
            {answerExample && (
              <div className="text-xs text-slate-500 dark:text-slate-400 italic">{answerExample}</div>
            )}
          </div>
        )}

        <div className="flex justify-between items-center text-[10px] text-slate-400 pt-2 border-t border-slate-100 dark:border-slate-800">
          <span>Повторений: {card.reps || 0}</span>
          <span className="truncate max-w-[140px]">
            {card.tags ? `#${card.tags.split(' ')[0]}` : ''}
          </span>
        </div>
      </div>

      <div className="flex-none mt-2 safe-pb">
        {isFlipped && (
          <div className="flex items-center justify-center gap-2 mb-2">
            <button
              type="button"
              onClick={onSpeakTerm}
              className="flex-1 py-1.5 px-2 bg-slate-200 dark:bg-slate-800 text-slate-700 dark:text-slate-300 rounded-lg text-xs font-semibold flex items-center justify-center gap-1 active:scale-95 transition"
            >
              <svg className="w-3.5 h-3.5 text-blue-500" fill="currentColor" viewBox="0 0 20 20">
                <path d="M10 18a8 8 0 100-16 8 8 0 000 16zM9.555 7.168A1 1 0 008 8v4a1 1 0 001.555.832l3-2a1 1 0 000-1.664l-3-2z" />
              </svg>
              Слово
            </button>
            <button
              type="button"
              onClick={onSpeakExample}
              className="flex-1 py-1.5 px-2 bg-slate-200 dark:bg-slate-800 text-slate-700 dark:text-slate-300 rounded-lg text-xs font-semibold flex items-center justify-center gap-1 active:scale-95 transition"
            >
              <svg className="w-3.5 h-3.5 text-blue-500" fill="currentColor" viewBox="0 0 20 20">
                <path d="M10 18a8 8 0 100-16 8 8 0 000 16zM9.555 7.168A1 1 0 008 8v4a1 1 0 001.555.832l3-2a1 1 0 000-1.664l-3-2z" />
              </svg>
              Пример
            </button>
          </div>
        )}

        {!isFlipped ? (
          <button
            type="button"
            onClick={onFlip}
            className="w-full py-3.5 bg-blue-600 hover:bg-blue-700 text-white font-bold text-sm rounded-2xl shadow-lg shadow-blue-500/25 active:scale-95 transition flex items-center justify-center gap-2"
          >
            Показать ответ
          </button>
        ) : (
          <div className="grid grid-cols-4 gap-1.5 w-full">
            <button
              type="button"
              onClick={() => onRate('again')}
              className="h-12 rounded-xl bg-rose-100 dark:bg-rose-950/80 text-rose-700 dark:text-rose-200 font-bold text-xs flex flex-col items-center justify-center active:scale-95 transition border border-rose-300/40"
            >
              <span>Снова</span>
              <span className="text-[9px] opacity-70">{labels.again}</span>
            </button>
            <button
              type="button"
              onClick={() => onRate('hard')}
              className="h-12 rounded-xl bg-amber-100 dark:bg-amber-950/80 text-amber-700 dark:text-amber-200 font-bold text-xs flex flex-col items-center justify-center active:scale-95 transition border border-amber-300/40"
            >
              <span>Трудно</span>
              <span className="text-[9px] opacity-70">{labels.hard}</span>
            </button>
            <button
              type="button"
              onClick={() => onRate('good')}
              className="h-12 rounded-xl bg-blue-100 dark:bg-blue-950/80 text-blue-700 dark:text-blue-200 font-bold text-xs flex flex-col items-center justify-center active:scale-95 transition border border-blue-300/40"
            >
              <span>Хорошо</span>
              <span className="text-[9px] opacity-70">{labels.good}</span>
            </button>
            <button
              type="button"
              onClick={() => onRate('easy')}
              className="h-12 rounded-xl bg-emerald-100 dark:bg-emerald-950/80 text-emerald-700 dark:text-emerald-200 font-bold text-xs flex flex-col items-center justify-center active:scale-95 transition border border-emerald-300/40"
            >
              <span>Легко</span>
              <span className="text-[9px] opacity-70">{labels.easy}</span>
            </button>
          </div>
        )}
      </div>
    </div>
  );
}
