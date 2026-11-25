import { useEffect, useState } from 'react';
import type { Deck } from '../types';
import {
  STARTER_LEVELS,
  STARTER_PAIRS,
  fetchStarterCatalogCounts,
  getCatalogCorpusKey,
  type CatalogLang,
  type CefrLevel,
  type PairGroup,
} from '../data/starterDecks';
import { useI18n } from '../lib/I18nContext';

interface StarterDecksCatalogProps {
  decks: Deck[];
  onAddStarterDeck: (
    level: CefrLevel,
    origLang: CatalogLang,
    learningLang: CatalogLang
  ) => Promise<void>;
  defaultOpen?: boolean;
}

export function StarterDecksCatalog({
  decks,
  onAddStarterDeck,
  defaultOpen = false,
}: StarterDecksCatalogProps) {
  const { locale, t } = useI18n();
  const [pairFilter, setPairFilter] = useState<'all' | PairGroup>('all');
  const [levelFilter, setLevelFilter] = useState<'all' | CefrLevel>('all');
  const [loadingPresetId, setLoadingPresetId] = useState<string | null>(null);
  const [catalogCounts, setCatalogCounts] = useState<Record<string, number>>({});

  useEffect(() => {
    let active = true;
    fetchStarterCatalogCounts().then((counts) => {
      if (active) setCatalogCounts(counts);
    });
    return () => {
      active = false;
    };
  }, []);

  return (
    <details
      open={defaultOpen || undefined}
      className="bg-white dark:bg-slate-900 border border-indigo-200 dark:border-indigo-800/60 rounded-2xl p-3 shadow-sm text-xs"
    >
      <summary className="font-bold text-indigo-700 dark:text-indigo-300 cursor-pointer select-none">
        {t.starterCatalogTitle}
      </summary>
      <div className="mt-2.5 space-y-2.5">
        <p className="text-[10px] text-slate-500 dark:text-slate-400 leading-relaxed">
          {t.starterCatalogDesc}
        </p>

        {/* Pair group filter */}
        <div className="flex gap-1 overflow-x-auto pb-0.5 text-[10px]">
          {(
            [
              ['all', t.starterAllPairs],
              ['ru-en', 'RU ↔ EN'],
              ['ru-de', 'RU ↔ DE'],
              ['en-de', 'EN ↔ DE'],
              ['ru-fr', 'RU ↔ FR'],
              ['en-fr', 'EN ↔ FR'],
              ['de-fr', 'DE ↔ FR'],
            ] as const
          ).map(([val, label]) => (
            <button
              key={val}
              type="button"
              onClick={() => setPairFilter(val)}
              className={`px-2 py-1 rounded-lg font-bold whitespace-nowrap ${
                pairFilter === val
                  ? 'bg-indigo-600 text-white'
                  : 'bg-slate-100 dark:bg-slate-800 text-slate-600 dark:text-slate-300'
              }`}
            >
              {label}
            </button>
          ))}
        </div>

        {/* Level filter */}
        <div className="flex gap-1 overflow-x-auto pb-0.5 text-[10px]">
          <button
            type="button"
            onClick={() => setLevelFilter('all')}
            className={`px-2 py-1 rounded-lg font-bold whitespace-nowrap ${
              levelFilter === 'all'
                ? 'bg-blue-600 text-white'
                : 'bg-slate-100 dark:bg-slate-800 text-slate-600 dark:text-slate-300'
            }`}
          >
            {t.starterAllLevels}
          </button>
          {STARTER_LEVELS.map((info) => (
            <button
              key={info.level}
              type="button"
              onClick={() => setLevelFilter(info.level)}
              className={`px-2 py-1 rounded-lg font-bold whitespace-nowrap ${
                levelFilter === info.level
                  ? 'bg-blue-600 text-white'
                  : 'bg-slate-100 dark:bg-slate-800 text-slate-600 dark:text-slate-300'
              }`}
            >
              {info.level}
            </button>
          ))}
        </div>

        {/* Matching Presets */}
        <div className="max-h-60 overflow-y-auto space-y-1.5 pr-0.5">
          {STARTER_PAIRS.filter((p) => pairFilter === 'all' || p.pairGroup === pairFilter).flatMap(
            (pair) =>
              STARTER_LEVELS.filter((info) => levelFilter === 'all' || info.level === levelFilter).map(
                (info) => {
                  const level = info.level;
                  const corpusKey = getCatalogCorpusKey(level, pair.origLang, pair.learningLang);
                  const count = catalogCounts[corpusKey];
                  const presetId = `${pair.id}_${level}`;
                  const presetName = `${pair.origLang} → ${pair.learningLang} • ${level}`;
                  const desc = locale === 'ru' ? info.descRu : info.descEn;
                  const alreadyAdded = decks.some(
                    (d) =>
                      d.origLang === pair.origLang &&
                      d.learningLang === pair.learningLang &&
                      d.name === presetName
                  );
                  const isLoading = loadingPresetId === presetId;

                  return (
                    <div
                      key={presetId}
                      className="flex items-center justify-between gap-2 p-2 rounded-xl bg-slate-50 dark:bg-slate-800/60 border border-slate-200 dark:border-slate-700"
                    >
                      <div className="min-w-0 flex-1">
                        <div className="flex items-center gap-1.5">
                          <span className="font-bold text-slate-900 dark:text-white text-[11px]">
                            {presetName}
                          </span>
                          {typeof count === 'number' && count > 0 && (
                            <span className="text-[10px] text-slate-400">
                              • {t.starterWordsCount(count)}
                            </span>
                          )}
                        </div>
                        <div className="text-[10px] text-slate-500 dark:text-slate-400 truncate">
                          {desc}
                        </div>
                      </div>
                      <button
                        type="button"
                        disabled={isLoading}
                        onClick={async () => {
                          setLoadingPresetId(presetId);
                          try {
                            await onAddStarterDeck(level, pair.origLang, pair.learningLang);
                          } finally {
                            setLoadingPresetId(null);
                          }
                        }}
                        className={`px-2.5 py-1 rounded-lg text-[10px] font-bold transition flex-none ${
                          alreadyAdded
                            ? 'bg-emerald-100 dark:bg-emerald-950 text-emerald-700 dark:text-emerald-300'
                            : 'bg-indigo-600 hover:bg-indigo-700 text-white'
                        } ${isLoading ? 'opacity-60' : ''}`}
                      >
                        {isLoading
                          ? t.starterLoadingBtn
                          : alreadyAdded
                            ? t.starterAddedBtn
                            : t.starterAddBtn}
                      </button>
                    </div>
                  );
                }
              )
          )}
        </div>
      </div>
    </details>
  );
}
