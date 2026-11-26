import { useState, type FormEvent } from 'react';
import type { Deck, SyncState } from '../types';
import type { CatalogLang, CefrLevel } from '../data/starterDecks';
import { supabase } from '../lib/supabase';
import { useI18n } from '../lib/I18nContext';
import { StarterDecksCatalog } from './StarterDecksCatalog';

interface AuthModalProps {
  isOpen: boolean;
  onClose: () => void;
  userEmail: string | null;
  isPasswordRecovery: boolean;
  onClearPasswordRecovery: () => void;
  decks: Deck[];
  totalCards: number;
  customCards: number;
  dailyReviewedCount: number;
  dailyLimit: number;
  syncState: SyncState;
  onSyncNow: () => Promise<void>;
  onSignOut: () => Promise<void>;
  onAddStarterDeck: (
    level: CefrLevel,
    origLang: CatalogLang,
    learningLang: CatalogLang
  ) => Promise<void>;
  onToast: (msg: string) => void;
}

export function AuthModal({
  isOpen,
  onClose,
  userEmail,
  isPasswordRecovery,
  onClearPasswordRecovery,
  decks,
  totalCards,
  customCards,
  dailyReviewedCount,
  dailyLimit,
  syncState,
  onSyncNow,
  onSignOut,
  onAddStarterDeck,
  onToast,
}: AuthModalProps) {
  const { t } = useI18n();
  const [authMode, setAuthMode] = useState<'signin' | 'signup' | 'forgot'>('signin');
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [confirmPassword, setConfirmPassword] = useState('');
  const [loading, setLoading] = useState(false);
  const [oauthLoading, setOauthLoading] = useState(false);
  const [errorMsg, setErrorMsg] = useState('');
  const [infoMsg, setInfoMsg] = useState('');

  if (!isOpen) return null;

  const getRedirectUrl = () => `${window.location.origin}${window.location.pathname}`;

  const handleGoogleOAuth = async () => {
    setErrorMsg('');
    setInfoMsg('');
    setOauthLoading(true);
    try {
      const { error } = await supabase.auth.signInWithOAuth({
        provider: 'google',
        options: {
          redirectTo: getRedirectUrl(),
        },
      });
      if (error) throw error;
    } catch (err) {
      setErrorMsg(err instanceof Error ? err.message : t.authErrorDefault);
      setOauthLoading(false);
    }
  };

  const handlePasswordUpdate = async (e: FormEvent) => {
    e.preventDefault();
    setErrorMsg('');
    setInfoMsg('');
    if (password !== confirmPassword) {
      setErrorMsg(t.passwordsMismatch);
      return;
    }
    setLoading(true);
    try {
      const { error } = await supabase.auth.updateUser({ password });
      if (error) throw error;
      setPassword('');
      setConfirmPassword('');
      onClearPasswordRecovery();
      if (window.location.hash.includes('type=recovery')) {
        window.history.replaceState(null, '', window.location.pathname + window.location.search);
      }
      onClose();
      onToast(t.toastPasswordUpdated);
    } catch (err) {
      setErrorMsg(err instanceof Error ? err.message : t.authErrorDefault);
    } finally {
      setLoading(false);
    }
  };

  const handleSubmit = async (e: FormEvent) => {
    e.preventDefault();
    setErrorMsg('');
    setInfoMsg('');
    setLoading(true);

    try {
      if (authMode === 'forgot') {
        const { error } = await supabase.auth.resetPasswordForEmail(email.trim(), {
          redirectTo: getRedirectUrl(),
        });
        if (error) throw error;
        setInfoMsg(t.resetPasswordSent);
      } else if (authMode === 'signin') {
        const { error } = await supabase.auth.signInWithPassword({ email: email.trim(), password });
        if (error) throw error;
        setEmail('');
        setPassword('');
        onClose();
        onToast(t.toastSignedIn);
      } else {
        const { data, error } = await supabase.auth.signUp({
          email: email.trim(),
          password,
          options: { emailRedirectTo: getRedirectUrl() },
        });
        if (error) throw error;
        if (data.session) {
          setEmail('');
          setPassword('');
          onClose();
          onToast(t.toastAccountCreated);
        } else {
          setInfoMsg(t.accountCreatedConfirm);
        }
      }
    } catch (err) {
      setErrorMsg(err instanceof Error ? err.message : t.authErrorDefault);
    } finally {
      setLoading(false);
    }
  };

  return (
    <div
      role="dialog"
      aria-modal="true"
      aria-labelledby="authModalTitle"
      onClick={(e) => e.target === e.currentTarget && onClose()}
      className="fixed inset-0 bg-slate-900/60 backdrop-blur-sm z-50 flex items-end sm:items-center justify-center p-0 sm:p-4"
    >
      <div className="bg-white dark:bg-slate-900 border border-slate-200 dark:border-slate-800 w-full max-w-lg rounded-t-3xl sm:rounded-3xl p-5 sm:p-6 shadow-2xl flex flex-col max-h-[90dvh] overflow-hidden">
        <div className="flex items-center justify-between pb-3 border-b border-slate-200 dark:border-slate-800">
          <div>
            <h3 id="authModalTitle" className="text-base font-bold">
              {t.authHeader}
            </h3>
            <p className="text-xs text-slate-500 dark:text-slate-400">{syncState.message}</p>
          </div>
          <button type="button" onClick={onClose} className="text-slate-400 hover:text-slate-600 dark:hover:text-slate-200 p-1" aria-label={t.close}>
            <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M6 18L18 6M6 6l12 12" />
            </svg>
          </button>
        </div>

        <div className="flex-1 overflow-y-auto py-3.5 space-y-3.5 text-sm">
          {isPasswordRecovery ? (
            <form onSubmit={handlePasswordUpdate} className="space-y-3">
              <div className="font-bold text-slate-900 dark:text-white text-base">
                {t.newPasswordTitle}
              </div>
              <div>
                <label className="block text-xs font-semibold text-slate-600 dark:text-slate-300 mb-1">
                  {t.newPasswordLabel}
                </label>
                <input
                  type="password"
                  required
                  minLength={6}
                  autoComplete="new-password"
                  value={password}
                  onChange={(e) => setPassword(e.target.value)}
                  placeholder="••••••"
                  className="w-full p-2.5 bg-slate-50 dark:bg-slate-950 border border-slate-300 dark:border-slate-700 rounded-xl text-sm focus:outline-none focus:border-blue-500"
                />
              </div>
              <div>
                <label className="block text-xs font-semibold text-slate-600 dark:text-slate-300 mb-1">
                  {t.confirmPasswordLabel}
                </label>
                <input
                  type="password"
                  required
                  minLength={6}
                  autoComplete="new-password"
                  value={confirmPassword}
                  onChange={(e) => setConfirmPassword(e.target.value)}
                  placeholder="••••••"
                  className="w-full p-2.5 bg-slate-50 dark:bg-slate-950 border border-slate-300 dark:border-slate-700 rounded-xl text-sm focus:outline-none focus:border-blue-500"
                />
              </div>
              {errorMsg && (
                <div className="text-xs text-rose-600 dark:text-rose-400 font-medium bg-rose-50 dark:bg-rose-950/50 p-2.5 rounded-xl">
                  {errorMsg}
                </div>
              )}
              <button
                type="submit"
                disabled={loading}
                className={`w-full py-3 bg-blue-600 hover:bg-blue-700 text-white font-bold rounded-xl text-sm transition ${
                  loading ? 'opacity-60' : ''
                }`}
              >
                {t.saveNewPasswordBtn}
              </button>
            </form>
          ) : userEmail ? (
            <div className="space-y-3">
              <div className="bg-emerald-50 dark:bg-emerald-950/40 border border-emerald-200 dark:border-emerald-800/60 rounded-2xl p-4">
                <div className="text-xs uppercase tracking-wider font-bold text-emerald-700 dark:text-emerald-300 mb-1">
                  {t.loggedInAs}
                </div>
                <div className="text-base font-bold text-slate-900 dark:text-white break-all">
                  {userEmail}
                </div>
                <div className="text-xs text-slate-500 dark:text-slate-400 mt-1.5">
                  {t.authUserStats(totalCards, customCards, dailyReviewedCount, dailyLimit)}
                </div>
              </div>
              <div className="flex gap-2">
                <button
                  type="button"
                  onClick={onSyncNow}
                  className="flex-1 py-3 bg-blue-600 hover:bg-blue-700 text-white rounded-xl font-bold text-sm transition"
                >
                  {t.syncBtn}
                </button>
                <button
                  type="button"
                  onClick={onSignOut}
                  className="px-4 py-3 bg-rose-100 dark:bg-rose-950 text-rose-700 dark:text-rose-200 rounded-xl font-bold text-sm transition"
                >
                  {t.signOutBtn}
                </button>
              </div>
            </div>
          ) : (
            <div className="space-y-3.5">
              {authMode !== 'forgot' ? (
                <div className="grid grid-cols-2 gap-1 bg-slate-100 dark:bg-slate-800 p-1 rounded-xl">
                  <button
                    type="button"
                    onClick={() => {
                      setAuthMode('signin');
                      setErrorMsg('');
                      setInfoMsg('');
                    }}
                    className={`py-2 rounded-lg text-sm font-bold transition ${
                      authMode === 'signin'
                        ? 'bg-white dark:bg-slate-900 text-slate-900 dark:text-white shadow-sm'
                        : 'text-slate-500 dark:text-slate-400'
                    }`}
                  >
                    {t.signInTab}
                  </button>
                  <button
                    type="button"
                    onClick={() => {
                      setAuthMode('signup');
                      setErrorMsg('');
                      setInfoMsg('');
                    }}
                    className={`py-2 rounded-lg text-sm font-bold transition ${
                      authMode === 'signup'
                        ? 'bg-white dark:bg-slate-900 text-slate-900 dark:text-white shadow-sm'
                        : 'text-slate-500 dark:text-slate-400'
                    }`}
                  >
                    {t.signUpTab}
                  </button>
                </div>
              ) : (
                <div className="flex items-center justify-between">
                  <span className="font-bold text-slate-900 dark:text-white text-base">
                    {t.resetPasswordTitle}
                  </span>
                  <button
                    type="button"
                    onClick={() => {
                      setAuthMode('signin');
                      setErrorMsg('');
                      setInfoMsg('');
                    }}
                    className="text-xs font-semibold text-blue-600 dark:text-blue-400 hover:underline"
                  >
                    {t.backToSignIn}
                  </button>
                </div>
              )}

              <form onSubmit={handleSubmit} className="space-y-3">
                <div>
                  <label className="block text-xs font-semibold text-slate-600 dark:text-slate-300 mb-1">
                    Email
                  </label>
                  <input
                    type="email"
                    required
                    autoComplete="email"
                    value={email}
                    onChange={(e) => setEmail(e.target.value)}
                    placeholder="you@example.com"
                    className="w-full p-2.5 bg-slate-50 dark:bg-slate-950 border border-slate-300 dark:border-slate-700 rounded-xl text-sm focus:outline-none focus:border-blue-500"
                  />
                </div>
                {authMode !== 'forgot' && (
                  <div>
                    <div className="flex items-center justify-between mb-1">
                      <label className="block text-xs font-semibold text-slate-600 dark:text-slate-300">
                        {t.passwordLabel}
                      </label>
                      {authMode === 'signin' && (
                        <button
                          type="button"
                          onClick={() => {
                            setAuthMode('forgot');
                            setErrorMsg('');
                            setInfoMsg('');
                          }}
                          className="text-xs font-semibold text-blue-600 dark:text-blue-400 hover:underline"
                        >
                          {t.forgotPasswordLink}
                        </button>
                      )}
                    </div>
                    <input
                      type="password"
                      required
                      minLength={6}
                      autoComplete={authMode === 'signin' ? 'current-password' : 'new-password'}
                      value={password}
                      onChange={(e) => setPassword(e.target.value)}
                      placeholder="••••••"
                      className="w-full p-2.5 bg-slate-50 dark:bg-slate-950 border border-slate-300 dark:border-slate-700 rounded-xl text-sm focus:outline-none focus:border-blue-500"
                    />
                  </div>
                )}
                {errorMsg && (
                  <div className="text-xs text-rose-600 dark:text-rose-400 font-medium bg-rose-50 dark:bg-rose-950/50 p-2.5 rounded-xl">
                    {errorMsg}
                  </div>
                )}
                {infoMsg && (
                  <div className="text-xs text-emerald-700 dark:text-emerald-300 font-medium bg-emerald-50 dark:bg-emerald-950/50 p-2.5 rounded-xl">
                    {infoMsg}
                  </div>
                )}
                <button
                  type="submit"
                  disabled={loading}
                  className={`w-full py-3 bg-blue-600 hover:bg-blue-700 text-white font-bold rounded-xl text-sm transition ${
                    loading ? 'opacity-60' : ''
                  }`}
                >
                  {authMode === 'forgot'
                    ? t.resetPasswordSubmit
                    : authMode === 'signin'
                      ? t.signInSubmit
                      : t.signUpSubmit}
                </button>
              </form>

              {authMode !== 'forgot' && (
                <>
                  <div className="flex items-center gap-2 text-xs text-slate-400">
                    <div className="flex-1 h-px bg-slate-200 dark:bg-slate-800" />
                    <span>{t.orDivider}</span>
                    <div className="flex-1 h-px bg-slate-200 dark:bg-slate-800" />
                  </div>

                  <button
                    type="button"
                    disabled={oauthLoading}
                    onClick={handleGoogleOAuth}
                    className={`w-full py-3 px-3 bg-white dark:bg-slate-800 hover:bg-slate-50 dark:hover:bg-slate-700 border border-slate-300 dark:border-slate-700 text-slate-800 dark:text-slate-100 font-bold rounded-xl text-sm transition flex items-center justify-center gap-2 ${
                      oauthLoading ? 'opacity-60' : ''
                    }`}
                  >
                    <svg className="w-4 h-4" viewBox="0 0 24 24" aria-hidden="true">
                      <path
                        fill="#4285F4"
                        d="M23.49 12.27c0-.79-.07-1.54-.2-2.27H12v4.51h6.47a5.53 5.53 0 0 1-2.4 3.63v3.01h3.88c2.27-2.09 3.54-5.17 3.54-8.88Z"
                      />
                      <path
                        fill="#34A853"
                        d="M12 24c3.24 0 5.95-1.07 7.94-2.91l-3.88-3.01c-1.08.72-2.45 1.15-4.06 1.15-3.12 0-5.77-2.11-6.72-4.95H1.29v3.11A12 12 0 0 0 12 24Z"
                      />
                      <path
                        fill="#FBBC05"
                        d="M5.28 14.28A7.2 7.2 0 0 1 4.9 12c0-.79.14-1.56.38-2.28V6.61H1.29A12 12 0 0 0 0 12c0 1.94.46 3.77 1.29 5.39l3.99-3.11Z"
                      />
                      <path
                        fill="#EA4335"
                        d="M12 4.77c1.76 0 3.34.61 4.58 1.8l3.44-3.44C17.95 1.19 15.24 0 12 0A12 12 0 0 0 1.29 6.61l3.99 3.11C6.23 6.88 8.88 4.77 12 4.77Z"
                      />
                    </svg>
                    <span>{t.continueWithGoogle}</span>
                  </button>
                </>
              )}
            </div>
          )}

          {/* Starter Decks Catalog */}
          <StarterDecksCatalog decks={decks} onAddStarterDeck={onAddStarterDeck} />
        </div>
      </div>
    </div>
  );
}
