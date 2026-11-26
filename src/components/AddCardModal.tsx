import { useEffect, useState, type FormEvent } from 'react';
import type { Deck } from '../types';
import { useI18n } from '../lib/I18nContext';

interface AddCardModalProps {
  isOpen: boolean;
  decks: Deck[];
  defaultDeckKey: string;
  onClose: () => void;
  onAddCard: (data: {
    deckKey: string;
    learning: string;
    orig: string;
    example_learning: string;
    example_orig: string;
    context: string;
    tags: string;
    studyNow: boolean;
  }) => void;
}

export function AddCardModal({
  isOpen,
  decks,
  defaultDeckKey,
  onClose,
  onAddCard,
}: AddCardModalProps) {
  const { t } = useI18n();
  const [deckKey, setDeckKey] = useState(defaultDeckKey);
  const [learning, setLearning] = useState('');
  const [orig, setOrig] = useState('');
  const [exampleLearning, setExampleLearning] = useState('');
  const [exampleOrig, setExampleOrig] = useState('');
  const [context, setContext] = useState('');
  const [tags, setTags] = useState('custom');
  const [studyNow, setStudyNow] = useState(true);

  useEffect(() => {
    if (isOpen) setDeckKey(defaultDeckKey);
  }, [isOpen, defaultDeckKey]);

  if (!isOpen) return null;

  const selectedDeck = decks.find((d) => d.deckKey === deckKey) || decks[0];
  const origLang = selectedDeck?.origLang || 'RU';
  const learningLang = selectedDeck?.learningLang || 'DE';

  const handleSubmit = (e: FormEvent) => {
    e.preventDefault();
    if (!learning.trim() || !orig.trim()) return;
    onAddCard({
      deckKey,
      learning: learning.trim(),
      orig: orig.trim(),
      example_learning: exampleLearning.trim(),
      example_orig: exampleOrig.trim(),
      context: context.trim(),
      tags: tags.trim() || 'custom',
      studyNow,
    });
    setLearning('');
    setOrig('');
    setExampleLearning('');
    setExampleOrig('');
    setContext('');
    setTags('custom');
    setStudyNow(true);
    onClose();
  };

  return (
    <div
      role="dialog"
      aria-modal="true"
      aria-labelledby="addCardModalTitle"
      onClick={(e) => e.target === e.currentTarget && onClose()}
      className="fixed inset-0 bg-slate-900/60 backdrop-blur-sm z-50 flex items-end sm:items-center justify-center p-0 sm:p-4"
    >
      <div className="bg-white dark:bg-slate-900 border border-slate-200 dark:border-slate-800 w-full max-w-lg rounded-t-3xl sm:rounded-3xl p-5 sm:p-6 shadow-2xl flex flex-col max-h-[90dvh] overflow-hidden">
        <div className="flex items-center justify-between pb-3 border-b border-slate-200 dark:border-slate-800">
          <h3 id="addCardModalTitle" className="text-base font-bold">
            {t.newCardTitle}
          </h3>
          <button type="button" onClick={onClose} className="text-slate-400 hover:text-slate-600 dark:hover:text-slate-200 p-1" aria-label={t.close}>
            <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M6 18L18 6M6 6l12 12" />
            </svg>
          </button>
        </div>

        <form onSubmit={handleSubmit} className="flex-1 overflow-y-auto py-3.5 space-y-3.5 text-sm">
          <div>
            <label className="block text-xs font-semibold text-slate-600 dark:text-slate-300 mb-1">
              {t.deckFieldLabel}
            </label>
            <select
              value={deckKey}
              onChange={(e) => setDeckKey(e.target.value)}
              className="w-full p-2.5 bg-slate-50 dark:bg-slate-950 border border-slate-300 dark:border-slate-700 rounded-xl text-sm font-semibold focus:outline-none focus:border-blue-500"
            >
              {decks.map((d) => (
                <option key={d.deckKey} value={d.deckKey}>
                  {d.name}
                </option>
              ))}
            </select>
          </div>
          <div>
            <label className="block text-xs font-semibold text-slate-600 dark:text-slate-300 mb-1">
              {t.learningFieldLabel(learningLang)}
            </label>
            <input
              type="text"
              required
              autoFocus
              value={learning}
              onChange={(e) => setLearning(e.target.value)}
              placeholder={t.learningFieldPlaceholder}
              className="w-full p-2.5 bg-slate-50 dark:bg-slate-950 border border-slate-300 dark:border-slate-700 rounded-xl text-sm focus:outline-none focus:border-blue-500"
            />
          </div>
          <div>
            <label className="block text-xs font-semibold text-slate-600 dark:text-slate-300 mb-1">
              {t.origFieldLabel(origLang)}
            </label>
            <input
              type="text"
              required
              value={orig}
              onChange={(e) => setOrig(e.target.value)}
              placeholder={t.origFieldPlaceholder}
              className="w-full p-2.5 bg-slate-50 dark:bg-slate-950 border border-slate-300 dark:border-slate-700 rounded-xl text-sm focus:outline-none focus:border-blue-500"
            />
          </div>
          <div>
            <label className="block text-xs font-semibold text-slate-600 dark:text-slate-300 mb-1">
              {t.exampleLearningLabel(learningLang)}
            </label>
            <textarea
              rows={2}
              value={exampleLearning}
              onChange={(e) => setExampleLearning(e.target.value)}
              placeholder="Ich habe gute Erfahrungen damit gemacht."
              className="w-full p-2.5 bg-slate-50 dark:bg-slate-950 border border-slate-300 dark:border-slate-700 rounded-xl text-sm focus:outline-none focus:border-blue-500"
            />
          </div>
          <div>
            <label className="block text-xs font-semibold text-slate-600 dark:text-slate-300 mb-1">
              {t.exampleOrigLabel(origLang)}
            </label>
            <textarea
              rows={2}
              value={exampleOrig}
              onChange={(e) => setExampleOrig(e.target.value)}
              placeholder="..."
              className="w-full p-2.5 bg-slate-50 dark:bg-slate-950 border border-slate-300 dark:border-slate-700 rounded-xl text-sm focus:outline-none focus:border-blue-500"
            />
          </div>
          <div className="grid grid-cols-2 gap-2.5">
            <div>
              <label className="block text-xs font-semibold text-slate-600 dark:text-slate-300 mb-1">
                {t.contextFieldLabel}
              </label>
              <input
                type="text"
                value={context}
                onChange={(e) => setContext(e.target.value)}
                placeholder="Nomen, f. / Verb (+ Dat.)"
                className="w-full p-2.5 bg-slate-50 dark:bg-slate-950 border border-slate-300 dark:border-slate-700 rounded-xl text-sm focus:outline-none focus:border-blue-500"
              />
            </div>
            <div>
              <label className="block text-xs font-semibold text-slate-600 dark:text-slate-300 mb-1">
                {t.tagsFieldLabel}
              </label>
              <input
                type="text"
                value={tags}
                onChange={(e) => setTags(e.target.value)}
                placeholder="custom b2 work"
                className="w-full p-2.5 bg-slate-50 dark:bg-slate-950 border border-slate-300 dark:border-slate-700 rounded-xl text-sm focus:outline-none focus:border-blue-500"
              />
            </div>
          </div>
          <label className="flex items-center gap-2 text-xs text-slate-600 dark:text-slate-300 cursor-pointer pt-1">
            <input
              type="checkbox"
              checked={studyNow}
              onChange={(e) => setStudyNow(e.target.checked)}
              className="rounded text-blue-600"
            />
            <span>{t.studyNowLabel}</span>
          </label>
          <button
            type="submit"
            className="w-full py-3.5 bg-gradient-to-r from-blue-600 to-indigo-600 hover:from-blue-700 hover:to-indigo-700 text-white font-bold rounded-2xl text-sm transition shadow-md shadow-blue-600/20"
          >
            {t.saveCardBtn}
          </button>
        </form>
      </div>
    </div>
  );
}
