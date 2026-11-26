import type { Deck } from '../types';
import type { CatalogLang, CefrLevel } from '../data/starterDecks';
import { useI18n } from '../lib/I18nContext';
import { StarterDecksCatalog } from './StarterDecksCatalog';

interface QuickAddModalProps {
  isOpen: boolean;
  onClose: () => void;
  decks: Deck[];
  activeDeckName: string;
  activeDeckCardCount: number;
  onAddCard: () => void;
  onExportCsv: () => void;
  onOpenDecks: () => void;
  onAddStarterDeck: (
    level: CefrLevel,
    origLang: CatalogLang,
    learningLang: CatalogLang
  ) => Promise<void>;
}

export function QuickAddModal({
  isOpen,
  onClose,
  decks,
  activeDeckName,
  activeDeckCardCount,
  onAddCard,
  onExportCsv,
  onOpenDecks,
  onAddStarterDeck,
}: QuickAddModalProps) {
  const { t } = useI18n();

  if (!isOpen) return null;

  return (
    <div
      role="dialog"
      aria-modal="true"
      aria-labelledby="quickAddModalTitle"
      onClick={(e) => e.target === e.currentTarget && onClose()}
      className="fixed inset-0 bg-slate-900/60 backdrop-blur-sm z-50 flex items-end sm:items-center justify-center p-0 sm:p-4"
    >
      <div className="bg-white dark:bg-slate-900 border border-slate-200 dark:border-slate-800 w-full max-w-lg rounded-t-3xl sm:rounded-3xl p-5 sm:p-6 shadow-2xl flex flex-col max-h-[88dvh] overflow-hidden">
        <div className="flex items-center justify-between pb-3 border-b border-slate-200 dark:border-slate-800">
          <div>
            <h3 id="quickAddModalTitle" className="text-base font-bold">
              {t.quickAddTitle}
            </h3>
            <p className="text-xs text-slate-500 dark:text-slate-400 truncate max-w-[260px]">
              {activeDeckName}
            </p>
          </div>
          <button
            type="button"
            onClick={onClose}
            className="text-slate-400 hover:text-slate-600 dark:hover:text-slate-200 p-1"
            aria-label={t.close}
          >
            <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M6 18L18 6M6 6l12 12" />
            </svg>
          </button>
        </div>

        <div className="flex-1 overflow-y-auto py-4 space-y-3 text-sm">
          <button
            type="button"
            onClick={() => {
              onClose();
              onAddCard();
            }}
            className="w-full py-3.5 px-4 bg-gradient-to-r from-blue-600 to-indigo-600 hover:from-blue-700 hover:to-indigo-700 text-white font-bold rounded-2xl shadow-md shadow-blue-600/20 flex items-center justify-center gap-2 transition active:scale-[0.98]"
          >
            <svg className="w-5 h-5 flex-none" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2.5" d="M12 4v16m8-8H4" />
            </svg>
            <span>{t.addCardTitle}</span>
          </button>

          <div className="grid grid-cols-2 gap-2.5">
            <button
              type="button"
              disabled={activeDeckCardCount === 0}
              onClick={() => {
                onExportCsv();
                onClose();
              }}
              className={`py-3 px-3 bg-slate-100 dark:bg-slate-800 hover:bg-slate-200 dark:hover:bg-slate-700 text-slate-800 dark:text-slate-100 font-bold rounded-2xl text-xs flex items-center justify-center gap-1.5 transition ${
                activeDeckCardCount === 0 ? 'opacity-50 cursor-not-allowed' : ''
              }`}
            >
              <svg className="w-4 h-4 text-blue-600 dark:text-blue-400 flex-none" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M4 16v1a3 3 0 003 3h10a3 3 0 003-3v-1m-4-4l-4 4m0 0l-4-4m4 4V4" />
              </svg>
              <span>{t.exportCsv}</span>
            </button>

            <button
              type="button"
              onClick={() => {
                onClose();
                onOpenDecks();
              }}
              className="py-3 px-3 bg-slate-100 dark:bg-slate-800 hover:bg-slate-200 dark:hover:bg-slate-700 text-slate-800 dark:text-slate-100 font-bold rounded-2xl text-xs flex items-center justify-center gap-1.5 transition"
            >
              <svg className="w-4 h-4 text-indigo-600 dark:text-indigo-400 flex-none" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M4 16v1a3 3 0 003 3h10a3 3 0 003-3v-1m-4-8l-4-4m0 0L8 8m4-4v12" />
              </svg>
              <span>{t.quickAddImportDecks}</span>
            </button>
          </div>

          <StarterDecksCatalog
            decks={decks}
            onAddStarterDeck={onAddStarterDeck}
            defaultOpen
          />
        </div>
      </div>
    </div>
  );
}
