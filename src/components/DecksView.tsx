import { useState, type FormEvent } from 'react';
import type { Card, Deck } from '../types';
import type { CatalogLang, CefrLevel } from '../data/starterDecks';
import { useI18n } from '../lib/I18nContext';
import { getCardStage } from '../lib/srs';
import { AiPromptBuilder } from './AiPromptBuilder';
import { StarterDecksCatalog } from './StarterDecksCatalog';

interface DecksViewProps {
  decks: Deck[];
  allCards: Card[];
  activeDeckKey: string;
  onSelectDeck: (deckKey: string) => void;
  onCreateDeck: (name: string, description: string, origLang: string, learningLang: string) => void;
  onAddStarterDeck: (
    level: CefrLevel,
    origLang: CatalogLang,
    learningLang: CatalogLang
  ) => Promise<void>;
  onDeleteDeck: (deckKey: string) => void;
  onAddCardToDeck: (deckKey: string) => void;
  onImportCsvToDeck: (deckKey: string, rawCsv: string) => void;
  onExportCsvForDeck: (deckKey: string) => void;
  onBackToStudy: () => void;
}

export function DecksView({
  decks,
  allCards,
  activeDeckKey,
  onSelectDeck,
  onCreateDeck,
  onAddStarterDeck,
  onDeleteDeck,
  onAddCardToDeck,
  onImportCsvToDeck,
  onExportCsvForDeck,
  onBackToStudy,
}: DecksViewProps) {
  const { t } = useI18n();
  const [name, setName] = useState('');
  const [description, setDescription] = useState('');
  const [origLang, setOrigLang] = useState('RU');
  const [learningLang, setLearningLang] = useState('DE');
  const [csvOpenDeck, setCsvOpenDeck] = useState<string | null>(null);
  const [csvText, setCsvText] = useState('');
  const [confirmDeleteKey, setConfirmDeleteKey] = useState<string | null>(null);

  const handleCreate = (e: FormEvent) => {
    e.preventDefault();
    if (!name.trim()) return;
    onCreateDeck(
      name.trim(),
      description.trim(),
      (origLang.trim() || 'RU').toUpperCase(),
      (learningLang.trim() || 'DE').toUpperCase()
    );
    setName('');
    setDescription('');
  };

  return (
    <div className="flex-1 overflow-y-auto py-1 space-y-3.5 pb-6">
      <div className="flex items-center justify-between">
        <div>
          <h2 className="text-base font-black tracking-tight">{t.myDecks}</h2>
          <p className="text-xs text-slate-500 dark:text-slate-400">{t.decksSummary(decks.length, allCards.length)}</p>
        </div>
        <button
          type="button"
          onClick={onBackToStudy}
          className="px-3.5 py-2 bg-blue-600 hover:bg-blue-700 text-white rounded-xl text-xs font-bold transition"
        >
          {t.backToCards}
        </button>
      </div>

      {/* Create New Deck Form */}
      <form
        onSubmit={handleCreate}
        className="bg-white dark:bg-slate-900 border border-slate-200 dark:border-slate-800 rounded-2xl p-4 shadow-sm space-y-2.5 text-sm"
      >
        <div className="font-bold text-slate-800 dark:text-slate-200">{t.createNewDeck}</div>
        <div className="flex gap-2">
          <input
            type="text"
            required
            value={name}
            onChange={(e) => setName(e.target.value)}
            placeholder={t.deckNamePlaceholder}
            className="flex-1 p-2.5 bg-slate-50 dark:bg-slate-950 border border-slate-300 dark:border-slate-700 rounded-xl text-sm focus:outline-none focus:border-blue-500"
          />
          <button
            type="submit"
            className="px-4 py-2.5 bg-blue-600 hover:bg-blue-700 text-white font-bold rounded-xl text-sm transition flex-none"
          >
            {t.createBtn}
          </button>
        </div>
        <input
          type="text"
          value={description}
          onChange={(e) => setDescription(e.target.value)}
          placeholder={t.deckDescPlaceholder}
          className="w-full p-2.5 bg-slate-50 dark:bg-slate-950 border border-slate-300 dark:border-slate-700 rounded-xl text-xs focus:outline-none focus:border-blue-500"
        />
        <div className="grid grid-cols-2 gap-2.5">
          <div>
            <label className="block text-xs text-slate-500 dark:text-slate-400 mb-1">{t.origLangLabel}</label>
            <input
              type="text"
              maxLength={6}
              value={origLang}
              onChange={(e) => setOrigLang(e.target.value)}
              placeholder="RU"
              className="w-full p-2 bg-slate-50 dark:bg-slate-950 border border-slate-300 dark:border-slate-700 rounded-xl text-sm font-bold uppercase focus:outline-none focus:border-blue-500"
            />
          </div>
          <div>
            <label className="block text-xs text-slate-500 dark:text-slate-400 mb-1">{t.learningLangLabel}</label>
            <input
              type="text"
              maxLength={6}
              value={learningLang}
              onChange={(e) => setLearningLang(e.target.value)}
              placeholder="DE"
              className="w-full p-2 bg-slate-50 dark:bg-slate-950 border border-slate-300 dark:border-slate-700 rounded-xl text-sm font-bold uppercase focus:outline-none focus:border-blue-500"
            />
          </div>
        </div>
      </form>

      {/* Starter Decks Catalog */}
      <StarterDecksCatalog decks={decks} onAddStarterDeck={onAddStarterDeck} />

      {/* Deck Cards List */}
      <div className="space-y-3">
        {decks.map((d) => {
          const cards = allCards.filter((c) => c.deckKey === d.deckKey);
          const mastered = cards.filter((c) => getCardStage(c) === 'mastered').length;
          const learning = cards.filter((c) => getCardStage(c) === 'learning').length;
          const newCount = cards.filter((c) => getCardStage(c) === 'new').length;
          const pct = cards.length > 0 ? Math.round((mastered / cards.length) * 100) : 0;
          const isActive = d.deckKey === activeDeckKey;
          const isCsvOpen = csvOpenDeck === d.deckKey;
          const isConfirmingDelete = confirmDeleteKey === d.deckKey;

          return (
            <div
              key={d.deckKey}
              className={`bg-white dark:bg-slate-900 rounded-2xl p-4 shadow-sm border transition space-y-3 ${
                isActive
                  ? 'border-blue-500 ring-1 ring-blue-500/30'
                  : 'border-slate-200 dark:border-slate-800'
              }`}
            >
              <div className="flex items-start justify-between gap-2">
                <div className="min-w-0 flex-1">
                  <div className="flex items-center gap-1.5 flex-wrap">
                    <h3 className="text-base font-bold text-slate-900 dark:text-white truncate">
                      {d.name}
                    </h3>
                    <span className="px-2 py-0.5 rounded-md text-[11px] font-bold bg-indigo-50 dark:bg-indigo-950/60 text-indigo-700 dark:text-indigo-300 flex-none">
                      {d.origLang} → {d.learningLang}
                    </span>
                    {d.isDefault && (
                      <span className="px-2 py-0.5 rounded-md text-[11px] font-bold bg-slate-100 dark:bg-slate-800 text-slate-500 dark:text-slate-400 flex-none">
                        Default
                      </span>
                    )}
                    {isActive && (
                      <span className="px-2 py-0.5 rounded-md text-[11px] font-bold bg-blue-100 dark:bg-blue-950 text-blue-700 dark:text-blue-300 flex-none">
                        {t.activeBadge}
                      </span>
                    )}
                  </div>
                  {d.description && (
                    <p className="text-xs text-slate-500 dark:text-slate-400 truncate mt-1">
                      {d.description}
                    </p>
                  )}
                </div>

                {!d.isDefault && (
                  <div className="flex-none">
                    {isConfirmingDelete ? (
                      <div className="flex items-center gap-1">
                        <button
                          type="button"
                          onClick={() => {
                            onDeleteDeck(d.deckKey);
                            setConfirmDeleteKey(null);
                          }}
                          className="px-2.5 py-1 rounded-lg bg-rose-600 text-white text-xs font-bold"
                        >
                          {t.confirmDelete}
                        </button>
                        <button
                          type="button"
                          onClick={() => setConfirmDeleteKey(null)}
                          className="px-2 py-1 rounded-lg bg-slate-200 dark:bg-slate-800 text-xs font-bold"
                        >
                          {t.cancel}
                        </button>
                      </div>
                    ) : (
                      <button
                        type="button"
                        onClick={() => setConfirmDeleteKey(d.deckKey)}
                        className="px-2.5 py-1 text-xs font-bold text-rose-600 dark:text-rose-400 hover:bg-rose-50 dark:hover:bg-rose-950 rounded-lg transition"
                      >
                        {t.delete}
                      </button>
                    )}
                  </div>
                )}
              </div>

              <div>
                <div className="flex items-center justify-between text-xs text-slate-500 dark:text-slate-400 mb-1.5 tabular-nums">
                  <span>
                    {t.cardsWord}: <strong className="text-slate-700 dark:text-slate-200">{cards.length}</strong> ({t.newLabel}: {newCount} •{' '}
                    {t.learningLabel}: {learning} • {t.masteredLabel}: {mastered})
                  </span>
                  <span className="font-bold text-emerald-600 dark:text-emerald-400">{pct}%</span>
                </div>
                <div className="w-full h-2 rounded-full bg-slate-200 dark:bg-slate-800 overflow-hidden">
                  <div
                    className="bg-emerald-500 h-full transition-all duration-300"
                    style={{ width: `${pct}%` }}
                  />
                </div>
              </div>

              <div className="flex items-center gap-2 pt-0.5 text-xs">
                <button
                  type="button"
                  onClick={() => onSelectDeck(d.deckKey)}
                  className="flex-1 py-2.5 bg-blue-600 hover:bg-blue-700 text-white rounded-xl font-bold transition"
                >
                  {isActive ? t.continueStudy : t.studyDeck}
                </button>
                <button
                  type="button"
                  onClick={() => onAddCardToDeck(d.deckKey)}
                  className="px-3 py-2.5 bg-slate-100 dark:bg-slate-800 hover:bg-slate-200 dark:hover:bg-slate-700 text-slate-700 dark:text-slate-200 rounded-xl font-bold transition"
                >
                  {t.addWordBtn}
                </button>
                <button
                  type="button"
                  onClick={() => {
                    setCsvOpenDeck(isCsvOpen ? null : d.deckKey);
                    setCsvText('');
                  }}
                  className={`px-3 py-2.5 rounded-xl font-bold transition ${
                    isCsvOpen
                      ? 'bg-slate-900 dark:bg-slate-700 text-white'
                      : 'bg-slate-100 dark:bg-slate-800 hover:bg-slate-200 dark:hover:bg-slate-700 text-slate-700 dark:text-slate-200'
                  }`}
                >
                  CSV
                </button>
              </div>

              {isCsvOpen && (
                <div className="pt-2.5 border-t border-slate-100 dark:border-slate-800 space-y-2.5 text-sm">
                  <AiPromptBuilder
                    defaultOrigLang={d.origLang}
                    defaultLearningLang={d.learningLang}
                  />
                  <textarea
                    rows={3}
                    value={csvText}
                    onChange={(e) => setCsvText(e.target.value)}
                    placeholder="Learning;Orig;Example_Learning;Example_Orig;Context;Tags"
                    className="w-full font-mono text-xs p-2.5 border border-slate-300 dark:border-slate-700 rounded-xl bg-slate-50 dark:bg-slate-950"
                  />
                  <div className="flex gap-2">
                    <button
                      type="button"
                      onClick={() => {
                        if (!csvText.trim()) return;
                        onImportCsvToDeck(d.deckKey, csvText);
                        setCsvText('');
                        setCsvOpenDeck(null);
                      }}
                      className="flex-1 py-2 bg-blue-600 hover:bg-blue-700 text-white rounded-xl font-bold text-xs transition"
                    >
                      {t.importToDeck}
                    </button>
                    <button
                      type="button"
                      onClick={() => onExportCsvForDeck(d.deckKey)}
                      className="flex-1 py-2 bg-slate-200 dark:bg-slate-800 hover:bg-slate-300 dark:hover:bg-slate-700 rounded-xl font-bold text-xs transition"
                    >
                      {t.exportCsv}
                    </button>
                  </div>
                </div>
              )}
            </div>
          );
        })}
      </div>
    </div>
  );
}
