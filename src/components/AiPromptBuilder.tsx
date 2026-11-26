import { useEffect, useMemo, useState } from 'react';
import { useI18n } from '../lib/I18nContext';

interface AiPromptBuilderProps {
  defaultOrigLang: string;
  defaultLearningLang: string;
}

const LANG_OPTIONS = [
  { code: 'RU', name: 'Russian (RU)' },
  { code: 'EN', name: 'English (EN)' },
  { code: 'DE', name: 'German (DE)' },
  { code: 'ES', name: 'Spanish (ES)' },
  { code: 'FR', name: 'French (FR)' },
  { code: 'IT', name: 'Italian (IT)' },
  { code: 'PT', name: 'Portuguese (PT)' },
  { code: 'PL', name: 'Polish (PL)' },
  { code: 'UK', name: 'Ukrainian (UK)' },
  { code: 'JA', name: 'Japanese (JA)' },
];

const LEVELS = ['A1', 'A2', 'B1', 'B1–B2', 'B2', 'C1', 'C2'];

function getLangLabel(code: string): string {
  const found = LANG_OPTIONS.find((l) => l.code === code.toUpperCase());
  return found ? found.name : code.toUpperCase();
}

export function AiPromptBuilder({
  defaultOrigLang,
  defaultLearningLang,
}: AiPromptBuilderProps) {
  const { t } = useI18n();
  const [origLang, setOrigLang] = useState(defaultOrigLang || 'RU');
  const [learningLang, setLearningLang] = useState(defaultLearningLang || 'DE');
  const [level, setLevel] = useState('B1–B2');
  const [count, setCount] = useState(20);
  const [topic, setTopic] = useState('');
  const [copied, setCopied] = useState(false);

  useEffect(() => {
    setOrigLang((defaultOrigLang || 'RU').toUpperCase());
    setLearningLang((defaultLearningLang || 'DE').toUpperCase());
  }, [defaultOrigLang, defaultLearningLang]);

  const promptText = useMemo(() => {
    const src = getLangLabel(origLang);
    const dst = getLangLabel(learningLang);
    const topicLine = topic.trim()
      ? `Topic focus: "${topic.trim()}".`
      : 'Topic focus: practical high-frequency everyday and professional vocabulary.';

    return [
      `Generate ${count} spaced-repetition flashcards for learning ${dst} from ${src} at CEFR level ${level}.`,
      topicLine,
      '',
      'Output format rules (STRICT):',
      '1. Output ONLY raw CSV lines inside a single plain text block — no intro, no explanations, no numbering.',
      '2. Use semicolon (;) as the delimiter and NEVER use semicolons inside field values.',
      '3. First line MUST be the header:',
      'Learning;Orig;Example_Learning;Example_Orig;Context;Tags',
      `4. "Learning": target word/phrase in ${dst} (include article & plural for nouns or reflexive/preposition for verbs where applicable).`,
      `5. "Orig": accurate, natural translation in ${src}.`,
      `6. "Example_Learning": natural ${level}-level example sentence in ${dst}.`,
      `7. "Example_Orig": accurate translation of the example sentence in ${src}.`,
      '8. "Context": concise grammar note (e.g. "Nomen, f.", "Verb (+ Dat.)", "Adjektiv", "Idiom").',
      `9. "Tags": 2–3 lowercase space-separated tags (include level "${level.toLowerCase().replace(/[^a-z0-9]+/g, '_')}"${topic.trim() ? ' and a short topic tag' : ''}).`,
    ].join('\n');
  }, [origLang, learningLang, level, count, topic]);

  const handleCopy = async () => {
    try {
      await navigator.clipboard.writeText(promptText);
      setCopied(true);
      window.setTimeout(() => setCopied(false), 1800);
    } catch {
      // Fallback for restricted clipboards
      const el = document.createElement('textarea');
      el.value = promptText;
      document.body.appendChild(el);
      el.select();
      document.execCommand('copy');
      document.body.removeChild(el);
      setCopied(true);
      window.setTimeout(() => setCopied(false), 1800);
    }
  };

  return (
    <details className="rounded-xl border border-indigo-200 dark:border-indigo-800/60 bg-indigo-50/60 dark:bg-indigo-950/30 p-3 text-sm">
      <summary className="font-bold text-indigo-700 dark:text-indigo-300 cursor-pointer select-none">
        {t.aiPromptToggle}
      </summary>

      <div className="mt-2.5 space-y-2.5">
        <p className="text-xs text-slate-500 dark:text-slate-400 leading-relaxed">
          {t.aiPromptDesc}
        </p>

        <div className="grid grid-cols-2 gap-2">
          <div>
            <label className="block text-xs text-slate-500 dark:text-slate-400 mb-1">
              {t.aiPromptFromLang}
            </label>
            <select
              value={LANG_OPTIONS.some((l) => l.code === origLang) ? origLang : 'RU'}
              onChange={(e) => setOrigLang(e.target.value)}
              className="w-full p-2 bg-white dark:bg-slate-900 border border-slate-300 dark:border-slate-700 rounded-xl text-xs font-semibold"
            >
              {LANG_OPTIONS.map((l) => (
                <option key={l.code} value={l.code}>
                  {l.name}
                </option>
              ))}
            </select>
          </div>
          <div>
            <label className="block text-xs text-slate-500 dark:text-slate-400 mb-1">
              {t.aiPromptToLang}
            </label>
            <select
              value={LANG_OPTIONS.some((l) => l.code === learningLang) ? learningLang : 'DE'}
              onChange={(e) => setLearningLang(e.target.value)}
              className="w-full p-2 bg-white dark:bg-slate-900 border border-slate-300 dark:border-slate-700 rounded-xl text-xs font-semibold"
            >
              {LANG_OPTIONS.map((l) => (
                <option key={l.code} value={l.code}>
                  {l.name}
                </option>
              ))}
            </select>
          </div>
        </div>

        <div className="grid grid-cols-2 gap-2">
          <div>
            <label className="block text-xs text-slate-500 dark:text-slate-400 mb-1">
              {t.aiPromptLevel}
            </label>
            <select
              value={level}
              onChange={(e) => setLevel(e.target.value)}
              className="w-full p-2 bg-white dark:bg-slate-900 border border-slate-300 dark:border-slate-700 rounded-xl text-xs font-semibold"
            >
              {LEVELS.map((lv) => (
                <option key={lv} value={lv}>
                  {lv}
                </option>
              ))}
            </select>
          </div>
          <div>
            <label className="block text-xs text-slate-500 dark:text-slate-400 mb-1">
              {t.aiPromptCount}
            </label>
            <input
              type="number"
              min={5}
              max={100}
              step={5}
              value={count}
              onChange={(e) => setCount(Math.max(5, Math.min(100, Number(e.target.value) || 20)))}
              className="w-full p-2 bg-white dark:bg-slate-900 border border-slate-300 dark:border-slate-700 rounded-xl text-xs font-semibold"
            />
          </div>
        </div>

        <div>
          <label className="block text-xs text-slate-500 dark:text-slate-400 mb-1">
            {t.aiPromptTopic}
          </label>
          <input
            type="text"
            value={topic}
            onChange={(e) => setTopic(e.target.value)}
            placeholder={t.aiPromptTopicPlaceholder}
            className="w-full p-2 bg-white dark:bg-slate-900 border border-slate-300 dark:border-slate-700 rounded-xl text-xs"
          />
        </div>

        <textarea
          readOnly
          rows={6}
          value={promptText}
          className="w-full font-mono text-xs leading-relaxed p-2.5 bg-white dark:bg-slate-950 border border-slate-300 dark:border-slate-700 rounded-xl text-slate-700 dark:text-slate-300"
        />

        <button
          type="button"
          onClick={handleCopy}
          className={`w-full py-2.5 rounded-xl text-xs font-bold transition ${
            copied
              ? 'bg-emerald-600 text-white'
              : 'bg-indigo-600 hover:bg-indigo-700 text-white'
          }`}
        >
          {copied ? t.aiPromptCopied : t.aiPromptCopy}
        </button>
      </div>
    </details>
  );
}
