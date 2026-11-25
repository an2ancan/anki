export interface RawCorpusCard {
  id: number;
  german: string;
  russian: string;
  example_de: string;
  example_ru: string;
  context: string;
  tags: string;
  reps: number;
  interval: number;
  nextReview: number;
}

export const DEFAULT_DECK_KEY = 'default';

export interface Deck {
  deckKey: string;
  name: string;
  description: string;
  origLang: string;
  learningLang: string;
  isDefault: boolean;
  createdAt: number;
  updatedAt: number;
}

export interface Card {
  id: number | string;
  deckKey: string;
  cardKey: string;
  learning: string;
  orig: string;
  example_learning: string;
  example_orig: string;
  context: string;
  tags: string;
  isCustom: boolean;
  reps: number;
  interval: number;
  nextReview: number;
  updatedAt: number;
}

export type Rating = 'again' | 'hard' | 'good' | 'easy';
export type StudyMode = 'learning-orig' | 'orig-learning' | 'mixed';
export type Direction = 'learning-orig' | 'orig-learning';
export type ProgressFilter = 'all' | 'mastered' | 'learning' | 'new' | 'custom';

export interface QueueItem {
  card: Card;
  direction: Direction;
}

export interface SyncState {
  status: 'local' | 'syncing' | 'synced' | 'error';
  message: string;
}

export interface DailyStats {
  dailyLimit: number;
  dailyReviewedCount: number;
  activeDeckKey: string;
  maxActiveUnknown: number;
  activeCardKeys: string[];
  currentStreak: number;
  bestStreak: number;
  lastStudyDate: string;
  reviewHistory: Record<string, number>;
}

export type TtsEngine = 'system' | 'google';

export interface SpeechSettings {
  engine: TtsEngine;
  voiceName: string;
  googleVoiceName: string;
  googleApiKey: string;
  rate: number;
  pitch: number;
  autoPlay: boolean;
}
