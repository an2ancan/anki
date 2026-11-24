import { useCallback, useEffect, useMemo, useRef, useState } from 'react';
import type { User } from '@supabase/supabase-js';
import type {
  Card,
  DailyStats,
  Direction,
  ProgressFilter,
  QueueItem,
  Rating,
  SpeechSettings,
  StudyMode,
  SyncState,
} from './types';
import {
  applyCardRating,
  buildSessionQueue,
  expandCardsToQueueItems,
  generateCustomKey,
  normalizeCard,
  reconcileActiveQueue,
} from './lib/srs';
import {
  loadLocalDailyStats,
  loadLocalDeck,
  loadSpeechSettings,
  saveLocalDailyStats,
  saveLocalDeck,
  saveSpeechSettings,
} from './lib/storage';
import { getSortedGermanVoices, speakGermanText } from './lib/speech';
import {
  deleteCardFromSupabase,
  fullSyncWithSupabase,
  supabase,
  syncCardsToSupabase,
  syncProfileToSupabase,
} from './lib/supabase';
import { getEffectiveStreak, recordReviewInStats } from './lib/stats';
import { Header } from './components/Header';
import { StatusRibbon } from './components/StatusRibbon';
import { FlashCard } from './components/FlashCard';
import { StatsView } from './components/StatsView';
import { SettingsModal } from './components/SettingsModal';
import { AddCardModal } from './components/AddCardModal';
import { AuthModal } from './components/AuthModal';
import { ProgressModal } from './components/ProgressModal';

