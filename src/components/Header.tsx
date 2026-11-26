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
  isDecksOpen: boolean;
  showStudyBar: boolean;
  onToggleDecks: () => void;
  onOpenAuth: () => void;
  onOpenSettings: () => void;
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
  isDecksOpen,
  showStudyBar,
  onToggleDecks,
  onOpenAuth,
  onOpenSettings,
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
    <header className="w-full flex-none bg-white/80 dark:bg-slate-900/80 backdrop-blur-xl border-b border-slate-200/80 dark:border-slate-800/80 px-3.5 py-2.5 z-20">
      <div className="max-w-lg mx-auto space-y-2.5">
        {/* Top Row: Deck Selector + Clear Actions */}
        <div className="flex items-center justify-between gap-2">
          <button
            type="button"
            onClick={onToggleDecks}
            className={`flex items-center gap-2 min-w-0 flex-1 text-left rounded-2xl px-1.5 py-1 -ml-1.5 transition ${
              isDecksOpen
                ? 'bg-blue-50 dark:bg-blue-950/60'
                : 'hover:bg-slate-100/80 dark:hover:bg-slate-800/80'
            }`}
            title={t.decksCabinetTitle}
          >
            <div className="w-8 h-8 rounded-xl bg-gradient-to-br from-blue-600 via-indigo-600 to-violet-600 flex items-center justify-center text-white font-black text-xs shadow-sm shadow-indigo-500/25 flex-none">
              {learningLang.slice(0, 2)}
            </div>
            <h1 className="min-w-0 flex-1 text-sm font-bold leading-tight tracking-tight flex items-center gap-1 text-slate-900 dark:text-white">
              <span className="truncate">{activeDeckName}</span>
              <svg className="w-4 h-4 text-slate-400 flex-none" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2.5" d="M19 9l-7 7-7-7" />
              </svg>
            </h1>
          </button>

          <div className="flex items-center gap-1.5 flex-none">
            <button
              type="button"
              onClick={onOpenAuth}
              className="relative flex items-center gap-1.5 px-2.5 py-2 bg-slate-100/90 dark:bg-slate-800/90 hover:bg-slate-200 dark:hover:bg-slate-700 rounded-xl transition text-xs font-semibold text-slate-700 dark:text-slate-200"
              title={userEmail ? `${t.profileTitle} (${userEmail})` : t.profileTitle}
              aria-label={t.profileTitle}
            >
              <span className={`w-2 h-2 rounded-full flex-none ${dotClass}`} />
              <span className="max-w-[76px] sm:max-w-[110px] truncate">{authLabel}</span>
            </button>

            <button
              type="button"
              onClick={() => setLocale(locale === 'ru' ? 'en' : 'ru')}
              className="px-2 py-2 bg-slate-100/90 dark:bg-slate-800/90 hover:bg-slate-200 dark:hover:bg-slate-700 rounded-xl transition text-xs font-bold text-slate-700 dark:text-slate-200 uppercase"
              title={t.interfaceLang}
              aria-label={t.interfaceLang}
            >
              {locale === 'ru' ? 'RU' : 'EN'}
            </button>

            <button
              type="button"
              onClick={onOpenSettings}
              className="p-2 bg-slate-100/90 dark:bg-slate-800/90 hover:bg-slate-200 dark:hover:bg-slate-700 rounded-xl transition"
              title={t.settingsTitle}
              aria-label={t.settingsTitle}
            >
              <svg className="w-4 h-4 text-slate-600 dark:text-slate-300" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M10.325 4.317c.426-1.756 2.924-1.756 3.35 0a1.724 1.724 0 002.573 1.066c1.543-.94 3.31.826 2.37 2.37a1.724 1.724 0 001.065 2.572c1.756.426 1.756 2.924 0 3.35a1.724 1.724 0 00-1.066 2.573c.94 1.543-.826 3.31-2.37 2.37a1.724 1.724 0 00-2.572 1.065c-.426 1.756-2.924 1.756-3.35 0a1.724 1.724 0 00-2.573-1.066c-1.543.94-3.31-.826-2.37-2.37a1.724 1.724 0 00-1.065-2.572c-1.756-.426-1.756-2.924 0-3.35a1.724 1.724 0 001.066-2.573c-.94-1.543.826-3.31 2.37-2.37.996.608 2.296.07 2.572-1.065z" />
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
              </svg>
            </button>
          </div>
        </div>

        {/* Compact Study Sub-bar: Direction Segmented Control + Voice Indicator */}
        {showStudyBar && (
          <div className="flex items-center justify-between gap-2">
            <div className="inline-flex bg-slate-100/90 dark:bg-slate-800/90 p-0.5 rounded-xl text-xs font-semibold">
              {(
                [
                  ['learning-orig', `${learningLang}→${origLang}`],
                  ['orig-learning', `${origLang}→${learningLang}`],
                  ['mixed', t.mixedMode],
                ] as const
              ).map(([val, label]) => (
                <button
                  key={val}
                  type="button"
                  onClick={() => onModeChange(val)}
                  className={`px-2.5 py-1 rounded-lg transition whitespace-nowrap ${
                    mode === val
                      ? 'bg-white dark:bg-slate-900 text-slate-900 dark:text-white shadow-sm'
                      : 'text-slate-500 dark:text-slate-400 hover:text-slate-700 dark:hover:text-slate-200'
                  }`}
                >
                  {label}
                </button>
              ))}
            </div>

            <button
              type="button"
              onClick={onOpenSettings}
              className="text-xs text-slate-500 dark:text-slate-400 hover:text-blue-600 dark:hover:text-blue-400 font-medium truncate max-w-[160px] px-2 py-1 rounded-lg hover:bg-slate-100/80 dark:hover:bg-slate-800/80 transition"
              title={t.voiceSection}
            >
              🔊 {voiceLabel}
            </button>
          </div>
        )}
      </div>
    </header>
  );
}
