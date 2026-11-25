import type { Card } from '../types';
import { generateCustomKey, normalizeCard } from '../lib/srs';
import { supabase } from '../lib/supabase';

export type CefrLevel = 'A1-A2' | 'B1' | 'B2' | 'C1';
export type CatalogLang = 'RU' | 'EN' | 'DE' | 'FR';
export type PairGroup = 'ru-en' | 'ru-de' | 'en-de' | 'ru-fr' | 'en-fr' | 'de-fr';

export interface StarterPair {
  id: string;
  origLang: CatalogLang;
  learningLang: CatalogLang;
  pairGroup: PairGroup;
}

export interface LevelInfo {
  level: CefrLevel;
  descRu: string;
  descEn: string;
}

export const STARTER_LEVELS: readonly LevelInfo[] = [
  {
    level: 'A1-A2',
    descRu: 'Базовая лексика: дом, еда, транспорт, работа, числа и время',
    descEn: 'Core essentials: home, food, travel, work, time & daily verbs',
  },
  {
    level: 'B1',
    descRu: 'Повседневное общение, учёба, планы, мнения и союзы',
    descEn: 'Everyday communication, study, opinions, plans & connectors',
  },
  {
    level: 'B2',
    descRu: 'Работа, бизнес, глаголы с предлогами и сложные конструкции',
    descEn: 'Work, business, prepositional verbs & complex connectors',
  },
  {
    level: 'C1',
    descRu: 'Академическая, деловая и аналитическая лексика',
    descEn: 'Academic, formal, analytical & nuanced vocabulary',
  },
];

export const STARTER_PAIRS: readonly StarterPair[] = [
  { id: 'ru-en', origLang: 'RU', learningLang: 'EN', pairGroup: 'ru-en' },
  { id: 'en-ru', origLang: 'EN', learningLang: 'RU', pairGroup: 'ru-en' },
  { id: 'ru-de', origLang: 'RU', learningLang: 'DE', pairGroup: 'ru-de' },
  { id: 'de-ru', origLang: 'DE', learningLang: 'RU', pairGroup: 'ru-de' },
  { id: 'en-de', origLang: 'EN', learningLang: 'DE', pairGroup: 'en-de' },
  { id: 'de-en', origLang: 'DE', learningLang: 'EN', pairGroup: 'en-de' },
  { id: 'ru-fr', origLang: 'RU', learningLang: 'FR', pairGroup: 'ru-fr' },
  { id: 'fr-ru', origLang: 'FR', learningLang: 'RU', pairGroup: 'ru-fr' },
  { id: 'en-fr', origLang: 'EN', learningLang: 'FR', pairGroup: 'en-fr' },
  { id: 'fr-en', origLang: 'FR', learningLang: 'EN', pairGroup: 'en-fr' },
  { id: 'de-fr', origLang: 'DE', learningLang: 'FR', pairGroup: 'de-fr' },
  { id: 'fr-de', origLang: 'FR', learningLang: 'DE', pairGroup: 'de-fr' },
];

export function getCatalogCorpusKey(
  level: CefrLevel,
  origLang: CatalogLang,
  learningLang: CatalogLang
): string {
  return origLang === 'FR' || learningLang === 'FR' ? `FR-${level}` : level;
}

type CsvRow = Record<string, string>;

function parseCsvToRecords(csvContent: string): CsvRow[] {
  const lines = csvContent
    .trim()
    .split('\n')
    .map((l) => l.trim())
    .filter(Boolean);
  if (lines.length < 2) return [];

  const headers = lines[0].split(';').map((h) => h.trim().replace(/^"|"$/g, ''));
  const records: CsvRow[] = [];

  for (let i = 1; i < lines.length; i++) {
    const parts = lines[i].split(';').map((p) => p.trim().replace(/^"|"$/g, ''));
    if (parts.length < 3) continue;
    const row: CsvRow = {};
    headers.forEach((h, idx) => {
      row[h] = parts[idx] || '';
    });
    records.push(row);
  }
  return records;
}

function pickTerm(row: CsvRow, lang: CatalogLang): string {
  if (lang === 'DE') return row.de || '';
  if (lang === 'EN') return row.en || '';
  if (lang === 'FR') return row.fr || '';
  return row.ru || '';
}

function pickExample(row: CsvRow, lang: CatalogLang): string {
  if (lang === 'DE') return row.exDe || '';
  if (lang === 'EN') return row.exEn || '';
  if (lang === 'FR') return row.exFr || '';
  return row.exRu || '';
}

/**
 * Fetches starter deck word counts from Supabase (`public.catalog_corpora`).
 */
export async function fetchStarterCatalogCounts(): Promise<Record<string, number>> {
  const { data, error } = await supabase
    .from('catalog_corpora')
    .select('level, word_count');

  if (error || !Array.isArray(data)) {
    return {};
  }

  const counts: Record<string, number> = {};
  for (const row of data) {
    if (
      typeof row.level === 'string' &&
      typeof row.word_count === 'number' &&
      row.word_count > 0
    ) {
      counts[row.level] = row.word_count;
    }
  }
  return counts;
}

/**
 * Fetches starter deck CSV from Supabase (`public.catalog_corpora`) and builds
 * cards for the requested language direction.
 */
export async function loadStarterDeckCards(
  level: CefrLevel,
  origLang: CatalogLang,
  learningLang: CatalogLang,
  deckKey: string
): Promise<Card[]> {
  const corpusKey = getCatalogCorpusKey(level, origLang, learningLang);
  const { data, error } = await supabase
    .from('catalog_corpora')
    .select('csv_content')
    .eq('level', corpusKey)
    .maybeSingle();

  if (error) {
    throw new Error(error.message);
  }
  if (!data || typeof data.csv_content !== 'string' || !data.csv_content.trim()) {
    const seedFile = corpusKey.startsWith('FR-')
      ? 'supabase_seed_catalog_fr.sql'
      : 'supabase_seed_catalog.sql';
    throw new Error(`Catalog "${corpusKey}" not found in Supabase (run ${seedFile})`);
  }

  const rows = parseCsvToRecords(data.csv_content);
  const now = Date.now();

  return rows.map((row, idx) =>
    normalizeCard(
      {
        id: now + idx,
        deckKey,
        cardKey: generateCustomKey(),
        learning: pickTerm(row, learningLang),
        orig: pickTerm(row, origLang),
        example_learning: pickExample(row, learningLang),
        example_orig: pickExample(row, origLang),
        context: learningLang === 'DE' || learningLang === 'FR' ? row.ctx || '' : '',
        tags: row.tags || '',
        isCustom: true,
        reps: 0,
        interval: 0,
        nextReview: 0,
        updatedAt: now,
      },
      idx
    )
  );
}