export default function App() {
  const [user, setUser] = useState<User | null>(null);
  const [syncState, setSyncState] = useState<SyncState>({
    status: 'local',
    message: 'Режим: локально (без входа)',
  });
  const [deck, setDeck] = useState<Card[]>(() => loadLocalDeck(null));
  const [stats, setStats] = useState<DailyStats>(() => loadLocalDailyStats(null));
  const [queue, setQueue] = useState<QueueItem[]>([]);
  const [currentIndex, setCurrentIndex] = useState(0);
  const [isFlipped, setIsFlipped] = useState(false);
  const [mode, setMode] = useState<StudyMode>('mixed');
  const passedSidesRef = useRef<Map<string, Set<Direction>>>(new Map());
  const delayedItemsRef = useRef<Array<{ item: QueueItem; readyAt: number }>>([]);

  const [voices, setVoices] = useState<SpeechSynthesisVoice[]>([]);
  const [speechSettings, setSpeechSettings] = useState<SpeechSettings>(() => loadSpeechSettings());

  const [isDark, setIsDark] = useState(() => {
    const saved = localStorage.getItem('anki_theme');
    if (saved) return saved === 'dark';
    return window.matchMedia('(prefers-color-scheme: dark)').matches;
  });

  const [activeView, setActiveView] = useState<'study' | 'stats'>('study');
  const [settingsOpen, setSettingsOpen] = useState(false);
  const [addCardOpen, setAddCardOpen] = useState(false);
  const [authOpen, setAuthOpen] = useState(false);
  const [progressOpen, setProgressOpen] = useState(false);
  const [progressFilter, setProgressFilter] = useState<ProgressFilter>('all');
  const [toastMsg, setToastMsg] = useState('');
  const toastTimerRef = useRef<number | null>(null);
  const isSyncingRef = useRef(false);
  const userIdRef = useRef<string | null>(null);
  const modeRef = useRef<StudyMode>(mode);
  modeRef.current = mode;

  const showToast = useCallback((msg: string) => {
    setToastMsg(msg);
    if (toastTimerRef.current) window.clearTimeout(toastTimerRef.current);
    toastTimerRef.current = window.setTimeout(() => setToastMsg(''), 2200);
  }, []);

  // Theme sync
  useEffect(() => {
    document.documentElement.classList.toggle('dark', isDark);
    localStorage.setItem('anki_theme', isDark ? 'dark' : 'light');
  }, [isDark]);

  // Voices init
  useEffect(() => {
    const loadVoices = () => {
      const sorted = getSortedGermanVoices();
      setVoices(sorted);
      setSpeechSettings((prev) => {
        if (!prev.voiceName && sorted[0]) {
          return { ...prev, voiceName: sorted[0].name };
        }
        return prev;
      });
    };
    loadVoices();
    if ('speechSynthesis' in window) {
      window.speechSynthesis.onvoiceschanged = loadVoices;
    }
  }, []);

  const chosenVoice = useMemo(
    () => voices.find((v) => v.name === speechSettings.voiceName) || voices[0] || null,
    [voices, speechSettings.voiceName]
  );

  const voiceLabel = useMemo(() => {
    if (speechSettings.engine === 'google' && (speechSettings.googleApiKey.trim() || user)) {
      const short = speechSettings.googleVoiceName.replace('de-DE-', '');
      return `Google: ${short}`;
    }
    if (!('speechSynthesis' in window)) return 'Звук недоступен';
    return chosenVoice ? `Голос: ${chosenVoice.name.split(' ')[0]}` : 'Голос: авто';
  }, [chosenVoice, speechSettings.engine, speechSettings.googleApiKey, speechSettings.googleVoiceName, user]);

  const speak = useCallback(
    (text: string) => {
      speakGermanText(text, speechSettings, chosenVoice, Boolean(user), () => {
        showToast('Google TTS недоступен, включён системный голос');
      });
    },
    [chosenVoice, speechSettings, user, showToast]
  );

  const rebuildQueue = useCallback(
    (
      nextDeck: Card[],
      nextStats: DailyStats,
      forceMore = false,
      targetUserId?: string | null,
      targetMode?: StudyMode
    ) => {
      const effectiveMode = targetMode ?? modeRef.current;
      const { queue: nextQueue, activeKeys } = buildSessionQueue(
        nextDeck,
        nextStats.dailyLimit,
        nextStats.dailyReviewedCount,
        nextStats.maxActiveUnknown,
        nextStats.activeCardKeys,
        effectiveMode,
        forceMore
      );
      const updatedStats: DailyStats = { ...nextStats, activeCardKeys: activeKeys };
      setStats(updatedStats);
      const uid = targetUserId !== undefined ? targetUserId : userIdRef.current;
      saveLocalDailyStats(uid, updatedStats);
      if (uid) {
        syncProfileToSupabase(uid, updatedStats).catch(() => {});
      }
      passedSidesRef.current.clear();
      setQueue(nextQueue);
      setCurrentIndex(0);
      setIsFlipped(false);
    },
    []
  );

  // Initial queue build
  useEffect(() => {
    rebuildQueue(deck, stats);
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  // Supabase auth & sync
  const runSync = useCallback(
    async (targetUser: User, localDeck: Card[], localStats: DailyStats) => {
      if (isSyncingRef.current) return;
      isSyncingRef.current = true;
      setSyncState({ status: 'syncing', message: 'Синхронизация с Supabase...' });
      try {
        const { mergedDeck, mergedStats, mergedSpeech } = await fullSyncWithSupabase(
          targetUser.id,
          localDeck,
          localStats,
          loadSpeechSettings()
        );
        saveLocalDeck(targetUser.id, mergedDeck);
        saveLocalDailyStats(targetUser.id, mergedStats);
        saveSpeechSettings(mergedSpeech);
        setDeck(mergedDeck);
        setStats(mergedStats);
        setSpeechSettings(mergedSpeech);
        rebuildQueue(mergedDeck, mergedStats, false, targetUser.id);
        const time = new Date().toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' });
        setSyncState({ status: 'synced', message: `Синхронизировано • ${time}` });
      } catch (err) {
        setSyncState({
          status: 'error',
          message: `Ошибка синхронизации: ${err instanceof Error ? err.message : String(err)}`,
        });
      } finally {
        isSyncingRef.current = false;
      }
    },
    [rebuildQueue]
  );

  useEffect(() => {
    let active = true;
    supabase.auth.getSession().then(({ data: { session } }) => {
      if (!active) return;
      if (session?.user) {
        userIdRef.current = session.user.id;
        setUser(session.user);
        const uDeck = loadLocalDeck(session.user.id);
        const uStats = loadLocalDailyStats(session.user.id);
        setDeck(uDeck);
        setStats(uStats);
        runSync(session.user, uDeck, uStats);
      }
    });

    const {
      data: { subscription },
    } = supabase.auth.onAuthStateChange((event, session) => {
      const nextUser = session?.user ?? null;
      const nextId = nextUser?.id ?? null;
      const changed = nextId !== userIdRef.current;
      userIdRef.current = nextId;
      setUser(nextUser);
      if (nextUser && event === 'SIGNED_IN' && changed) {
        const uDeck = loadLocalDeck(nextUser.id);
        const uStats = loadLocalDailyStats(nextUser.id);
        setDeck(uDeck);
        setStats(uStats);
        runSync(nextUser, uDeck, uStats);
      } else if (!nextUser && event === 'SIGNED_OUT') {
        const gDeck = loadLocalDeck(null);
        const gStats = loadLocalDailyStats(null);
        setDeck(gDeck);
        setStats(gStats);
        rebuildQueue(gDeck, gStats, false, null);
        setSyncState({ status: 'local', message: 'Режим: локально (без входа)' });
      }
    });

    return () => {
      active = false;
      subscription.unsubscribe();
    };
  }, [runSync, rebuildQueue]);

  const currentItem = queue[currentIndex] ?? null;
  const currentCard = currentItem?.card ?? null;
  const direction: Direction = currentItem?.direction ?? (mode === 'ru-de' ? 'ru-de' : 'de-ru');

  // Auto-surface 5-min delayed "Hard" cards if the queue is currently empty
  useEffect(() => {
    const timer = window.setInterval(() => {
      if (delayedItemsRef.current.length === 0) return;
      const now = Date.now();
      const readyNow = delayedItemsRef.current.filter((d) => d.readyAt <= now);
      if (readyNow.length === 0) return;
      if (currentIndex >= queue.length) {
        delayedItemsRef.current = delayedItemsRef.current.filter((d) => d.readyAt > now);
        setQueue((prev) => [...prev, ...readyNow.map((d) => d.item)]);
      }
    }, 10000);
    return () => window.clearInterval(timer);
  }, [currentIndex, queue.length]);

  // Auto-play audio when card changes
  useEffect(() => {
    if (!currentCard || isFlipped) return;
    if (direction === 'de-ru' && speechSettings.autoPlay) {
      speak(`${currentCard.german}. ${currentCard.example_de || ''}`);
    }
  }, [currentCard, direction, isFlipped, speechSettings.autoPlay, speak]);

  const handleFlip = useCallback(() => {
    if (!currentCard || isFlipped) return;
    setIsFlipped(true);
    if (direction === 'ru-de' && speechSettings.autoPlay) {
      speak(`${currentCard.german}. ${currentCard.example_de || ''}`);
    }
  }, [currentCard, isFlipped, direction, speechSettings.autoPlay, speak]);

  const handleRate = useCallback(
    (rate: Rating) => {
      if (!isFlipped || !currentCard || !currentItem) return;

      const { updatedCard, requeueInSession, requeueDelaySlots, delayUntilMs } = applyCardRating(currentCard, rate);

      // In 'mixed' mode, a card only advances to the next SRS level once BOTH sides (de-ru & ru-de) pass.
      const requiresBothSides = mode === 'mixed';
      let cardToSave = updatedCard;
      const shouldRequeueThisSide = requeueInSession;

      if (requiresBothSides) {
        const sides = passedSidesRef.current.get(currentCard.cardKey) ?? new Set<Direction>();
        if (rate === 'again') {
          passedSidesRef.current.delete(currentCard.cardKey);
        } else if (delayUntilMs) {
          // Hard on unknown word: remove from queue for 5 min, then return with priority
          delayedItemsRef.current.push({
            item: { card: updatedCard, direction: currentItem.direction },
            readyAt: delayUntilMs,
          });
        } else if (!requeueInSession) {
          sides.add(currentItem.direction);
          passedSidesRef.current.set(currentCard.cardKey, sides);
          if (sides.size < 2) {
            // Only 1 side passed so far: do not advance SRS interval/reps yet
            cardToSave = currentCard;
          } else {
            // Both sides passed! Advance card to next level and clear tracker
            passedSidesRef.current.delete(currentCard.cardKey);
          }
        }
      } else if (delayUntilMs) {
        delayedItemsRef.current.push({
          item: { card: updatedCard, direction: currentItem.direction },
          readyAt: delayUntilMs,
        });
      }

      const cardChanged = cardToSave !== currentCard;
      const nextDeck = cardChanged
        ? deck.map((c) => (c.cardKey === cardToSave.cardKey ? cardToSave : c))
        : deck;

      const prevActiveSet = new Set(stats.activeCardKeys);
      const { activeKeys: nextActiveKeys, activeCards: nextActiveCards } = reconcileActiveQueue(
        nextDeck,
        stats.activeCardKeys,
        stats.maxActiveUnknown
      );
      const newlyAddedCards = nextActiveCards.filter((c) => !prevActiveSet.has(c.cardKey));

      const nextStats: DailyStats = {
        ...recordReviewInStats(stats),
        activeCardKeys: nextActiveKeys,
      };

      if (cardChanged) {
        setDeck(nextDeck);
        saveLocalDeck(user?.id ?? null, nextDeck);
      }
      setStats(nextStats);
      saveLocalDailyStats(user?.id ?? null, nextStats);

      if (user) {
        if (cardChanged) {
          syncCardsToSupabase(user.id, [cardToSave]).catch((err) =>
            setSyncState({ status: 'error', message: `Ошибка карточек: ${err.message}` })
          );
        }
        syncProfileToSupabase(user.id, nextStats).catch((err) =>
          setSyncState({ status: 'error', message: `Ошибка профиля: ${err.message}` })
        );
      }

      setQueue((prev) => {
        const now = Date.now();
        const next = prev.map((item) =>
          item.card.cardKey === cardToSave.cardKey ? { ...item, card: cardToSave } : item
        );

        // Pull any 5-min delayed "Hard" cards whose cooldown has expired right to the front (priority!)
        const readyNow = delayedItemsRef.current.filter((d) => d.readyAt <= now);
        if (readyNow.length > 0) {
          delayedItemsRef.current = delayedItemsRef.current.filter((d) => d.readyAt > now);
          next.splice(currentIndex + 1, 0, ...readyNow.map((d) => d.item));
        }

        if (shouldRequeueThisSide) {
          const insertAt = Math.min(next.length, currentIndex + 1 + requeueDelaySlots);
          next.splice(insertAt, 0, { card: cardToSave, direction: currentItem.direction });
        }
        if (newlyAddedCards.length > 0 && nextStats.dailyReviewedCount < nextStats.dailyLimit) {
          const newItems = expandCardsToQueueItems(newlyAddedCards, mode);
          const existingPairs = new Set(
            next.slice(currentIndex + 1).map((it) => `${it.card.cardKey}|${it.direction}`)
          );
          for (const it of newItems) {
            if (!existingPairs.has(`${it.card.cardKey}|${it.direction}`)) {
              next.push(it);
            }
          }
        }
        return next;
      });
      setCurrentIndex((i) => i + 1);
      setIsFlipped(false);
    },
    [isFlipped, currentCard, currentItem, deck, stats, user, currentIndex, mode]
  );

  // Keyboard shortcuts
  const anyModalOpen = settingsOpen || addCardOpen || authOpen || progressOpen;
  useEffect(() => {
    const onKeyDown = (e: KeyboardEvent) => {
      if (e.key === 'Escape') {
        setSettingsOpen(false);
        setAddCardOpen(false);
        setAuthOpen(false);
        setProgressOpen(false);
        return;
      }
      if (anyModalOpen) return;
      const tag = (document.activeElement as HTMLElement | null)?.tagName;
      if (tag && ['INPUT', 'TEXTAREA', 'SELECT'].includes(tag)) return;
      if (e.code === 'Space') {
        e.preventDefault();
        if (!isFlipped) handleFlip();
      } else if (isFlipped) {
        if (e.key === '1') handleRate('again');
        if (e.key === '2') handleRate('hard');
        if (e.key === '3') handleRate('good');
        if (e.key === '4') handleRate('easy');
      }
    };
    window.addEventListener('keydown', onKeyDown);
    return () => window.removeEventListener('keydown', onKeyDown);
  }, [anyModalOpen, isFlipped, handleFlip, handleRate]);

  const handleAddCard = (data: {
    german: string;
    russian: string;
    example_de: string;
    example_ru: string;
    context: string;
    tags: string;
    studyNow: boolean;
  }) => {
    const newCard = normalizeCard({
      id: Date.now(),
      cardKey: generateCustomKey(),
      german: data.german,
      russian: data.russian,
      example_de: data.example_de,
      example_ru: data.example_ru,
      context: data.context,
      tags: data.tags,
      isCustom: true,
      reps: 0,
      interval: 0,
      nextReview: 0,
      updatedAt: Date.now(),
    });
    const nextDeck = [...deck, newCard];
    setDeck(nextDeck);
    saveLocalDeck(user?.id ?? null, nextDeck);
    if (user) {
      syncCardsToSupabase(user.id, [newCard]).catch(() => {});
    }
    if (data.studyNow) {
      const items = expandCardsToQueueItems([newCard], mode);
      setQueue((prev) => {
        const next = [...prev];
        next.splice(currentIndex, 0, ...items);
        return next;
      });
      setIsFlipped(false);
    } else if (queue.length === 0) {
      rebuildQueue(nextDeck, stats, true);
    }
    showToast('Карточка добавлена!');
  };

  const handleDeleteCustomCard = (cardKey: string) => {
    const nextDeck = deck.filter((c) => c.cardKey !== cardKey);
    setDeck(nextDeck);
    saveLocalDeck(user?.id ?? null, nextDeck);
    setQueue((prev) => prev.filter((item) => item.card.cardKey !== cardKey));
    if (user) {
      deleteCardFromSupabase(user.id, cardKey).catch(() => {});
    }
    showToast('Карточка удалена');
  };

  const handleImportCsv = (rawCsv: string) => {
    const lines = rawCsv.trim().split('\n');
    const added: Card[] = [];
    let idCounter = Date.now();
    lines.forEach((line) => {
      const parts = line.split(';').map((p) => p.trim().replace(/^"|"$/g, ''));
      if (parts.length >= 2 && parts[0] && parts[1] && parts[0].toLowerCase() !== 'german') {
        added.push(
          normalizeCard({
            id: idCounter++,
            cardKey: generateCustomKey(),
            german: parts[0],
            russian: parts[1],
            example_de: parts[2] || '',
            example_ru: parts[3] || '',
            context: parts[4] || '',
            tags: parts[5] || 'custom',
            isCustom: true,
            reps: 0,
            interval: 0,
            nextReview: 0,
            updatedAt: Date.now(),
          })
        );
      }
    });
    if (added.length === 0) {
      showToast('Не найдено валидных строк CSV');
      return;
    }
    const nextDeck = [...deck, ...added];
    setDeck(nextDeck);
    saveLocalDeck(user?.id ?? null, nextDeck);
    if (user) {
      syncCardsToSupabase(user.id, added).catch(() => {});
    }
    rebuildQueue(nextDeck, stats);
    showToast(`Добавлено карточек: ${added.length}`);
  };

  const handleExportCsv = () => {
    const esc = (v: string) => String(v || '').replace(/"/g, '""');
    const rows = [
      'German;Russian;Example_DE;Example_RU;Context;Tags',
      ...deck.map(
        (c) =>
          `"${esc(c.german)}";"${esc(c.russian)}";"${esc(c.example_de)}";"${esc(c.example_ru)}";"${esc(c.context)}";"${esc(c.tags)}"`
      ),
    ];
    const link = document.createElement('a');
    link.href = 'data:text/csv;charset=utf-8,' + encodeURIComponent(rows.join('\n'));
    link.download = 'anki_deutsch_b1_b2.csv';
    document.body.appendChild(link);
    link.click();
    document.body.removeChild(link);
    showToast('CSV успешно экспортирован');
  };

  const handlePracticeCard = (cardKey: string) => {
    const card = deck.find((c) => c.cardKey === cardKey);
    if (!card) return;
    const items = expandCardsToQueueItems([card], mode);
    setQueue((prev) => {
      const filtered = prev.filter((item) => item.card.cardKey !== cardKey);
      const insertIdx = Math.min(currentIndex, filtered.length);
      filtered.splice(insertIdx, 0, ...items);
      return filtered;
    });
    setIsFlipped(false);
    setProgressOpen(false);
    showToast('Карточка открыта для повторения');
  };

  const handleResetCard = (cardKey: string) => {
    const now = Date.now();
    let changed: Card | null = null;
    const nextDeck = deck.map((c) => {
      if (c.cardKey !== cardKey) return c;
      changed = { ...c, reps: 0, interval: 0, nextReview: 0, updatedAt: now };
      return changed;
    });
    setDeck(nextDeck);
    saveLocalDeck(user?.id ?? null, nextDeck);
    if (user && changed) {
      syncCardsToSupabase(user.id, [changed]).catch(() => {});
    }
    showToast('Прогресс карточки сброшен');
  };

  const newCount = useMemo(() => deck.filter((c) => c.reps === 0).length, [deck]);
  const learningCount = useMemo(() => deck.filter((c) => c.reps > 0 && c.reps < 3).length, [deck]);
  const masteredCount = useMemo(() => deck.filter((c) => c.reps >= 3).length, [deck]);
  const customCards = useMemo(() => deck.filter((c) => c.isCustom), [deck]);
  const progressPercent = queue.length > 0 ? (currentIndex / queue.length) * 100 : 100;

  return (
    <div className="h-[100dvh] bg-slate-100 dark:bg-slate-950 text-slate-900 dark:text-slate-100 flex flex-col font-sans transition-colors duration-200 overflow-hidden">
      <Header
        voiceLabel={voiceLabel}
        mode={mode}
        onModeChange={(nextMode) => {
          setMode(nextMode);
          rebuildQueue(deck, stats, false, undefined, nextMode);
        }}
        userEmail={user?.email ?? null}
        syncState={syncState}
        isDark={isDark}
        onOpenAddCard={() => setAddCardOpen(true)}
        onOpenAuth={() => setAuthOpen(true)}
        onOpenSettings={() => setSettingsOpen(true)}
        onToggleTheme={() => setIsDark((d) => !d)}
      />

      <StatusRibbon
        dailyReviewedCount={stats.dailyReviewedCount}
        dailyLimit={stats.dailyLimit}
        streak={getEffectiveStreak(stats)}
        newCount={newCount}
        learningCount={learningCount}
        masteredCount={masteredCount}
        progressPercent={progressPercent}
        onOpenStats={() => setActiveView((v) => (v === 'stats' ? 'study' : 'stats'))}
        onOpenProgress={(filter) => {
          setProgressFilter(filter);
          setProgressOpen(true);
        }}
      />

      <main className="flex-1 max-w-md w-full mx-auto px-3 py-2 flex flex-col justify-between overflow-hidden">
        {activeView === 'stats' ? (
          <StatsView
            deck={deck}
            stats={stats}
            onBackToStudy={() => setActiveView('study')}
            onOpenProgress={(filter) => {
              setProgressFilter(filter);
              setProgressOpen(true);
            }}
          />
        ) : !currentCard ? (
          <div className="my-auto text-center py-8 px-4 bg-white dark:bg-slate-900 border border-slate-200 dark:border-slate-800 rounded-3xl shadow-sm">
            <div className="w-12 h-12 bg-emerald-100 dark:bg-emerald-950 text-emerald-600 rounded-2xl flex items-center justify-center mx-auto mb-3">
              <svg className="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M5 13l4 4L19 7" />
              </svg>
            </div>
            <h2 className="text-base font-bold mb-1">
              {stats.dailyReviewedCount >= stats.dailyLimit
                ? 'Дневная норма выполнена!'
                : 'Очередь завершена!'}
            </h2>
            <p className="text-xs text-slate-500 dark:text-slate-400 mb-4">
              {stats.dailyReviewedCount >= stats.dailyLimit
                ? `Вы повторили ${stats.dailyReviewedCount} из ${stats.dailyLimit} карточек. Отличная работа!`
                : `Вы повторили ${stats.dailyReviewedCount} карточек за сегодня.`}
            </p>
            <button
              type="button"
              onClick={() => rebuildQueue(deck, stats, true)}
              className="w-full py-3 bg-blue-600 hover:bg-blue-700 text-white rounded-xl text-xs font-bold transition"
            >
              Продолжить ещё 20 карточек
            </button>
          </div>
        ) : (
          <FlashCard
            card={currentCard}
            direction={direction}
            isFlipped={isFlipped}
            onFlip={handleFlip}
            onRate={handleRate}
            onSpeakAll={() => speak(`${currentCard.german}. ${currentCard.example_de || ''}`)}
            onSpeakTerm={() => speak(currentCard.german)}
            onSpeakExample={() => speak(currentCard.example_de || '')}
          />
        )}
      </main>

      <SettingsModal
        isOpen={settingsOpen}
        onClose={() => setSettingsOpen(false)}
        voices={voices}
        speechSettings={speechSettings}
        onUpdateSpeech={(next) => {
          setSpeechSettings(next);
          saveSpeechSettings(next);
          if (user) {
            syncProfileToSupabase(user.id, stats, next).catch(() => {});
          }
        }}
        onTestVoice={() => speak('Guten Tag! Ich spreche Deutsch flüssig und natürlich.')}
        dailyLimit={stats.dailyLimit}
        maxActiveUnknown={stats.maxActiveUnknown}
        onSaveDailyLimit={(limit) => {
          const nextStats = { ...stats, dailyLimit: limit };
          setStats(nextStats);
          saveLocalDailyStats(user?.id ?? null, nextStats);
          if (user) syncProfileToSupabase(user.id, nextStats).catch(() => {});
          rebuildQueue(deck, nextStats);
          showToast(`Дневной лимит: ${limit}`);
        }}
        onSaveMaxActiveUnknown={(max) => {
          const nextStats = { ...stats, maxActiveUnknown: max };
          setStats(nextStats);
          saveLocalDailyStats(user?.id ?? null, nextStats);
          rebuildQueue(deck, nextStats);
          showToast(`Макс. неизвестных слов: ${max}`);
        }}
        customCards={customCards}
        onOpenAddCard={() => {
          setSettingsOpen(false);
          setAddCardOpen(true);
        }}
        onDeleteCustomCard={handleDeleteCustomCard}
        onImportCsv={handleImportCsv}
        onExportCsv={handleExportCsv}
      />

      <AddCardModal
        isOpen={addCardOpen}
        onClose={() => setAddCardOpen(false)}
        onAddCard={handleAddCard}
      />

      <AuthModal
        isOpen={authOpen}
        onClose={() => setAuthOpen(false)}
        userEmail={user?.email ?? null}
        totalCards={deck.length}
        customCards={customCards.length}
        dailyReviewedCount={stats.dailyReviewedCount}
        dailyLimit={stats.dailyLimit}
        syncState={syncState}
        onSyncNow={async () => {
          if (user) {
            await runSync(user, deck, stats);
            showToast('Синхронизация завершена');
          }
        }}
        onSignOut={async () => {
          await supabase.auth.signOut();
          showToast('Вы вышли из аккаунта');
        }}
        onToast={showToast}
      />

      <ProgressModal
        isOpen={progressOpen}
        onClose={() => setProgressOpen(false)}
        deck={deck}
        filter={progressFilter}
        onFilterChange={setProgressFilter}
        onSpeak={speak}
        onPracticeCard={handlePracticeCard}
        onResetCard={handleResetCard}
      />

      {/* Toast */}
      <div
        className={`fixed bottom-16 left-1/2 -translate-x-1/2 bg-slate-900 text-white px-4 py-2 rounded-full text-xs shadow-xl pointer-events-none transition-all duration-300 z-50 ${
          toastMsg ? 'opacity-100' : 'opacity-0'
        }`}
      >
        {toastMsg}
      </div>
    </div>
  );
}
