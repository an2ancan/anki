import { useEffect, useState } from 'react';
import type { Card, SpeechSettings, TtsEngine } from '../types';
import { GOOGLE_DE_VOICES, rankVoice } from '../lib/speech';
import { clearAudioCache, getAudioCacheCount } from '../lib/audioCache';
import { InfoTip } from './InfoTip';

interface SettingsModalProps {
  isOpen: boolean;
  onClose: () => void;
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
  onImportCsv: (rawCsv: string) => void;
  onExportCsv: () => void;
}

export function SettingsModal({
  isOpen,
  onClose,
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
  const [limitInput, setLimitInput] = useState(String(dailyLimit));
  const [unknownLimitInput, setUnknownLimitInput] = useState(String(maxActiveUnknown));
  const [search, setSearch] = useState('');
  const [csvText, setCsvText] = useState('');
  const [cacheCount, setCacheCount] = useState(0);

  useEffect(() => {
    if (isOpen) {
      setLimitInput(String(dailyLimit));
      setUnknownLimitInput(String(maxActiveUnknown));
      getAudioCacheCount().then(setCacheCount);
    }
  }, [isOpen, dailyLimit, maxActiveUnknown]);

  if (!isOpen) return null;

  const query = search.trim().toLowerCase();
  const filteredCustom = query
    ? customCards.filter(
        (c) =>
          c.german.toLowerCase().includes(query) ||
          c.russian.toLowerCase().includes(query) ||
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
          <h3 className="text-sm font-bold">Настройки и словарь</h3>
          <button type="button" onClick={onClose} className="text-slate-400 p-1" aria-label="Закрыть">
            <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M6 18L18 6M6 6l12 12" />
            </svg>
          </button>
        </div>

        <div className="flex-1 overflow-y-auto py-3 space-y-3 text-xs">
          {/* Voice Settings */}
          <div className="bg-slate-50 dark:bg-slate-800/60 p-3 rounded-2xl border border-slate-200 dark:border-slate-700 space-y-2.5">
            <div className="font-bold text-slate-800 dark:text-slate-200 flex items-start justify-between gap-2">
              <div className="flex-1">
                <span>Голос и произношение</span>
                <InfoTip text="«Google Cloud TTS» использует естественные нейронные голоса Google (озвучка кэшируется в IndexedDB браузера и повторно не тратит лимит). «Системный голос» работает офлайн через встроенный синтезатор вашего устройства." />
              </div>
              <label className="inline-flex items-center gap-1 font-normal cursor-pointer text-[11px] flex-none">
                <input
                  type="checkbox"
                  checked={speechSettings.autoPlay}
                  onChange={(e) => onUpdateSpeech({ ...speechSettings, autoPlay: e.target.checked })}
                  className="rounded text-blue-600"
                />
                <span>Автоозвучка</span>
              </label>
            </div>
            {/* Engine Switcher */}
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
                  {eng === 'system' ? 'Системный голос' : 'Google Cloud TTS'}
                </button>
              ))}
            </div>

            {speechSettings.engine === 'system' ? (
              <div>
                <label className="text-[10px] text-slate-400 block mb-1">
                  Выбор системного голоса (приоритет отдан нейросетям):
                </label>
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
                  <label className="text-[10px] text-slate-400 block mb-1">
                    Голос Google Cloud TTS (онлайн для ваших карточек + кэш):
                  </label>
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
                  <label className="text-[10px] text-slate-400 block mb-1">
                    Свой API Key (необязательно — если пусто, используется общий серверный ключ Supabase после входа):
                  </label>
                  <input
                    type="password"
                    value={speechSettings.googleApiKey}
                    onChange={(e) =>
                      onUpdateSpeech({ ...speechSettings, googleApiKey: e.target.value })
                    }
                    placeholder="Оставьте пустым для общего ключа..."
                    className="w-full p-2 font-mono text-[11px] bg-white dark:bg-slate-900 border border-slate-300 dark:border-slate-700 rounded-xl"
                  />
                </div>
                <div className="flex items-center justify-between text-[10px] text-slate-500 dark:text-slate-400">
                  <span>В кэше браузера: {cacheCount} фраз</span>
                  {cacheCount > 0 && (
                    <button
                      type="button"
                      onClick={async () => {
                        await clearAudioCache();
                        setCacheCount(0);
                      }}
                      className="text-rose-600 dark:text-rose-400 font-semibold hover:underline"
                    >
                      Очистить кэш
                    </button>
                  )}
                </div>
              </div>
            )}
            <div className="grid grid-cols-2 gap-2">
              <div>
                <label className="text-[10px] text-slate-400 block mb-1">
                  Скорость: <span>{speechSettings.rate.toFixed(2)}x</span>
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
                  Тон (Pitch): <span>{speechSettings.pitch.toFixed(2)}</span>
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
              Прослушать образец голоса
            </button>
          </div>

          {/* Daily Limit */}
          <div className="bg-slate-50 dark:bg-slate-800/60 p-3 rounded-2xl border border-slate-200 dark:border-slate-700 flex items-start justify-between gap-2">
            <div className="flex-1">
              <div className="font-bold text-slate-800 dark:text-slate-200">
                Дневной лимит показов:
                <InfoTip text="Максимальное число оценок карточек за один день. После достижения цели дневная норма считается выполненной, но вы всегда можете продолжить кнопкой «+20 карточек»." />
              </div>
              <div className="text-[10px] text-slate-400">Рекомендуется 60 для баланса</div>
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
                Макс. неизвестных слов одновременно:
                <InfoTip text="Сколько новых и сложных слов одновременно находится в активной очереди (сохраняется в Supabase). В режиме «Микс» каждое слово показывается с обеих сторон (DE→RU и RU→DE), и новое слово добавляется только после прохождения обеих сторон." />
              </div>
              <div className="text-[10px] text-slate-400">
                Новые + слова на повторении сегодня (по умолчанию 5)
              </div>
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
                Мои карточки ({customCards.length})
                <InfoTip text="Слова, которые вы добавили вручную (через кнопку «+») или импортировали из CSV. Они синхронизируются с вашим аккаунтом Supabase и доступны на всех устройствах." />
              </div>
              <button
                type="button"
                onClick={onOpenAddCard}
                className="px-2 py-1 bg-blue-600 text-white rounded-lg text-[11px] font-bold flex-none"
              >
                + Добавить
              </button>
            </div>
            <input
              type="search"
              value={search}
              onChange={(e) => setSearch(e.target.value)}
              placeholder="Поиск по моим карточкам..."
              className="w-full text-xs p-2 border border-slate-300 dark:border-slate-700 rounded-xl bg-slate-50 dark:bg-slate-950 focus:outline-none focus:border-blue-500"
            />
            <div className="max-h-40 overflow-y-auto space-y-1.5">
              {filteredCustom.length === 0 ? (
                <div className="text-[11px] text-slate-400 text-center py-3">
                  {customCards.length === 0
                    ? 'Вы ещё не добавили своих карточек.'
                    : 'Ничего не найдено.'}
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
                          {card.german}
                        </div>
                        <div className="text-[11px] text-slate-500 dark:text-slate-400 truncate">
                          {card.russian}
                        </div>
                      </div>
                      <button
                        type="button"
                        onClick={() => onDeleteCustomCard(card.cardKey)}
                        className="px-2 py-1 text-[10px] font-bold text-rose-600 dark:text-rose-400 hover:bg-rose-100 dark:hover:bg-rose-950 rounded-lg transition flex-none"
                      >
                        Удалить
                      </button>
                    </div>
                  ))
              )}
            </div>
          </div>

          {/* CSV Import / Export */}
          <div className="border border-slate-200 dark:border-slate-700 rounded-2xl p-3">
            <div className="font-bold mb-2">
              Импорт / Экспорт CSV
              <InfoTip text="Массовое добавление карточек списком (каждая строка: Немецкий;Русский;Пример DE;Пример RU;Контекст;Теги). Кнопка «Экспорт» скачивает всю вашу колоду в CSV-файл." />
            </div>
            <textarea
              rows={4}
              value={csvText}
              onChange={(e) => setCsvText(e.target.value)}
              placeholder="German;Russian;Example_DE;Example_RU;Context;Tags"
              className="w-full font-mono text-[11px] p-2 border border-slate-300 dark:border-slate-700 rounded-xl bg-slate-50 dark:bg-slate-950 mb-2"
            />
            <div className="flex gap-2">
              <button
                type="button"
                onClick={() => {
                  if (!csvText.trim()) return;
                  onImportCsv(csvText);
                  setCsvText('');
                  onClose();
                }}
                className="flex-1 py-2 bg-blue-600 text-white rounded-xl font-bold"
              >
                Добавить
              </button>
              <button
                type="button"
                onClick={onExportCsv}
                className="flex-1 py-2 bg-slate-200 dark:bg-slate-800 rounded-xl font-bold"
              >
                Экспорт
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}
