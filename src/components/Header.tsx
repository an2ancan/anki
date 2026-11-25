import type { StudyMode, SyncState } from '../types';
import { useI18n } from '../lib/I18nContext';

interface HeaderProps {
  activeDeckName: string;
  origLang: string;
  learningLang: string;
  voiceLabel: string;
  mode: StudyMode;
  onModeChange: (mode: StudyMode) => void;
  userEmail: string | null;
  syncState: SyncState;
  isDark: boolean;
  isDecksOpen: boolean;
  onToggleDecks: () => void;
  onOpenAddCard: () => void;
  onOpenAuth: () => void;
  onOpenSettings: () => void;
  onToggleTheme: () => void;
}

export function Header({
  activeDeckName,
  origLang,
  learningLang,
  voiceLabel,
  mode,
  onModeChange,
  userEmail,
  syncState,
  isDark,
  isDecksOpen,
  onToggleDecks,
  onOpenAddCard,
  onOpenAuth,
  onOpenSettings,
  onToggleTheme,
}: HeaderProps) {
  const { locale, setLocale, t } = useI18n();

  const dotClass = !userEmail
    ? 'bg-slate-400'
    : syncState.status === 'syncing'
      ? 'bg-amber-400 animate-pulse'
      : syncState.status === 'error'
        ? 'bg-rose-500'
        : 'bg-emerald-500';

  const authLabel = userEmail ? userEmail.split('@')[0] : t.signInShort;

  return (
    <header className="w-full flex-none bg-white/90 dark:bg-slate-900/90 backdrop-blur border-b border-slate-200 dark:border-slate-800 px-3 py-2 z-20">
      <div className="max-w-md mx-auto flex items-center justify-between gap-1.5">
        <button
          type="button"
          onClick={onToggleDecks}
          className={`flex items-center gap-2 text-left rounded-xl px-1.5 py-0.5 -ml-1.5 transition ${
            isDecksOpen
              ? 'bg-blue-50 dark:bg-blue-950/60'
              : 'hover:bg-slate-100 dark:hover:bg-slate-800'
          }`}
          title={t.decksCabinetTitle}
        >
          <div className="w-7 h-7 rounded-lg bg-blue-600 flex items-center justify-center text-white font-extrabold text-xs shadow-sm flex-none">
            {learningLang.slice(0, 2)}
          </div>
          <div className="min-w-0">
            <h1 className="text-xs font-bold leading-none tracking-tight flex items-center gap-1 max-w-[92px]">
              <span className="truncate">{activeDeckName}</span>
              <svg className="w-3 h-3 text-slate-400 flex-none" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2.5" d="M19 9l-7 7-7-7" />
              </svg>
            </h1>
            <span className="text-[10px] text-slate-400 font-medium block truncate max-w-[92px]">
              {voiceLabel}
            </span>
          </div>
        </button>

        <div className="flex items-center gap-1">
          <select
            value={mode}
            onChange={(e) => onModeChange(e.target.value as StudyMode)}
            className="text-[11px] bg-slate-100 dark:bg-slate-800 border border-slate-300 dark:border-slate-700 rounded-lg px-1 py-1 font-semibold focus:outline-none"
          >
            <option value="learning-orig">
              {learningLang}→{origLang}
            </option>
            <option value="orig-learning">
              {origLang}→{learningLang}
            </option>
            <option value="mixed">{t.mixedMode}</option>
          </select>

          <button
            type="button"
            onClick={() => setLocale(locale === 'ru' ? 'en' : 'ru')}
            className="px-1.5 py-1.5 bg-slate-100 dark:bg-slate-800 hover:bg-slate-200 dark:hover:bg-slate-700 rounded-lg text-[10px] font-black text-slate-600 dark:text-slate-300 transition"
            title={t.interfaceLang}
          >
            {locale.toUpperCase()}
          </button>

          <button
            type="button"
            onClick={onOpenAddCard}
            className="p-1.5 bg-blue-600 hover:bg-blue-700 text-white rounded-lg transition shadow-sm"
            title={t.addCardTitle}
            aria-label={t.addCardTitle}
          >
            <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2.5" d="M12 4v16m8-8H4" />
            </svg>
          </button>

          <button
            type="button"
            onClick={onOpenAuth}
            className="relative flex items-center gap-1 px-1.5 py-1.5 bg-slate-100 dark:bg-slate-800 hover:bg-slate-200 dark:hover:bg-slate-700 rounded-lg transition text-[11px] font-semibold text-slate-700 dark:text-slate-200"
            title={t.profileTitle}
          >
            <span className={`w-2 h-2 rounded-full ${dotClass}`} />
            <span className="max-w-[52px] truncate">{authLabel}</span>
          </button>

          <button
            type="button"
            onClick={onOpenSettings}
            className="p-1.5 bg-slate-100 dark:bg-slate-800 hover:bg-slate-200 dark:hover:bg-slate-700 rounded-lg transition"
            title={t.settingsTitle}
            aria-label={t.settingsTitle}
          >
            <svg className="w-4 h-4 text-slate-600 dark:text-slate-300" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M10.325 4.317c.426-1.756 2.924-1.756 3.35 0a1.724 1.724 0 002.573 1.066c1.543-.94 3.31.826 2.37 2.37a1.724 1.724 0 001.065 2.572c1.756.426 1.756 2.924 0 3.35a1.724 1.724 0 00-1.066 2.573c.94 1.543-.826 3.31-2.37 2.37a1.724 1.724 0 00-2.572 1.065c-.426 1.756-2.924 1.756-3.35 0a1.724 1.724 0 00-2.573-1.066c-1.543.94-3.31-.826-2.37-2.37a1.724 1.724 0 00-1.065-2.572c-1.756-.426-1.756-2.924 0-3.35a1.724 1.724 0 001.066-2.573c-.94-1.543.826-3.31 2.37-2.37.996.608 2.296.07 2.572-1.065z" />
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
            </svg>
          </button>

          <button
            type="button"
            onClick={onToggleTheme}
            className="p-1.5 bg-slate-100 dark:bg-slate-800 rounded-lg text-slate-600 dark:text-slate-300"
            title={t.themeTitle}
            aria-label={t.themeTitle}
          >
            {isDark ? (
              <svg className="w-4 h-4" fill="currentColor" viewBox="0 0 20 20">
                <path fillRule="evenodd" d="M10 2a1 1 0 011 1v1a1 1 0 11-2 0V3a1 1 0 011-1zm4 8a4 4 0 11-8 0 4 4 0 018 0zm-.464 4.95l.707.707a1 1 0 001.414-1.414l-.707-.707a1 1 0 00-1.414 1.414zm2.12-10.607a1 1 0 010 1.414l-.706.707a1 1 0 11-1.414-1.414l.707-.707a1 1 0 011.414 0zM17 11a1 1 0 100-2h-1a1 1 0 100 2h1zm-7 4a1 1 0 011 1v1a1 1 0 11-2 0v-1a1 1 0 011-1zM5.05 6.464A1 1 0 106.465 5.05l-.708-.707a1 1 0 00-1.414 1.414l.707.707zm1.414 8.486l-.707.707a1 1 0 01-1.414-1.414l.707-.707a1 1 0 011.414 1.414zM4 11a1 1 0 100-2H3a1 1 0 000 2h1z" clipRule="evenodd" />
              </svg>
            ) : (
              <svg className="w-4 h-4" fill="currentColor" viewBox="0 0 20 20">
                <path d="M17.293 13.293A8 8 0 016.707 2.707a8.001 8.001 0 1010.586 10.586z" />
              </svg>
            )}
          </button>
        </div>
      </div>
    </header>
  );
}
