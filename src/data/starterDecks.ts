import type { Card } from '../types';
import { generateCustomKey, normalizeCard } from '../lib/srs';
import { supabase } from '../lib/supabase';

export type CefrLevel = 'A1-A2' | 'B1' | 'B2' | 'C1';
export type CatalogLang = 'RU' | 'EN' | 'DE';

export interface StarterPair {
  id: string;
  origLang: CatalogLang;
  learningLang: CatalogLang;
  pairGroup: 'ru-en' | 'ru-de' | 'en-de';
}

export interface LevelInfo {
  level: CefrLevel;
  wordCount: number;
  descRu: string;
  descEn: string;
}

export const STARTER_LEVELS: readonly LevelInfo[] = [
  {
    level: 'A1-A2',
    wordCount: 199,
    descRu: 'Базовая лексика: дом, еда, транспорт, работа, числа и время',
    descEn: 'Core essentials: home, food, travel, work, time & daily verbs',
  },
  {
    level: 'B1',
    wordCount: 200,
    descRu: 'Повседневное общение, учёба, планы, мнения и союзы',
    descEn: 'Everyday communication, study, opinions, plans & connectors',
  },
  {
    level: 'B2',
    wordCount: 180,
    descRu: 'Работа, бизнес, глаголы с предлогами, NVV и сложные союзы',
    descEn: 'Work, business, prepositional verbs, NVV & complex connectors',
  },
  {
    level: 'C1',
    wordCount: 140,
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
];

type CsvTuple = readonly [
  de: string,
  en: string,
  ru: string,
  exDe: string,
  exEn: string,
  exRu: string,
  ctx: string,
  tags: string,
];

function pickTerm(tuple: CsvTuple, lang: CatalogLang): string {
  if (lang === 'DE') return tuple[0];
  if (lang === 'EN') return tuple[1];
  return tuple[2];
}

function pickExample(tuple: CsvTuple, lang: CatalogLang): string {
  if (lang === 'DE') return tuple[3];
  if (lang === 'EN') return tuple[4];
  return tuple[5];
}

function parseCsvToTuples(csvContent: string): CsvTuple[] {
  const lines = csvContent.trim().split('\n');
  const tuples: CsvTuple[] = [];
  for (const line of lines) {
    const parts = line.split(';').map((p) => p.trim().replace(/^"|"$/g, ''));
    if (parts.length < 3 || parts[0].toLowerCase() === 'de') continue;
    tuples.push([
      parts[0] || '',
      parts[1] || '',
      parts[2] || '',
      parts[3] || '',
      parts[4] || '',
      parts[5] || '',
      parts[6] || '',
      parts[7] || '',
    ]);
  }
  return tuples;
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
  const { data, error } = await supabase
    .from('catalog_corpora')
    .select('csv_content')
    .eq('level', level)
    .maybeSingle();

  if (error) {
    throw new Error(error.message);
  }
  if (!data || typeof data.csv_content !== 'string' || !data.csv_content.trim()) {
    throw new Error(`Catalog "${level}" not found in Supabase (run supabase_seed_catalog.sql)`);
  }

  const tuples = parseCsvToTuples(data.csv_content);
  const now = Date.now();

  return tuples.map((tuple, idx) =>
    normalizeCard(
      {
        id: now + idx,
        deckKey,
        cardKey: generateCustomKey(),
        learning: pickTerm(tuple, learningLang),
        orig: pickTerm(tuple, origLang),
        example_learning: pickExample(tuple, learningLang),
        example_orig: pickExample(tuple, origLang),
        context: learningLang === 'DE' ? tuple[6] : '',
        tags: tuple[7],
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
