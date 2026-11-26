import { useCallback, useEffect, useMemo, useRef, useState } from 'react';
import type { User } from '@supabase/supabase-js';
import {
  DEFAULT_DECK_KEY,
  type Card,
  type DailyStats,
  type Deck,
  type Direction,
  type ProgressFilter,
  type QueueItem,
  type Rating,
  type SpeechSettings,
  type StudyMode,
  type SyncState,
} from './types';
import {
  applyCardRating,
  buildSessionQueue,
  expandCardsToQueueItems,
  generateCustomKey,
  generateDeckKey,
  getCardStage,
  normalizeCard,
  reconcileActiveQueue,
} from './lib/srs';
import {
  clearUserLocalData,
  loadLocalDailyStats,
  loadLocalDeck,
  loadLocalDecks,
  loadSpeechSettings,
  saveLocalDailyStats,
  saveLocalDeck,
  saveLocalDecks,
  saveSpeechSettings,
} from './lib/storage';
import {
  getSortedVoicesForLang,
  getTestPhraseForLang,
  resolveGoogleVoiceForLang,
  speakText,
  stopActiveAudio,
} from './lib/speech';
import {
  deleteAccountFromSupabase,
  deleteCardFromSupabase,
  deleteDeckFromSupabase,
  fullSyncWithSupabase,
  supabase,
  syncCardsToSupabase,
  syncDeckToSupabase,
  syncProfileToSupabase,
} from './lib/supabase';
import { getEffectiveStreak, recordReviewInStats } from './lib/stats';
import { useI18n } from './lib/I18nContext';
import { loadStarterDeckCards, type CatalogLang, type CefrLevel } from './data/starterDecks';
import { Header } from './components/Header';
import { StatusRibbon } from './components/StatusRibbon';
import { FlashCard } from './components/FlashCard';
import { StatsView } from './components/StatsView';
import { DecksView } from './components/DecksView';
import { SettingsModal } from './components/SettingsModal';
import { AddCardModal } from './components/AddCardModal';
import { AuthModal } from './components/AuthModal';
import { ProgressModal } from './components/ProgressModal';

