import { useState, type FormEvent } from 'react';
import type { SyncState } from '../types';
import { supabase } from '../lib/supabase';

interface AuthModalProps {
  isOpen: boolean;
  onClose: () => void;
  userEmail: string | null;
  totalCards: number;
  customCards: number;
  dailyReviewedCount: number;
  dailyLimit: number;
  syncState: SyncState;
  onSyncNow: () => Promise<void>;
  onSignOut: () => Promise<void>;
  onToast: (msg: string) => void;
}

export function AuthModal({
  isOpen,
  onClose,
  userEmail,
  totalCards,
  customCards,
  dailyReviewedCount,
  dailyLimit,
  syncState,
  onSyncNow,
  onSignOut,
  onToast,
}: AuthModalProps) {
  const [authMode, setAuthMode] = useState<'signin' | 'signup'>('signin');
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [loading, setLoading] = useState(false);
  const [errorMsg, setErrorMsg] = useState('');
  const [infoMsg, setInfoMsg] = useState('');

  if (!isOpen) return null;

  const handleSubmit = async (e: FormEvent) => {
    e.preventDefault();
    setErrorMsg('');
    setInfoMsg('');
    setLoading(true);

    try {
      if (authMode === 'signin') {
        const { error } = await supabase.auth.signInWithPassword({ email: email.trim(), password });
        if (error) throw error;
        setEmail('');
        setPassword('');
        onClose();
        onToast('Вход выполнен!');
      } else {
        const { data, error } = await supabase.auth.signUp({ email: email.trim(), password });
        if (error) throw error;
        if (data.session) {
          setEmail('');
          setPassword('');
          onClose();
          onToast('Аккаунт создан и подключён!');
        } else {
          setInfoMsg('Аккаунт создан! Проверьте почту для подтверждения email, затем войдите.');
        }
      }
    } catch (err) {
      setErrorMsg(err instanceof Error ? err.message : 'Ошибка авторизации');
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
      <div className="bg-white dark:bg-slate-900 border border-slate-200 dark:border-slate-800 w-full max-w-md rounded-t-3xl sm:rounded-3xl p-4 sm:p-6 shadow-2xl flex flex-col max-h-[90dvh] overflow-hidden">
        <div className="flex items-center justify-between pb-3 border-b border-slate-200 dark:border-slate-800">
          <div>
            <h3 id="authModalTitle" className="text-sm font-bold">
              Профиль и облако (Supabase)
            </h3>
            <p className="text-[10px] text-slate-400">{syncState.message}</p>
          </div>
          <button type="button" onClick={onClose} className="text-slate-400 p-1" aria-label="Закрыть">
            <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M6 18L18 6M6 6l12 12" />
            </svg>
          </button>
        </div>

        <div className="flex-1 overflow-y-auto py-3 space-y-3 text-xs">
          {userEmail ? (
            <div className="space-y-3">
              <div className="bg-emerald-50 dark:bg-emerald-950/40 border border-emerald-200 dark:border-emerald-800/60 rounded-2xl p-3.5">
                <div className="text-[10px] uppercase tracking-wider font-bold text-emerald-700 dark:text-emerald-300 mb-0.5">
                  Вы вошли как
                </div>
                <div className="text-sm font-bold text-slate-900 dark:text-white break-all">
                  {userEmail}
                </div>
                <div className="text-[11px] text-slate-500 dark:text-slate-400 mt-1">
                  Карточек: {totalCards} (своих: {customCards}) • Сегодня: {dailyReviewedCount}/{dailyLimit}
                </div>
              </div>
              <div className="flex gap-2">
                <button
                  type="button"
                  onClick={onSyncNow}
                  className="flex-1 py-2.5 bg-blue-600 hover:bg-blue-700 text-white rounded-xl font-bold transition"
                >
                  Синхронизировать
                </button>
                <button
                  type="button"
                  onClick={onSignOut}
                  className="px-4 py-2.5 bg-rose-100 dark:bg-rose-950 text-rose-700 dark:text-rose-200 rounded-xl font-bold transition"
                >
                  Выйти
                </button>
              </div>
            </div>
          ) : (
            <div className="space-y-3">
              <div className="grid grid-cols-2 gap-1 bg-slate-100 dark:bg-slate-800 p-1 rounded-xl">
                <button
                  type="button"
                  onClick={() => {
                    setAuthMode('signin');
                    setErrorMsg('');
                    setInfoMsg('');
                  }}
                  className={`py-1.5 rounded-lg font-bold transition ${
                    authMode === 'signin'
                      ? 'bg-white dark:bg-slate-900 text-slate-900 dark:text-white shadow-sm'
                      : 'text-slate-500 dark:text-slate-400'
                  }`}
                >
                  Вход
                </button>
                <button
                  type="button"
                  onClick={() => {
                    setAuthMode('signup');
                    setErrorMsg('');
                    setInfoMsg('');
                  }}
                  className={`py-1.5 rounded-lg font-bold transition ${
                    authMode === 'signup'
                      ? 'bg-white dark:bg-slate-900 text-slate-900 dark:text-white shadow-sm'
                      : 'text-slate-500 dark:text-slate-400'
                  }`}
                >
                  Регистрация
                </button>
              </div>

              <form onSubmit={handleSubmit} className="space-y-2.5">
                <div>
                  <label className="block text-[11px] font-semibold text-slate-600 dark:text-slate-300 mb-1">
                    Email
                  </label>
                  <input
                    type="email"
                    required
                    autoComplete="email"
                    value={email}
                    onChange={(e) => setEmail(e.target.value)}
                    placeholder="you@example.com"
                    className="w-full p-2.5 bg-slate-50 dark:bg-slate-950 border border-slate-300 dark:border-slate-700 rounded-xl text-xs focus:outline-none focus:border-blue-500"
                  />
                </div>
                <div>
                  <label className="block text-[11px] font-semibold text-slate-600 dark:text-slate-300 mb-1">
                    Пароль (минимум 6 символов)
                  </label>
                  <input
                    type="password"
                    required
                    minLength={6}
                    autoComplete={authMode === 'signin' ? 'current-password' : 'new-password'}
                    value={password}
                    onChange={(e) => setPassword(e.target.value)}
                    placeholder="••••••"
                    className="w-full p-2.5 bg-slate-50 dark:bg-slate-950 border border-slate-300 dark:border-slate-700 rounded-xl text-xs focus:outline-none focus:border-blue-500"
                  />
                </div>
                {errorMsg && (
                  <div className="text-[11px] text-rose-600 dark:text-rose-400 font-medium bg-rose-50 dark:bg-rose-950/50 p-2 rounded-lg">
                    {errorMsg}
                  </div>
                )}
                {infoMsg && (
                  <div className="text-[11px] text-emerald-700 dark:text-emerald-300 font-medium bg-emerald-50 dark:bg-emerald-950/50 p-2 rounded-lg">
                    {infoMsg}
                  </div>
                )}
                <button
                  type="submit"
                  disabled={loading}
                  className={`w-full py-2.5 bg-blue-600 hover:bg-blue-700 text-white font-bold rounded-xl transition ${
                    loading ? 'opacity-60' : ''
                  }`}
                >
                  {authMode === 'signin' ? 'Войти' : 'Создать аккаунт'}
                </button>
              </form>
            </div>
          )}
        </div>
      </div>
    </div>
  );
}
