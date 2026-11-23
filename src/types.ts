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

export interface Card {
  id: number | string;
  cardKey: string;
  german: string;
  russian: string;
  example_de: string;
  example_ru: string;
  context: string;
  tags: string;
  isCustom: boolean;
  reps: number;
  interval: number;
  nextReview: number;
  updatedAt: number;
}

export type Rating = 'again' | 'hard' | 'good' | 'easy';
export type StudyMode = 'de-ru' | 'ru-de' | 'mixed';
export type Direction = 'de-ru' | 'ru-de';
export type ProgressFilter = 'all' | 'mastered' | 'learning' | 'new' | 'custom';

export interface SyncState {
  status: 'local' | 'syncing' | 'synced' | 'error';
  message: string;
}

export interface DailyStats {
  dailyLimit: number;
  dailyReviewedCount: number;
  maxActiveUnknown: number;
}

export interface SpeechSettings {
  voiceName: string;
  rate: number;
  pitch: number;
  autoPlay: boolean;
}
