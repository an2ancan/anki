import { useState } from 'react';

interface InfoTipProps {
  text: string;
}

export function InfoTip({ text }: InfoTipProps) {
  const [open, setOpen] = useState(false);

  return (
    <span className="inline-block align-middle">
      <button
        type="button"
        onClick={(e) => {
          e.stopPropagation();
          setOpen((v) => !v);
        }}
        aria-expanded={open}
        aria-label="Подсказка"
        className={`ml-1 inline-flex items-center justify-center w-4 h-4 rounded-full text-[10px] font-bold transition ${
          open
            ? 'bg-blue-600 text-white'
            : 'bg-slate-200 dark:bg-slate-700 text-slate-600 dark:text-slate-300 hover:bg-blue-100 dark:hover:bg-blue-900'
        }`}
      >
        ?
      </button>
      {open && (
        <span className="block mt-1.5 p-2 rounded-xl bg-blue-50 dark:bg-blue-950/60 border border-blue-200/70 dark:border-blue-800/60 text-[11px] font-normal leading-relaxed text-slate-700 dark:text-slate-200">
          {text}
        </span>
      )}
    </span>
  );
}
