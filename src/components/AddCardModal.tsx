import { useState, type FormEvent } from 'react';

interface AddCardModalProps {
  isOpen: boolean;
  onClose: () => void;
  onAddCard: (data: {
    german: string;
    russian: string;
    example_de: string;
    example_ru: string;
    context: string;
    tags: string;
    studyNow: boolean;
  }) => void;
}

export function AddCardModal({ isOpen, onClose, onAddCard }: AddCardModalProps) {
  const [german, setGerman] = useState('');
  const [russian, setRussian] = useState('');
  const [exampleDe, setExampleDe] = useState('');
  const [exampleRu, setExampleRu] = useState('');
  const [context, setContext] = useState('');
  const [tags, setTags] = useState('custom');
  const [studyNow, setStudyNow] = useState(true);

  if (!isOpen) return null;

  const handleSubmit = (e: FormEvent) => {
    e.preventDefault();
    if (!german.trim() || !russian.trim()) return;
    onAddCard({
      german: german.trim(),
      russian: russian.trim(),
      example_de: exampleDe.trim(),
      example_ru: exampleRu.trim(),
      context: context.trim(),
      tags: tags.trim() || 'custom',
      studyNow,
    });
    setGerman('');
    setRussian('');
    setExampleDe('');
    setExampleRu('');
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
      <div className="bg-white dark:bg-slate-900 border border-slate-200 dark:border-slate-800 w-full max-w-md rounded-t-3xl sm:rounded-3xl p-4 sm:p-6 shadow-2xl flex flex-col max-h-[90dvh] overflow-hidden">
        <div className="flex items-center justify-between pb-3 border-b border-slate-200 dark:border-slate-800">
          <h3 id="addCardModalTitle" className="text-sm font-bold">
            Новая карточка
          </h3>
          <button type="button" onClick={onClose} className="text-slate-400 p-1" aria-label="Закрыть">
            <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M6 18L18 6M6 6l12 12" />
            </svg>
          </button>
        </div>

        <form onSubmit={handleSubmit} className="flex-1 overflow-y-auto py-3 space-y-3 text-xs">
          <div>
            <label className="block text-[11px] font-semibold text-slate-600 dark:text-slate-300 mb-1">
              Немецкое слово / фраза *
            </label>
            <input
              type="text"
              required
              autoFocus
              value={german}
              onChange={(e) => setGerman(e.target.value)}
              placeholder="например: die Erfahrung, -en"
              className="w-full p-2.5 bg-slate-50 dark:bg-slate-950 border border-slate-300 dark:border-slate-700 rounded-xl text-xs focus:outline-none focus:border-blue-500"
            />
          </div>
          <div>
            <label className="block text-[11px] font-semibold text-slate-600 dark:text-slate-300 mb-1">
              Перевод на русский *
            </label>
            <input
              type="text"
              required
              value={russian}
              onChange={(e) => setRussian(e.target.value)}
              placeholder="например: опыт"
              className="w-full p-2.5 bg-slate-50 dark:bg-slate-950 border border-slate-300 dark:border-slate-700 rounded-xl text-xs focus:outline-none focus:border-blue-500"
            />
          </div>
          <div>
            <label className="block text-[11px] font-semibold text-slate-600 dark:text-slate-300 mb-1">
              Пример на немецком
            </label>
            <textarea
              rows={2}
              value={exampleDe}
              onChange={(e) => setExampleDe(e.target.value)}
              placeholder="Ich habe gute Erfahrungen damit gemacht."
              className="w-full p-2.5 bg-slate-50 dark:bg-slate-950 border border-slate-300 dark:border-slate-700 rounded-xl text-xs focus:outline-none focus:border-blue-500"
            />
          </div>
          <div>
            <label className="block text-[11px] font-semibold text-slate-600 dark:text-slate-300 mb-1">
              Перевод примера
            </label>
            <textarea
              rows={2}
              value={exampleRu}
              onChange={(e) => setExampleRu(e.target.value)}
              placeholder="У меня был хороший опыт с этим."
              className="w-full p-2.5 bg-slate-50 dark:bg-slate-950 border border-slate-300 dark:border-slate-700 rounded-xl text-xs focus:outline-none focus:border-blue-500"
            />
          </div>
          <div className="grid grid-cols-2 gap-2">
            <div>
              <label className="block text-[11px] font-semibold text-slate-600 dark:text-slate-300 mb-1">
                Грамматика / контекст
              </label>
              <input
                type="text"
                value={context}
                onChange={(e) => setContext(e.target.value)}
                placeholder="Nomen, f. / Verb (+ Dat.)"
                className="w-full p-2 bg-slate-50 dark:bg-slate-950 border border-slate-300 dark:border-slate-700 rounded-xl text-xs focus:outline-none focus:border-blue-500"
              />
            </div>
            <div>
              <label className="block text-[11px] font-semibold text-slate-600 dark:text-slate-300 mb-1">
                Теги
              </label>
              <input
                type="text"
                value={tags}
                onChange={(e) => setTags(e.target.value)}
                placeholder="custom b2 work"
                className="w-full p-2 bg-slate-50 dark:bg-slate-950 border border-slate-300 dark:border-slate-700 rounded-xl text-xs focus:outline-none focus:border-blue-500"
              />
            </div>
          </div>
          <label className="flex items-center gap-2 text-[11px] text-slate-600 dark:text-slate-300 cursor-pointer pt-1">
            <input
              type="checkbox"
              checked={studyNow}
              onChange={(e) => setStudyNow(e.target.checked)}
              className="rounded text-blue-600"
            />
            <span>Сразу показать эту карточку для изучения</span>
          </label>
          <button
            type="submit"
            className="w-full py-3 bg-blue-600 hover:bg-blue-700 text-white font-bold rounded-xl text-xs transition shadow-md"
          >
            Сохранить карточку
          </button>
        </form>
      </div>
    </div>
  );
}
