import { createContext, useContext, useEffect, useState, type ReactNode } from 'react';
import { translations, type Locale, type TranslationDict } from './i18n';

interface I18nContextValue {
  locale: Locale;
  setLocale: (next: Locale) => void;
  t: TranslationDict;
}

const I18nContext = createContext<I18nContextValue | null>(null);

export function I18nProvider({ children }: { children: ReactNode }) {
  const [locale, setLocaleState] = useState<Locale>(() => {
    const saved = localStorage.getItem('anki_ui_lang');
    return saved === 'en' ? 'en' : 'ru';
  });

  useEffect(() => {
    localStorage.setItem('anki_ui_lang', locale);
    document.documentElement.lang = locale;
  }, [locale]);

  const setLocale = (next: Locale) => setLocaleState(next);

  return (
    <I18nContext.Provider value={{ locale, setLocale, t: translations[locale] }}>
      {children}
    </I18nContext.Provider>
  );
}

export function useI18n(): I18nContextValue {
  const ctx = useContext(I18nContext);
  if (!ctx) throw new Error('useI18n must be used within I18nProvider');
  return ctx;
}
