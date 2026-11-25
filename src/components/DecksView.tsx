import { useState, type FormEvent } from 'react';
import type { Card, Deck } from '../types';

interface DecksViewProps {
  decks: Deck[];
  allCards: Card[];
  activeDeckKey: string;
  onSelectDeck: (deckKey: string) => void;
  onCreateDeck: (name: string, description: string) => void;
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
  onDeleteDeck,
  onAddCardToDeck,
  onImportCsvToDeck,
  onExportCsvForDeck,
  onBackToStudy,
}: DecksViewProps) {
  const [name, setName] = useState('');
  const [description, setDescription] = useState('');
  const [csvOpenDeck, setCsvOpenDeck] = useState<string | null>(null);
  const [csvText, setCsvText] = useState('');
  const [confirmDeleteKey, setConfirmDeleteKey] = useState<string | null>(null);

  const handleCreate = (e: FormEvent) => {
    e.preventDefault();
    if (!name.trim()) return;
    onCreateDeck(name.trim(), description.trim());
    setName('');
    setDescription('');
  };

  return (
    <div className="flex-1 overflow-y-auto py-1 space-y-3 pb-6">
      <div className="flex items-center justify-between">
        <div>
          <h2 className="text-sm font-black tracking-tight">Мои колоды</h2>
          <p className="text-[10px] text-slate-400">
            Всего колод: {decks.length} • Карточек: {allCards.length}
          </p>
        </div>
        <button
          type="button"
          onClick={onBackToStudy}
          className="px-3 py-1.5 bg-blue-600 hover:bg-blue-700 text-white rounded-xl text-xs font-bold transition"
        >
          ← К карточкам
        </button>
      </div>

      {/* Create New Deck Form */}
      <form
        onSubmit={handleCreate}
        className="bg-white dark:bg-slate-900 border border-slate-200 dark:border-slate-800 rounded-2xl p-3 shadow-sm space-y-2 text-xs"
      >
        <div className="font-bold text-slate-800 dark:text-slate-200">Создать новую колоду</div>
        <div className="flex gap-2">
          <input
            type="text"
            required
            value={name}
            onChange={(e) => setName(e.target.value)}
            placeholder="Название (например: Работа, Медицина...)"
            className="flex-1 p-2 bg-slate-50 dark:bg-slate-950 border border-slate-300 dark:border-slate-700 rounded-xl text-xs focus:outline-none focus:border-blue-500"
          />
          <button
            type="submit"
            className="px-3.5 py-2 bg-blue-600 hover:bg-blue-700 text-white font-bold rounded-xl text-xs transition flex-none"
          >
            Создать
          </button>
        </div>
        <input
          type="text"
          value={description}
          onChange={(e) => setDescription(e.target.value)}
          placeholder="Краткое описание (необязательно)"
          className="w-full p-2 bg-slate-50 dark:bg-slate-950 border border-slate-300 dark:border-slate-700 rounded-xl text-[11px] focus:outline-none focus:border-blue-500"
        />
      </form>

      {/* Deck Cards List */}
      <div className="space-y-2.5">
        {decks.map((d) => {
          const cards = allCards.filter((c) => c.deckKey === d.deckKey);
          const mastered = cards.filter((c) => c.reps >= 3).length;
          const learning = cards.filter((c) => c.reps > 0 && c.reps < 3).length;
          const newCount = cards.filter((c) => c.reps === 0).length;
          const pct = cards.length > 0 ? Math.round((mastered / cards.length) * 100) : 0;
          const isActive = d.deckKey === activeDeckKey;
          const isCsvOpen = csvOpenDeck === d.deckKey;
          const isConfirmingDelete = confirmDeleteKey === d.deckKey;

          return (
            <div
              key={d.deckKey}
              className={`bg-white dark:bg-slate-900 rounded-2xl p-3.5 shadow-sm border transition space-y-2.5 ${
                isActive
                  ? 'border-blue-500 ring-1 ring-blue-500/30'
                  : 'border-slate-200 dark:border-slate-800'
              }`}
            >
              <div className="flex items-start justify-between gap-2">
                <div className="min-w-0 flex-1">
                  <div className="flex items-center gap-1.5">
                    <h3 className="text-sm font-bold text-slate-900 dark:text-white truncate">
                      {d.name}
                    </h3>
                    {d.isDefault && (
                      <span className="px-1.5 py-0.5 rounded text-[9px] font-bold bg-slate-100 dark:bg-slate-800 text-slate-500 dark:text-slate-400 flex-none">
                        Default
                      </span>
                    )}
                    {isActive && (
                      <span className="px-1.5 py-0.5 rounded text-[9px] font-bold bg-blue-100 dark:bg-blue-950 text-blue-700 dark:text-blue-300 flex-none">
                        Активна
                      </span>
                    )}
                  </div>
                  {d.description && (
                    <p className="text-[11px] text-slate-500 dark:text-slate-400 truncate mt-0.5">
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
                          className="px-2 py-1 rounded-lg bg-rose-600 text-white text-[10px] font-bold"
                        >
                          Удалить?
                        </button>
                        <button
                          type="button"
                          onClick={() => setConfirmDeleteKey(null)}
                          className="px-1.5 py-1 rounded-lg bg-slate-200 dark:bg-slate-800 text-[10px] font-bold"
                        >
                          Отмена
                        </button>
                      </div>
                    ) : (
                      <button
                        type="button"
                        onClick={() => setConfirmDeleteKey(d.deckKey)}
                        className="px-2 py-1 text-[10px] font-bold text-rose-600 dark:text-rose-400 hover:bg-rose-50 dark:hover:bg-rose-950 rounded-lg transition"
                      >
                        Удалить
                      </button>
                    )}
                  </div>
                )}
              </div>

              {/* Progress Bar & Counters */}
              <div>
                <div className="flex items-center justify-between text-[10px] text-slate-500 dark:text-slate-400 mb-1">
                  <span>
                    Карточек: <strong>{cards.length}</strong> (Новые: {newCount} • Учим: {learning} • Выучено: {mastered})
                  </span>
                  <span className="font-bold text-emerald-600 dark:text-emerald-400">{pct}%</span>
                </div>
                <div className="w-full h-1.5 rounded-full bg-slate-200 dark:bg-slate-800 overflow-hidden">
                  <div
                    className="bg-emerald-500 h-full transition-all duration-300"
                    style={{ width: `${pct}%` }}
                  />
                </div>
              </div>

              {/* Deck Actions */}
              <div className="flex items-center gap-1.5 pt-0.5 text-[11px]">
                <button
                  type="button"
                  onClick={() => onSelectDeck(d.deckKey)}
                  className="flex-1 py-2 bg-blue-600 hover:bg-blue-700 text-white rounded-xl font-bold transition"
                >
                  {isActive ? 'Продолжить учить' : 'Учить колоду'}
                </button>
                <button
                  type="button"
                  onClick={() => onAddCardToDeck(d.deckKey)}
                  className="px-2.5 py-2 bg-slate-100 dark:bg-slate-800 hover:bg-slate-200 dark:hover:bg-slate-700 text-slate-700 dark:text-slate-200 rounded-xl font-bold transition"
                >
                  + Слово
                </button>
                <button
                  type="button"
                  onClick={() => {
                    setCsvOpenDeck(isCsvOpen ? null : d.deckKey);
                    setCsvText('');
                  }}
                  className={`px-2.5 py-2 rounded-xl font-bold transition ${
                    isCsvOpen
                      ? 'bg-slate-900 dark:bg-slate-700 text-white'
                      : 'bg-slate-100 dark:bg-slate-800 hover:bg-slate-200 dark:hover:bg-slate-700 text-slate-700 dark:text-slate-200'
                  }`}
                >
                  CSV
                </button>
              </div>

              {/* Inline CSV Import / Export for this Deck */}
              {isCsvOpen && (
                <div className="pt-2 border-t border-slate-100 dark:border-slate-800 space-y-2 text-xs">
                  <textarea
                    rows={3}
                    value={csvText}
                    onChange={(e) => setCsvText(e.target.value)}
                    placeholder="German;Russian;Example_DE;Example_RU;Context;Tags"
                    className="w-full font-mono text-[11px] p-2 border border-slate-300 dark:border-slate-700 rounded-xl bg-slate-50 dark:bg-slate-950"
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
                      className="flex-1 py-1.5 bg-blue-600 text-white rounded-xl font-bold text-[11px]"
                    >
                      Импорт в эту колоду
                    </button>
                    <button
                      type="button"
                      onClick={() => onExportCsvForDeck(d.deckKey)}
                      className="flex-1 py-1.5 bg-slate-200 dark:bg-slate-800 rounded-xl font-bold text-[11px]"
                    >
                      Экспорт CSV
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