export default function App() {
  const { t } = useI18n();
  const tRef = useRef(t);
  tRef.current = t;

  const [user, setUser] = useState<User | null>(null);
  const [syncState, setSyncState] = useState<SyncState>({
    status: 'local',
    message: t.syncLocal,
  });
  const [deck, setDeck] = useState<Card[]>(() => loadLocalDeck(null));
  const [decks, setDecks] = useState<Deck[]>(() => loadLocalDecks(null));
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

  const [activeView, setActiveView] = useState<'study' | 'decks' | 'stats'>('study');
  const [settingsOpen, setSettingsOpen] = useState(false);
  const [addCardOpen, setAddCardOpen] = useState(false);
  const [addCardTargetDeckKey, setAddCardTargetDeckKey] = useState<string>(DEFAULT_DECK_KEY);
  const [authOpen, setAuthOpen] = useState(false);
  const [isPasswordRecovery, setIsPasswordRecovery] = useState(() =>
    typeof window !== 'undefined' && window.location.hash.includes('type=recovery')
  );
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

  const activeDeckKey = decks.some((d) => d.deckKey === stats.activeDeckKey)
    ? stats.activeDeckKey
    : decks[0]?.deckKey || '';
  const activeDeckMeta = useMemo(
    () => decks.find((d) => d.deckKey === activeDeckKey) || decks[0],
    [decks, activeDeckKey]
  );
  const activeLearningLang = activeDeckMeta?.learningLang || 'DE';

  // Voices init — dynamically tracks the active deck's learning language
  useEffect(() => {
    const loadVoices = () => {
      const sorted = getSortedVoicesForLang(activeLearningLang);
      setVoices(sorted);
    };
    loadVoices();
    if ('speechSynthesis' in window) {
      window.speechSynthesis.onvoiceschanged = loadVoices;
    }
  }, [activeLearningLang]);

  const chosenVoice = useMemo(
    () => voices.find((v) => v.name === speechSettings.voiceName) || voices[0] || null,
    [voices, speechSettings.voiceName]
  );

  const voiceLabel = useMemo(() => {
    if (speechSettings.engine === 'google' && (speechSettings.googleApiKey.trim() || user)) {
      const resolved = resolveGoogleVoiceForLang(speechSettings.googleVoiceName, activeLearningLang);
      const short = resolved.replace(/^[a-z]{2}-[A-Z]{2}-/, '');
      return `${activeLearningLang} • ${short}`;
    }
    if (!('speechSynthesis' in window)) return t.voiceUnavailable;
    return chosenVoice ? `${activeLearningLang} • ${chosenVoice.name.split(' ')[0]}` : t.voiceAuto;
  }, [
    activeLearningLang,
    chosenVoice,
    speechSettings.engine,
    speechSettings.googleApiKey,
    speechSettings.googleVoiceName,
    user,
    t,
  ]);

  const speak = useCallback(
    (text: string) => {
      speakText(text, activeLearningLang, speechSettings, chosenVoice, Boolean(user), (reason) => {
        const suffix = reason ? ` (${reason.slice(0, 80)})` : '';
        showToast(`${tRef.current.toastGoogleFallback}${suffix}`);
      });
    },
    [activeLearningLang, chosenVoice, speechSettings, user, showToast]
  );

  const rebuildQueue = useCallback(
    (
      allCards: Card[],
      nextStats: DailyStats,
      forceMore = false,
      targetUserId?: string | null,
      targetMode?: StudyMode
    ) => {
      const effectiveMode = targetMode ?? modeRef.current;
      const deckKey = nextStats.activeDeckKey || DEFAULT_DECK_KEY;
      const deckCards = allCards.filter((c) => c.deckKey === deckKey);
      const { queue: nextQueue, activeKeys } = buildSessionQueue(
        deckCards,
        nextStats.dailyLimit,
        nextStats.dailyReviewedCount,
        nextStats.maxActiveUnknown,
        nextStats.activeCardKeys,
        effectiveMode,
        forceMore
      );
      const updatedStats: DailyStats = { ...nextStats, activeDeckKey: deckKey, activeCardKeys: activeKeys };
      setStats(updatedStats);
      const uid = targetUserId !== undefined ? targetUserId : userIdRef.current;
      saveLocalDailyStats(uid, updatedStats);
      if (uid) {
        syncProfileToSupabase(uid, updatedStats).catch(() => {});
      }
      passedSidesRef.current.clear();
      delayedItemsRef.current = [];
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
    async (targetUser: User, localDeck: Card[], localDecks: Deck[], localStats: DailyStats) => {
      if (isSyncingRef.current) return;
      isSyncingRef.current = true;
      setSyncState({ status: 'syncing', message: tRef.current.syncSyncing });
      try {
        const { mergedDeck, mergedDecks, mergedStats, mergedSpeech } = await fullSyncWithSupabase(
          targetUser.id,
          localDeck,
          localDecks,
          localStats,
          loadSpeechSettings()
        );
        saveLocalDeck(targetUser.id, mergedDeck);
        saveLocalDecks(targetUser.id, mergedDecks);
        saveLocalDailyStats(targetUser.id, mergedStats);
        saveSpeechSettings(mergedSpeech);
        setDeck(mergedDeck);
        setDecks(mergedDecks);
        setStats(mergedStats);
        setSpeechSettings(mergedSpeech);
        rebuildQueue(mergedDeck, mergedStats, false, targetUser.id);
        const time = new Date().toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' });
        setSyncState({ status: 'synced', message: tRef.current.syncSynced(time) });
      } catch (err) {
        setSyncState({
          status: 'error',
          message: tRef.current.syncError(err instanceof Error ? err.message : String(err)),
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
        const uDecks = loadLocalDecks(session.user.id);
        const uStats = loadLocalDailyStats(session.user.id);
        setDeck(uDeck);
        setDecks(uDecks);
        setStats(uStats);
        runSync(session.user, uDeck, uDecks, uStats);
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
      if (event === 'PASSWORD_RECOVERY') {
        setIsPasswordRecovery(true);
        setAuthOpen(true);
      } else if (nextUser && event === 'SIGNED_IN' && changed) {
        const uDeck = loadLocalDeck(nextUser.id);
        const uDecks = loadLocalDecks(nextUser.id);
        const uStats = loadLocalDailyStats(nextUser.id);
        setDeck(uDeck);
        setDecks(uDecks);
        setStats(uStats);
        runSync(nextUser, uDeck, uDecks, uStats);
      } else if (!nextUser && event === 'SIGNED_OUT') {
        const gDeck = loadLocalDeck(null);
        const gDecks = loadLocalDecks(null);
        const gStats = loadLocalDailyStats(null);
        setDeck(gDeck);
        setDecks(gDecks);
        setStats(gStats);
        rebuildQueue(gDeck, gStats, false, null);
        setSyncState({ status: 'local', message: tRef.current.syncLocal });
      }
    });

    return () => {
      active = false;
      subscription.unsubscribe();
    };
  }, [runSync, rebuildQueue]);

  const currentItem = queue[currentIndex] ?? null;
  const currentCard = currentItem?.card ?? null;
  const direction: Direction =
    currentItem?.direction ?? (mode === 'orig-learning' ? 'orig-learning' : 'learning-orig');

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

  const speakRef = useRef(speak);
  speakRef.current = speak;

  // Stop any playing or in-flight audio whenever the active card or view changes
  useEffect(() => {
    stopActiveAudio();
    if (activeView !== 'study' || !currentCard) return;
    if (direction === 'learning-orig' && speechSettings.autoPlay) {
      speakRef.current(`${currentCard.learning}. ${currentCard.example_learning || ''}`);
    }
    return () => {
      stopActiveAudio();
    };
  }, [activeView, currentIndex, currentCard?.cardKey, direction, speechSettings.autoPlay]);

  const handleFlip = useCallback(() => {
    if (!currentCard || isFlipped) return;
    setIsFlipped(true);
    if (direction === 'orig-learning' && speechSettings.autoPlay) {
      speak(`${currentCard.learning}. ${currentCard.example_learning || ''}`);
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
      let shouldRemoveRemainingSides = false;

      if (rate === 'again') {
        passedSidesRef.current.delete(currentCard.cardKey);
      } else if (rate === 'hard' && delayUntilMs) {
        // Hard: remove card from queue for 5 min without changing progress, then return with priority
        shouldRemoveRemainingSides = true;
        delayedItemsRef.current.push({
          item: { card: updatedCard, direction: currentItem.direction },
          readyAt: delayUntilMs,
        });
      } else if (requiresBothSides) {
        const sides = passedSidesRef.current.get(currentCard.cardKey) ?? new Set<Direction>();
        sides.add(currentItem.direction);
        passedSidesRef.current.set(currentCard.cardKey, sides);
        if (sides.size < 2) {
          // Only 1 side passed so far: do not advance SRS interval/reps yet
          cardToSave = currentCard;
        } else {
          // Both sides passed! Advance card to next level (10 min on first Good, or days)
          passedSidesRef.current.delete(currentCard.cardKey);
          if (delayUntilMs) {
            shouldRemoveRemainingSides = true;
            delayedItemsRef.current.push({
              item: { card: updatedCard, direction: currentItem.direction },
              readyAt: delayUntilMs,
            });
          }
        }
      } else if (delayUntilMs) {
        shouldRemoveRemainingSides = true;
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
      const activeDeckCardsAfterRate = nextDeck.filter(
        (c) => c.deckKey === (stats.activeDeckKey || DEFAULT_DECK_KEY)
      );
      const { activeKeys: nextActiveKeys, activeCards: nextActiveCards } = reconcileActiveQueue(
        activeDeckCardsAfterRate,
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
        let next = prev.map((item) =>
          item.card.cardKey === cardToSave.cardKey ? { ...item, card: cardToSave } : item
        );

        // If card was put on a 5-min (Hard) or 10-min (first Good) cooldown, remove any remaining
        // upcoming items for this card from the current queue so it truly leaves for that duration.
        if (shouldRemoveRemainingSides) {
          next = [
            ...next.slice(0, currentIndex + 1),
            ...next.slice(currentIndex + 1).filter((item) => item.card.cardKey !== cardToSave.cardKey),
          ];
        }

        // Pull any delayed cards whose cooldown has expired right to the front (most overdue first)
        const readyNow = delayedItemsRef.current
          .filter((d) => d.readyAt <= now)
          .sort((a, b) => a.readyAt - b.readyAt);
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
              const minIdx = currentIndex + 1;
              const insertAt = minIdx + Math.floor(Math.random() * (next.length - minIdx + 1));
              next.splice(insertAt, 0, it);
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

  const handleSelectDeck = (deckKey: string) => {
    const nextStats: DailyStats = {
      ...stats,
      activeDeckKey: deckKey,
      activeCardKeys: [],
    };
    rebuildQueue(deck, nextStats);
    setActiveView('study');
  };

  const handleCreateDeck = (
    name: string,
    description: string,
    origLang: string,
    learningLang: string
  ) => {
    const now = Date.now();
    const newDeck: Deck = {
      deckKey: generateDeckKey(),
      name,
      description,
      origLang,
      learningLang,
      isDefault: false,
      createdAt: now,
      updatedAt: now,
    };
    const nextDecks = [...decks, newDeck];
    setDecks(nextDecks);
    saveLocalDecks(user?.id ?? null, nextDecks);
    if (!stats.activeDeckKey || !decks.some((d) => d.deckKey === stats.activeDeckKey)) {
      const nextStats: DailyStats = { ...stats, activeDeckKey: newDeck.deckKey, activeCardKeys: [] };
      rebuildQueue(deck, nextStats);
    }
    if (user) {
      syncDeckToSupabase(user.id, newDeck).catch(() => {});
    }
    showToast(t.toastDeckCreated(name));
  };

  const handleAddStarterDeck = async (
    level: CefrLevel,
    origLang: CatalogLang,
    learningLang: CatalogLang
  ) => {
    const now = Date.now();
    const deckKey = generateDeckKey();
    const name = `${origLang} → ${learningLang} • ${level}`;
    const newDeck: Deck = {
      deckKey,
      name,
      description: `Starter ${level} (${origLang} → ${learningLang})`,
      origLang,
      learningLang,
      isDefault: false,
      createdAt: now,
      updatedAt: now,
    };
    try {
      const starterCards = await loadStarterDeckCards(level, origLang, learningLang, deckKey);
      const nextDecks = [...decks, newDeck];
      const nextCards = [...deck, ...starterCards];
      setDecks(nextDecks);
      setDeck(nextCards);
      saveLocalDecks(user?.id ?? null, nextDecks);
      saveLocalDeck(user?.id ?? null, nextCards);
      if (!stats.activeDeckKey || !decks.some((d) => d.deckKey === stats.activeDeckKey)) {
        const nextStats: DailyStats = { ...stats, activeDeckKey: deckKey, activeCardKeys: [] };
        rebuildQueue(nextCards, nextStats);
      }
      if (user) {
        syncDeckToSupabase(user.id, newDeck)
          .then(() => syncCardsToSupabase(user.id, starterCards))
          .catch(() => {});
      }
      showToast(t.toastStarterAdded(name, starterCards.length));
    } catch (err) {
      showToast(err instanceof Error ? err.message : 'Failed to load starter deck');
    }
  };

  const handleDeleteDeck = (deckKey: string) => {
    const nextDecks = decks.filter((d) => d.deckKey !== deckKey);
    const nextCards = deck.filter((c) => c.deckKey !== deckKey);
    setDecks(nextDecks);
    setDeck(nextCards);
    saveLocalDecks(user?.id ?? null, nextDecks);
    saveLocalDeck(user?.id ?? null, nextCards);
    if (user) {
      deleteDeckFromSupabase(user.id, deckKey).catch(() => {});
    }
    if (stats.activeDeckKey === deckKey) {
      const nextActiveKey = nextDecks[0]?.deckKey || '';
      const nextStats: DailyStats = { ...stats, activeDeckKey: nextActiveKey, activeCardKeys: [] };
      rebuildQueue(nextCards, nextStats);
    }
    showToast(t.toastDeckDeleted);
  };

  const handleAddCard = (data: {
    deckKey: string;
    learning: string;
    orig: string;
    example_learning: string;
    example_orig: string;
    context: string;
    tags: string;
    studyNow: boolean;
  }) => {
    const targetDeckKey = data.deckKey || stats.activeDeckKey || DEFAULT_DECK_KEY;
    const newCard = normalizeCard({
      id: Date.now(),
      deckKey: targetDeckKey,
      cardKey: generateCustomKey(),
      learning: data.learning,
      orig: data.orig,
      example_learning: data.example_learning,
      example_orig: data.example_orig,
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
    if (targetDeckKey === stats.activeDeckKey) {
      if (data.studyNow) {
        const items = expandCardsToQueueItems([newCard], mode);
        setQueue((prev) => {
          const next = [...prev];
          next.splice(currentIndex, 0, ...items);
          return next;
        });
        setIsFlipped(false);
        setActiveView('study');
      } else if (queue.length === 0) {
        rebuildQueue(nextDeck, stats, true);
      }
    }
    showToast(t.toastCardAdded);
  };

  const handleDeleteCustomCard = (cardKey: string) => {
    const nextDeck = deck.filter((c) => c.cardKey !== cardKey);
    setDeck(nextDeck);
    saveLocalDeck(user?.id ?? null, nextDeck);
    setQueue((prev) => prev.filter((item) => item.card.cardKey !== cardKey));
    if (user) {
      deleteCardFromSupabase(user.id, cardKey).catch(() => {});
    }
    showToast(t.toastCardDeleted);
  };

  const handleImportCsv = (targetDeckKey: string, rawCsv: string) => {
    const resolvedDeckKey = targetDeckKey || stats.activeDeckKey || DEFAULT_DECK_KEY;
    const lines = rawCsv.trim().split('\n');
    const added: Card[] = [];
    let idCounter = Date.now();
    lines.forEach((line) => {
      const parts = line.split(';').map((p) => p.trim().replace(/^"|"$/g, ''));
      const firstLower = (parts[0] || '').toLowerCase();
      if (parts.length >= 2 && parts[0] && parts[1] && firstLower !== 'german' && firstLower !== 'learning') {
        added.push(
          normalizeCard({
            id: idCounter++,
            deckKey: resolvedDeckKey,
            cardKey: generateCustomKey(),
            learning: parts[0],
            orig: parts[1],
            example_learning: parts[2] || '',
            example_orig: parts[3] || '',
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
      showToast(t.toastCsvInvalid);
      return;
    }
    const nextDeck = [...deck, ...added];
    setDeck(nextDeck);
    saveLocalDeck(user?.id ?? null, nextDeck);
    if (user) {
      syncCardsToSupabase(user.id, added).catch(() => {});
    }
    if (resolvedDeckKey === stats.activeDeckKey) {
      rebuildQueue(nextDeck, stats);
    }
    showToast(t.toastCsvAdded(added.length));
  };

  const handleExportCsv = (targetDeckKey: string) => {
    const resolvedDeckKey = targetDeckKey || stats.activeDeckKey || DEFAULT_DECK_KEY;
    const targetDeckMeta = decks.find((d) => d.deckKey === resolvedDeckKey);
    const cardsToExport = deck.filter((c) => c.deckKey === resolvedDeckKey);
    const esc = (v: string) => String(v || '').replace(/"/g, '""');
    const rows = [
      'Learning;Orig;Example_Learning;Example_Orig;Context;Tags',
      ...cardsToExport.map(
        (c) =>
          `"${esc(c.learning)}";"${esc(c.orig)}";"${esc(c.example_learning)}";"${esc(c.example_orig)}";"${esc(c.context)}";"${esc(c.tags)}"`
      ),
    ];
    const safeName = (targetDeckMeta?.name || 'deck').toLowerCase().replace(/[^a-z0-9а-яё]+/gi, '_');
    const link = document.createElement('a');
    link.href = 'data:text/csv;charset=utf-8,' + encodeURIComponent(rows.join('\n'));
    link.download = `anki_${safeName}.csv`;
    document.body.appendChild(link);
    link.click();
    document.body.removeChild(link);
    showToast(t.toastCsvExported);
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
    showToast(t.toastCardOpened);
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
    showToast(t.toastCardReset);
  };

  const activeDeckCards = useMemo(
    () => deck.filter((c) => c.deckKey === activeDeckKey),
    [deck, activeDeckKey]
  );

  const newCount = useMemo(
    () => activeDeckCards.filter((c) => getCardStage(c) === 'new').length,
    [activeDeckCards]
  );
  const learningCount = useMemo(
    () => activeDeckCards.filter((c) => getCardStage(c) === 'learning').length,
    [activeDeckCards]
  );
  const masteredCount = useMemo(
    () => activeDeckCards.filter((c) => getCardStage(c) === 'mastered').length,
    [activeDeckCards]
  );
  const customCards = useMemo(
    () => activeDeckCards.filter((c) => c.isCustom),
    [activeDeckCards]
  );

  return (
    <div className="h-[100dvh] bg-gradient-to-b from-slate-50 via-slate-50 to-indigo-50/40 dark:from-slate-950 dark:via-slate-950 dark:to-indigo-950/20 text-slate-900 dark:text-slate-100 flex flex-col font-sans transition-colors duration-200 overflow-hidden">
      <Header
        activeDeckName={activeDeckMeta?.name || t.myDecks}
        origLang={activeDeckMeta?.origLang || 'RU'}
        learningLang={activeLearningLang}
        voiceLabel={voiceLabel}
        mode={mode}
        onModeChange={(nextMode) => {
          setMode(nextMode);
          rebuildQueue(deck, stats, false, undefined, nextMode);
        }}
        userEmail={user?.email ?? null}
        syncState={syncState}
        isDecksOpen={activeView === 'decks'}
        showStudyBar={activeView === 'study'}
        onToggleDecks={() => setActiveView((v) => (v === 'decks' ? 'study' : 'decks'))}
        onOpenAddCard={() => {
          setAddCardTargetDeckKey(activeDeckKey);
          setAddCardOpen(true);
        }}
        onOpenAuth={() => setAuthOpen(true)}
        onOpenSettings={() => setSettingsOpen(true)}
      />

      <StatusRibbon
        dailyReviewedCount={stats.dailyReviewedCount}
        dailyLimit={stats.dailyLimit}
        streak={getEffectiveStreak(stats)}
        newCount={newCount}
        learningCount={learningCount}
        masteredCount={masteredCount}
        onOpenStats={() => setActiveView((v) => (v === 'stats' ? 'study' : 'stats'))}
        onOpenProgress={(filter) => {
          setProgressFilter(filter);
          setProgressOpen(true);
        }}
      />

      <main className="flex-1 max-w-lg w-full mx-auto px-3.5 py-2.5 flex flex-col justify-between overflow-hidden">
        {activeView === 'decks' ? (
          <DecksView
            decks={decks}
            allCards={deck}
            activeDeckKey={activeDeckKey}
            onSelectDeck={handleSelectDeck}
            onCreateDeck={handleCreateDeck}
            onAddStarterDeck={handleAddStarterDeck}
            onDeleteDeck={handleDeleteDeck}
            onAddCardToDeck={(targetKey) => {
              setAddCardTargetDeckKey(targetKey);
              setAddCardOpen(true);
            }}
            onImportCsvToDeck={handleImportCsv}
            onExportCsvForDeck={handleExportCsv}
            onBackToStudy={() => setActiveView('study')}
          />
        ) : activeView === 'stats' ? (
          <StatsView
            deck={activeDeckCards}
            stats={stats}
            onBackToStudy={() => setActiveView('study')}
            onOpenProgress={(filter) => {
              setProgressFilter(filter);
              setProgressOpen(true);
            }}
          />
        ) : !currentCard ? (
          <div className="my-auto text-center py-9 px-6 bg-white dark:bg-slate-900 border border-slate-200/80 dark:border-slate-800/80 rounded-3xl shadow-xl shadow-slate-900/[0.06] dark:shadow-black/30">
            <div className="w-14 h-14 bg-emerald-100 dark:bg-emerald-950 text-emerald-600 rounded-2xl flex items-center justify-center mx-auto mb-4">
              <svg className="w-7 h-7" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2.2" d="M5 13l4 4L19 7" />
              </svg>
            </div>
            <h2 className="text-lg font-extrabold tracking-tight mb-1.5 text-balance">
              {activeDeckCards.length === 0
                ? t.emptyDeckTitle
                : stats.dailyReviewedCount >= stats.dailyLimit
                  ? t.dailyDoneTitle
                  : t.queueDoneTitle}
            </h2>
            <p className="text-sm text-slate-500 dark:text-slate-400 mb-5 text-balance">
              {activeDeckCards.length === 0
                ? t.emptyDeckDesc
                : stats.dailyReviewedCount >= stats.dailyLimit
                  ? t.dailyDoneDesc(stats.dailyReviewedCount, stats.dailyLimit)
                  : t.queueDoneDesc(stats.dailyReviewedCount)}
            </p>
            {decks.length === 0 ? (
              <button
                type="button"
                onClick={() => setActiveView('decks')}
                className="w-full py-3.5 bg-gradient-to-r from-blue-600 to-indigo-600 hover:from-blue-700 hover:to-indigo-700 text-white rounded-2xl text-sm font-bold shadow-md shadow-blue-600/20 transition"
              >
                {t.myDecks}
              </button>
            ) : activeDeckCards.length === 0 ? (
              <button
                type="button"
                onClick={() => {
                  setAddCardTargetDeckKey(activeDeckKey);
                  setAddCardOpen(true);
                }}
                className="w-full py-3.5 bg-gradient-to-r from-blue-600 to-indigo-600 hover:from-blue-700 hover:to-indigo-700 text-white rounded-2xl text-sm font-bold shadow-md shadow-blue-600/20 transition"
              >
                {t.addFirstCard}
              </button>
            ) : (
              <button
                type="button"
                onClick={() => rebuildQueue(deck, stats, true)}
                className="w-full py-3.5 bg-gradient-to-r from-blue-600 to-indigo-600 hover:from-blue-700 hover:to-indigo-700 text-white rounded-2xl text-sm font-bold shadow-md shadow-blue-600/20 transition"
              >
                {t.continue20}
              </button>
            )}
          </div>
        ) : (
          <FlashCard
            card={currentCard}
            origLang={activeDeckMeta?.origLang || 'RU'}
            learningLang={activeDeckMeta?.learningLang || 'DE'}
            direction={direction}
            isFlipped={isFlipped}
            onFlip={handleFlip}
            onRate={handleRate}
            onSpeakAll={() => speak(`${currentCard.learning}. ${currentCard.example_learning || ''}`)}
            onSpeakTerm={() => speak(currentCard.learning)}
            onSpeakExample={() => speak(currentCard.example_learning || '')}
          />
        )}
      </main>

      <SettingsModal
        isOpen={settingsOpen}
        onClose={() => setSettingsOpen(false)}
        decks={decks}
        learningLang={activeLearningLang}
        isAuthenticated={Boolean(user)}
        onOpenAuth={() => {
          setSettingsOpen(false);
          setAuthOpen(true);
        }}
        isDark={isDark}
        onToggleTheme={() => setIsDark((d) => !d)}
        voices={voices}
        speechSettings={speechSettings}
        onUpdateSpeech={(next) => {
          setSpeechSettings(next);
          saveSpeechSettings(next);
          if (user) {
            syncProfileToSupabase(user.id, stats, next).catch(() => {});
          }
        }}
        onTestVoice={() => speak(getTestPhraseForLang(activeLearningLang))}
        dailyLimit={stats.dailyLimit}
        maxActiveUnknown={stats.maxActiveUnknown}
        onSaveDailyLimit={(limit) => {
          const nextStats = { ...stats, dailyLimit: limit };
          setStats(nextStats);
          saveLocalDailyStats(user?.id ?? null, nextStats);
          if (user) syncProfileToSupabase(user.id, nextStats).catch(() => {});
          rebuildQueue(deck, nextStats);
          showToast(t.toastDailyLimit(limit));
        }}
        onSaveMaxActiveUnknown={(max) => {
          const nextStats = { ...stats, maxActiveUnknown: max };
          setStats(nextStats);
          saveLocalDailyStats(user?.id ?? null, nextStats);
          rebuildQueue(deck, nextStats);
          showToast(t.toastMaxUnknown(max));
        }}
        customCards={customCards}
        onOpenAddCard={() => {
          setSettingsOpen(false);
          setAddCardTargetDeckKey(activeDeckKey);
          setAddCardOpen(true);
        }}
        onDeleteCustomCard={handleDeleteCustomCard}
        onAddStarterDeck={handleAddStarterDeck}
      />

      <AddCardModal
        isOpen={addCardOpen}
        decks={decks}
        defaultDeckKey={addCardTargetDeckKey}
        onClose={() => setAddCardOpen(false)}
        onAddCard={handleAddCard}
      />

      <AuthModal
        isOpen={authOpen || isPasswordRecovery}
        onClose={() => {
          setAuthOpen(false);
          setIsPasswordRecovery(false);
        }}
        userEmail={user?.email ?? null}
        isPasswordRecovery={isPasswordRecovery}
        onClearPasswordRecovery={() => setIsPasswordRecovery(false)}
        decks={decks}
        totalCards={deck.length}
        customCards={deck.filter((c) => c.isCustom).length}
        dailyReviewedCount={stats.dailyReviewedCount}
        dailyLimit={stats.dailyLimit}
        syncState={syncState}
        onSyncNow={async () => {
          if (user) {
            await runSync(user, deck, decks, stats);
            showToast(t.toastSynced);
          }
        }}
        onSignOut={async () => {
          await supabase.auth.signOut();
          showToast(t.toastSignedOut);
        }}
        onDeleteAccount={async () => {
          if (!user) return;
          const uid = user.id;
          await deleteAccountFromSupabase();
          clearUserLocalData(uid);
          await supabase.auth.signOut({ scope: 'local' }).catch(() => {});
          setAuthOpen(false);
          showToast(t.toastAccountDeleted);
        }}
        onAddStarterDeck={handleAddStarterDeck}
        onToast={showToast}
      />

      <ProgressModal
        isOpen={progressOpen}
        onClose={() => setProgressOpen(false)}
        deck={activeDeckCards}
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
