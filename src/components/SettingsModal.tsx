import { useEffect, useState } from 'react';
import type { Card, Deck, SpeechSettings, TtsEngine } from '../types';
import { GOOGLE_DE_VOICES, rankVoice } from '../lib/speech';
import { clearAudioCache, getAudioCacheCount } from '../lib/audioCache';
import { useI18n } from '../lib/I18nContext';
import { InfoTip } from './InfoTip';

interface SettingsModalProps {
  isOpen: boolean;
  onClose: () => void;
  decks: Deck[];
  activeDeckKey: string;
  voices: SpeechSynthesisVoice[];
  speechSettings: SpeechSettings;
  onUpdateSpeech: (next: SpeechSettings) => void;
  onTestVoice: () => void;
  dailyLimit: number;
  maxActiveUnknown: number;
  onSaveDailyLimit: (limit: number) => void;
  onSaveMaxActiveUnknown: (max: number) => void;
  customCards: Card[];
  onOpenAddCard: () => void;
  onDeleteCustomCard: (cardKey: string) => void;
  onImportCsv: (deckKey: string, rawCsv: string) => void;
  onExportCsv: (deckKey: string) => void;
}

export function SettingsModal({
  isOpen,
  onClose,
  decks,
  activeDeckKey,
  voices,
  speechSettings,
  onUpdateSpeech,
  onTestVoice,
  dailyLimit,
  maxActiveUnknown,
  onSaveDailyLimit,
  onSaveMaxActiveUnknown,
  customCards,
  onOpenAddCard,
  onDeleteCustomCard,
  onImportCsv,
  onExportCsv,
}: SettingsModalProps) {
  const { locale, setLocale, t } = useI18n();
  const [limitInput, setLimitInput] = useState(String(dailyLimit));
  const [unknownLimitInput, setUnknownLimitInput] = useState(String(maxActiveUnknown));
  const [csvDeckKey, setCsvDeckKey] = useState(activeDeckKey);
  const [search, setSearch] = useState('');
  const [csvText, setCsvText] = useState('');
  const [cacheCount, setCacheCount] = useState(0);

  useEffect(() => {
    if (isOpen) {
      setLimitInput(String(dailyLimit));
      setUnknownLimitInput(String(maxActiveUnknown));
      setCsvDeckKey(activeDeckKey);
      getAudioCacheCount().then(setCacheCount);
    }
  }, [isOpen, dailyLimit, maxActiveUnknown, activeDeckKey]);

  if (!isOpen) return null;

  const query = search.trim().toLowerCase();
  const filteredCustom = query
    ? customCards.filter(
        (c) =>
          c.learning.toLowerCase().includes(query) ||
          c.orig.toLowerCase().includes(query) ||
          c.tags.toLowerCase().includes(query)
      )
    : customCards;

  return (
    <div
      role="dialog"
      aria-modal="true"
      onClick={(e) => e.target === e.currentTarget && onClose()}
      className="fixed inset-0 bg-slate-900/60 backdrop-blur-sm z-50 flex items-end sm:items-center justify-center p-0 sm:p-4"
    >
      <div className="bg-white dark:bg-slate-900 border border-slate-200 dark:border-slate-800 w-full max-w-lg rounded-t-3xl sm:rounded-3xl p-4 sm:p-6 shadow-2xl flex flex-col max-h-[88dvh] overflow-hidden">
        <div className="flex items-center justify-between pb-3 border-b border-slate-200 dark:border-slate-800">
          <h3 className="text-sm font-bold">{t.settingsHeader}</h3>
          <button type="button" onClick={onClose} className="text-slate-400 p-1" aria-label={t.close}>
            <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M6 18L18 6M6 6l12 12" />
            </svg>
          </button>
        </div>

        <div className="flex-1 overflow-y-auto py-3 space-y-3 text-xs">
          {/* UI Language Switcher */}
          <div className="bg-slate-50 dark:bg-slate-800/60 p-3 rounded-2xl border border-slate-200 dark:border-slate-700 flex items-center justify-between gap-2">
            <div className="font-bold text-slate-800 dark:text-slate-200">{t.interfaceLang}</div>
            <div className="grid grid-cols-2 gap-1 bg-slate-200/70 dark:bg-slate-900 p-1 rounded-xl">
              <button
                type="button"
                onClick={() => setLocale('ru')}
                className={`px-3 py-1 rounded-lg text-[11px] font-bold transition ${
                  locale === 'ru'
                    ? 'bg-white dark:bg-slate-800 text-slate-900 dark:text-white shadow-sm'
                    : 'text-slate-500 dark:text-slate-400'
                }`}
              >
                Русский
              </button>
              <button
                type="button"
                onClick={() => setLocale('en')}
                className={`px-3 py-1 rounded-lg text-[11px] font-bold transition ${
                  locale === 'en'
                    ? 'bg-white dark:bg-slate-800 text-slate-900 dark:text-white shadow-sm'
                    : 'text-slate-500 dark:text-slate-400'
                }`}
              >
                English
              </button>
            </div>
          </div>

          {/* Voice Settings */}
          <div className="bg-slate-50 dark:bg-slate-800/60 p-3 rounded-2xl border border-slate-200 dark:border-slate-700 space-y-2.5">
            <div className="font-bold text-slate-800 dark:text-slate-200 flex items-start justify-between gap-2">
              <div className="flex-1">
                <span>{t.voiceSection}</span>
                <InfoTip text={t.voiceTip} />
              </div>
              <label className="inline-flex items-center gap-1 font-normal cursor-pointer text-[11px] flex-none">
                <input
                  type="checkbox"
                  checked={speechSettings.autoPlay}
                  onChange={(e) => onUpdateSpeech({ ...speechSettings, autoPlay: e.target.checked })}
                  className="rounded text-blue-600"
                />
                <span>{t.autoPlay}</span>
              </label>
            </div>

            <div className="grid grid-cols-2 gap-1 bg-slate-200/70 dark:bg-slate-900 p-1 rounded-xl">
              {(['system', 'google'] as TtsEngine[]).map((eng) => (
                <button
                  key={eng}
                  type="button"
                  onClick={() => onUpdateSpeech({ ...speechSettings, engine: eng })}
                  className={`py-1.5 rounded-lg text-[11px] font-bold transition ${
                    speechSettings.engine === eng
                      ? 'bg-white dark:bg-slate-800 text-slate-900 dark:text-white shadow-sm'
                      : 'text-slate-500 dark:text-slate-400'
                  }`}
                >
                  {eng === 'system' ? t.engineSystem : t.engineGoogle}
                </button>
              ))}
            </div>

            {speechSettings.engine === 'system' ? (
              <div>
                <label className="text-[10px] text-slate-400 block mb-1">{t.selectSystemVoice}</label>
                <select
                  value={speechSettings.voiceName}
                  onChange={(e) => onUpdateSpeech({ ...speechSettings, voiceName: e.target.value })}
                  className="w-full p-2 bg-white dark:bg-slate-900 border border-slate-300 dark:border-slate-700 rounded-xl text-xs font-medium"
                >
                  {voices.map((v) => (
                    <option key={v.name} value={v.name}>
                      {rankVoice(v) >= 60 ? '★ ' : ''}
                      {v.name} ({v.lang})
                    </option>
                  ))}
                </select>
              </div>
            ) : (
              <div className="space-y-2">
                <div>
                  <label className="text-[10px] text-slate-400 block mb-1">{t.selectGoogleVoice}</label>
                  <select
                    value={speechSettings.googleVoiceName}
                    onChange={(e) =>
                      onUpdateSpeech({ ...speechSettings, googleVoiceName: e.target.value })
                    }
                    className="w-full p-2 bg-white dark:bg-slate-900 border border-slate-300 dark:border-slate-700 rounded-xl text-xs font-medium"
                  >
                    {GOOGLE_DE_VOICES.map((v) => (
                      <option key={v.id} value={v.id}>
                        {v.label}
                      </option>
                    ))}
                  </select>
                </div>
                <div>
                  <label className="text-[10px] text-slate-400 block mb-1">{t.personalKeyLabel}</label>
                  <input
                    type="password"
                    value={speechSettings.googleApiKey}
                    onChange={(e) =>
                      onUpdateSpeech({ ...speechSettings, googleApiKey: e.target.value })
                    }
                    placeholder={t.personalKeyPlaceholder}
                    className="w-full p-2 font-mono text-[11px] bg-white dark:bg-slate-900 border border-slate-300 dark:border-slate-700 rounded-xl"
                  />
                </div>
                <div className="flex items-center justify-between text-[10px] text-slate-500 dark:text-slate-400">
                  <span>{t.cachedPhrases(cacheCount)}</span>
                  {cacheCount > 0 && (
                    <button
                      type="button"
                      onClick={async () => {
                        await clearAudioCache();
                        setCacheCount(0);
                      }}
                      className="text-rose-600 dark:text-rose-400 font-semibold hover:underline"
                    >
                      {t.clearCache}
                    </button>
                  )}
                </div>
              </div>
            )}

            <div className="grid grid-cols-2 gap-2">
              <div>
                <label className="text-[10px] text-slate-400 block mb-1">
                  {t.speedLabel}: <span>{speechSettings.rate.toFixed(2)}x</span>
                </label>
                <input
                  type="range"
                  min="0.7"
                  max="1.2"
                  step="0.02"
                  value={speechSettings.rate}
                  onChange={(e) =>
                    onUpdateSpeech({ ...speechSettings, rate: parseFloat(e.target.value) })
                  }
                  className="w-full accent-blue-600"
                />
              </div>
              <div>
                <label className="text-[10px] text-slate-400 block mb-1">
                  {t.pitchLabel}: <span>{speechSettings.pitch.toFixed(2)}</span>
                </label>
                <input
                  type="range"
                  min="0.8"
                  max="1.2"
                  step="0.05"
                  value={speechSettings.pitch}
                  onChange={(e) =>
                    onUpdateSpeech({ ...speechSettings, pitch: parseFloat(e.target.value) })
                  }
                  className="w-full accent-blue-600"
                />
              </div>
            </div>
            <button
              type="button"
              onClick={onTestVoice}
              className="w-full py-1.5 bg-blue-50 dark:bg-blue-950 text-blue-600 dark:text-blue-300 rounded-lg text-xs font-semibold"
            >
              {t.testVoiceBtn}
            </button>
          </div>

          {/* Daily Limit */}
          <div className="bg-slate-50 dark:bg-slate-800/60 p-3 rounded-2xl border border-slate-200 dark:border-slate-700 flex items-start justify-between gap-2">
            <div className="flex-1">
              <div className="font-bold text-slate-800 dark:text-slate-200">
                {t.dailyLimitTitle}
                <InfoTip text={t.dailyLimitTip} />
              </div>
              <div className="text-[10px] text-slate-400">{t.dailyLimitHint}</div>
            </div>
            <div className="flex items-center gap-2 flex-none">
              <input
                type="number"
                min={5}
                max={300}
                step={5}
                value={limitInput}
                onChange={(e) => setLimitInput(e.target.value)}
                className="w-16 text-center font-bold text-xs p-1.5 rounded-lg border border-slate-300 dark:border-slate-600 bg-white dark:bg-slate-900"
              />
              <button
                type="button"
                onClick={() => {
                  const val = parseInt(limitInput, 10);
                  if (!Number.isNaN(val) && val >= 5) onSaveDailyLimit(val);
                }}
                className="px-2.5 py-1.5 bg-blue-600 text-white rounded-lg text-xs font-bold"
              >
                OK
              </button>
            </div>
          </div>

          {/* Max Active Unknown Words Limit */}
          <div className="bg-slate-50 dark:bg-slate-800/60 p-3 rounded-2xl border border-slate-200 dark:border-slate-700 flex items-start justify-between gap-2">
            <div className="flex-1">
              <div className="font-bold text-slate-800 dark:text-slate-200">
                {t.maxUnknownTitle}
                <InfoTip text={t.maxUnknownTip} />
              </div>
              <div className="text-[10px] text-slate-400">{t.maxUnknownHint}</div>
            </div>
            <div className="flex items-center gap-2 flex-none">
              <input
                type="number"
                min={1}
                max={100}
                step={1}
                value={unknownLimitInput}
                onChange={(e) => setUnknownLimitInput(e.target.value)}
                className="w-16 text-center font-bold text-xs p-1.5 rounded-lg border border-slate-300 dark:border-slate-600 bg-white dark:bg-slate-900"
              />
              <button
                type="button"
                onClick={() => {
                  const val = parseInt(unknownLimitInput, 10);
                  if (!Number.isNaN(val) && val >= 1) onSaveMaxActiveUnknown(val);
                }}
                className="px-2.5 py-1.5 bg-blue-600 text-white rounded-lg text-xs font-bold"
              >
                OK
              </button>
            </div>
          </div>

          {/* My Custom Cards */}
          <div className="border border-slate-200 dark:border-slate-700 rounded-2xl p-3 space-y-2">
            <div className="flex items-start justify-between gap-2">
              <div className="font-bold flex-1">
                {t.myCustomCards} ({customCards.length})
                <InfoTip text={t.myCustomCardsTip} />
              </div>
              <button
                type="button"
                onClick={onOpenAddCard}
                className="px-2 py-1 bg-blue-600 text-white rounded-lg text-[11px] font-bold flex-none"
              >
                {t.addBtnShort}
              </button>
            </div>
            <input
              type="search"
              value={search}
              onChange={(e) => setSearch(e.target.value)}
              placeholder={t.searchMyCardsPlaceholder}
              className="w-full text-xs p-2 border border-slate-300 dark:border-slate-700 rounded-xl bg-slate-50 dark:bg-slate-950 focus:outline-none focus:border-blue-500"
            />
            <div className="max-h-40 overflow-y-auto space-y-1.5">
              {filteredCustom.length === 0 ? (
                <div className="text-[11px] text-slate-400 text-center py-3">
                  {customCards.length === 0 ? t.noCustomCardsYet : t.nothingFound}
                </div>
              ) : (
                filteredCustom
                  .slice()
                  .reverse()
                  .map((card) => (
                    <div
                      key={card.cardKey}
                      className="flex items-center justify-between gap-2 p-2 rounded-xl bg-slate-50 dark:bg-slate-800/60 border border-slate-200 dark:border-slate-700"
                    >
                      <div className="min-w-0 flex-1">
                        <div className="font-bold text-slate-800 dark:text-slate-100 truncate">
                          {card.learning}
                        </div>
                        <div className="text-[11px] text-slate-500 dark:text-slate-400 truncate">
                          {card.orig}
                        </div>
                      </div>
                      <button
                        type="button"
                        onClick={() => onDeleteCustomCard(card.cardKey)}
                        className="px-2 py-1 text-[10px] font-bold text-rose-600 dark:text-rose-400 hover:bg-rose-100 dark:hover:bg-rose-950 rounded-lg transition flex-none"
                      >
                        {t.delete}
                      </button>
                    </div>
                  ))
              )}
            </div>
          </div>

          {/* CSV Import / Export */}
          <div className="border border-slate-200 dark:border-slate-700 rounded-2xl p-3 space-y-2">
            <div className="font-bold">
              {t.csvSection}
              <InfoTip text={t.csvTip} />
            </div>
            <select
              value={csvDeckKey}
              onChange={(e) => setCsvDeckKey(e.target.value)}
              className="w-full p-2 bg-slate-50 dark:bg-slate-950 border border-slate-300 dark:border-slate-700 rounded-xl text-xs font-semibold"
            >
              {decks.map((d) => (
                <option key={d.deckKey} value={d.deckKey}>
                  {t.deckPrefix}: {d.name}
                </option>
              ))}
            </select>
            <textarea
              rows={4}
              value={csvText}
              onChange={(e) => setCsvText(e.target.value)}
              placeholder="Learning;Orig;Example_Learning;Example_Orig;Context;Tags"
              className="w-full font-mono text-[11px] p-2 border border-slate-300 dark:border-slate-700 rounded-xl bg-slate-50 dark:bg-slate-950"
            />
            <div className="flex gap-2">
              <button
                type="button"
                onClick={() => {
                  if (!csvText.trim()) return;
                  onImportCsv(csvDeckKey, csvText);
                  setCsvText('');
                  onClose();
                }}
                className="flex-1 py-2 bg-blue-600 text-white rounded-xl font-bold"
              >
                {t.importAddBtn}
              </button>
              <button
                type="button"
                onClick={() => onExportCsv(csvDeckKey)}
                className="flex-1 py-2 bg-slate-200 dark:bg-slate-800 rounded-xl font-bold"
              >
                {t.exportBtn}
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}
