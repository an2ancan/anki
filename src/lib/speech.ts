import type { SpeechSettings } from '../types';
import { getCachedAudio, setCachedAudio } from './audioCache';
import { supabase } from './supabase';

export interface GoogleVoiceOption {
  id: string;
  label: string;
}

export const GOOGLE_VOICES_BY_LANG: Record<string, GoogleVoiceOption[]> = {
  DE: [
    { id: 'de-DE-Neural2-G', label: '★ Neural2-G (Женский, естественный)' },
    { id: 'de-DE-Neural2-H', label: '★ Neural2-H (Мужской, естественный)' },
    { id: 'de-DE-Wavenet-G', label: 'WaveNet-G (Женский)' },
    { id: 'de-DE-Wavenet-H', label: 'WaveNet-H (Мужской)' },
  ],
  EN: [
    { id: 'en-US-Neural2-C', label: '★ US Neural2-C (Female, natural)' },
    { id: 'en-US-Neural2-D', label: '★ US Neural2-D (Male, natural)' },
    { id: 'en-US-Neural2-F', label: '★ US Neural2-F (Female, warm)' },
    { id: 'en-GB-Neural2-A', label: '★ UK Neural2-A (Female, British)' },
    { id: 'en-GB-Neural2-B', label: '★ UK Neural2-B (Male, British)' },
    { id: 'en-US-Wavenet-C', label: 'US WaveNet-C (Female)' },
  ],
  FR: [
    { id: 'fr-FR-Neural2-F', label: '★ FR Neural2-F (Féminin, naturel)' },
    { id: 'fr-FR-Neural2-G', label: '★ FR Neural2-G (Masculin, naturel)' },
    { id: 'fr-FR-Wavenet-F', label: 'FR WaveNet-F (Féminin)' },
    { id: 'fr-FR-Wavenet-G', label: 'FR WaveNet-G (Masculin)' },
    { id: 'fr-FR-Standard-F', label: 'FR Standard-F (Féminin)' },
    { id: 'fr-FR-Standard-G', label: 'FR Standard-G (Masculin)' },
  ],
  RU: [
    { id: 'ru-RU-Wavenet-C', label: '★ RU WaveNet-C (Женский)' },
    { id: 'ru-RU-Wavenet-B', label: '★ RU WaveNet-B (Мужской)' },
    { id: 'ru-RU-Wavenet-A', label: 'RU WaveNet-A (Женский, мягкий)' },
    { id: 'ru-RU-Wavenet-D', label: 'RU WaveNet-D (Мужской, глубокий)' },
  ],
  ES: [
    { id: 'es-ES-Neural2-E', label: '★ ES Neural2-E (Femenino)' },
    { id: 'es-ES-Neural2-F', label: '★ ES Neural2-F (Masculino)' },
    { id: 'es-ES-Neural2-G', label: 'ES Neural2-G (Masculino)' },
  ],
  IT: [
    { id: 'it-IT-Neural2-E', label: '★ IT Neural2-E (Femminile)' },
    { id: 'it-IT-Neural2-F', label: '★ IT Neural2-F (Maschile)' },
  ],
};

export const GOOGLE_DE_VOICES = GOOGLE_VOICES_BY_LANG.DE;

const LANG_TO_BCP47: Record<string, string> = {
  DE: 'de-DE',
  EN: 'en-US',
  FR: 'fr-FR',
  RU: 'ru-RU',
  ES: 'es-ES',
  IT: 'it-IT',
  PT: 'pt-PT',
  PL: 'pl-PL',
  NL: 'nl-NL',
  JA: 'ja-JP',
  KO: 'ko-KR',
  ZH: 'zh-CN',
};

const TEST_PHRASES_BY_LANG: Record<string, string> = {
  DE: 'Guten Tag! Ich spreche Deutsch flüssig und natürlich.',
  EN: 'Hello! I speak English clearly and naturally.',
  FR: 'Bonjour ! Je parle français couramment et naturellement.',
  RU: 'Добрый день! Я говорю по-русски чисто и естественно.',
  ES: '¡Hola! Hablo español con fluidez y naturalidad.',
  IT: 'Buongiorno! Parlo italiano in modo fluente e naturale.',
};

export function getBcp47ForLang(langCode: string): string {
  const key = String(langCode || 'DE').trim().toUpperCase().slice(0, 2);
  return LANG_TO_BCP47[key] || `${key.toLowerCase()}-${key}`;
}

export function getGoogleVoicesForLang(langCode: string): GoogleVoiceOption[] {
  const key = String(langCode || 'DE').trim().toUpperCase().slice(0, 2);
  return GOOGLE_VOICES_BY_LANG[key] || GOOGLE_VOICES_BY_LANG.EN;
}

export function resolveGoogleVoiceForLang(preferredVoice: string, langCode: string): string {
  const options = getGoogleVoicesForLang(langCode);
  if (options.some((o) => o.id === preferredVoice)) {
    return preferredVoice;
  }
  return options[0].id;
}

export function getTestPhraseForLang(langCode: string): string {
  const key = String(langCode || 'DE').trim().toUpperCase().slice(0, 2);
  return TEST_PHRASES_BY_LANG[key] || TEST_PHRASES_BY_LANG.EN;
}

function getLanguageCodeFromVoice(voiceName: string, fallbackLang: string): string {
  const parts = voiceName.split('-');
  if (parts.length >= 2 && parts[0].length === 2 && parts[1].length === 2) {
    return `${parts[0]}-${parts[1]}`;
  }
  return getBcp47ForLang(fallbackLang);
}

let activeAudioEl: HTMLAudioElement | null = null;
let activeAudioUrl: string | null = null;
let activeSpeechRequestId = 0;

export function stopActiveAudio(): void {
  activeSpeechRequestId++;
  if (typeof window !== 'undefined' && 'speechSynthesis' in window) {
    window.speechSynthesis.cancel();
  }
  if (activeAudioEl) {
    activeAudioEl.pause();
    activeAudioEl = null;
  }
  if (activeAudioUrl) {
    URL.revokeObjectURL(activeAudioUrl);
    activeAudioUrl = null;
  }
}

export function rankVoice(v: SpeechSynthesisVoice, targetBcp47 = 'de-DE'): number {
  const name = v.name.toLowerCase();
  if (name.includes('natural') || name.includes('neural')) return 100;
  if (name.includes('google')) return 80;
  if (name.includes('siri') || name.includes('enhanced') || name.includes('premium')) return 65;
  if (v.lang.toLowerCase() === targetBcp47.toLowerCase()) return 50;
  return 10;
}

export function getSortedVoicesForLang(langCode: string): SpeechSynthesisVoice[] {
  if (typeof window === 'undefined' || !('speechSynthesis' in window)) return [];
  const voices = window.speechSynthesis.getVoices();
  if (!voices || voices.length === 0) return [];
  const bcp47 = getBcp47ForLang(langCode);
  const shortPrefix = bcp47.slice(0, 2).toLowerCase();
  const matched = voices.filter(
    (v) => v.lang && v.lang.toLowerCase().startsWith(shortPrefix)
  );
  return (matched.length > 0 ? matched : voices).sort(
    (a, b) => rankVoice(b, bcp47) - rankVoice(a, bcp47)
  );
}

export function cleanSpeechText(text: string): string {
  if (!text) return '';
  return text
    .replace(/\([^)]*\)/g, '')
    .replace(/\+ (Dat\.|Akk\.|Gen\.)/gi, '')
    .replace(/Grammatik:?/gi, '')
    .replace(/\s+/g, ' ')
    .trim();
}

export function speakWithSystemVoice(
  text: string,
  langCode: string,
  voice: SpeechSynthesisVoice | null,
  rate: number,
  pitch: number
): void {
  if (typeof window === 'undefined' || !('speechSynthesis' in window)) return;
  const utterance = new SpeechSynthesisUtterance(text);
  utterance.lang = voice?.lang || getBcp47ForLang(langCode);
  utterance.rate = rate;
  utterance.pitch = pitch;
  if (voice) utterance.voice = voice;
  window.speechSynthesis.speak(utterance);
}

function base64ToBlob(base64: string, mimeType = 'audio/mpeg'): Blob {
  const binary = atob(base64);
  const bytes = new Uint8Array(binary.length);
  for (let i = 0; i < binary.length; i++) {
    bytes[i] = binary.charCodeAt(i);
  }
  return new Blob([bytes], { type: mimeType });
}

async function fetchGoogleTtsBlob(
  text: string,
  voiceName: string,
  languageCode: string,
  apiKey: string,
  rate: number,
  pitch: number
): Promise<Blob> {
  const semitonePitch = Math.round((pitch - 1.0) * 10 * 10) / 10;

  const res = await fetch(
    `https://texttospeech.googleapis.com/v1/text:synthesize?key=${encodeURIComponent(apiKey)}`,
    {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({
        input: { text },
        voice: { languageCode, name: voiceName },
        audioConfig: {
          audioEncoding: 'MP3',
          speakingRate: rate,
          pitch: semitonePitch,
        },
      }),
    }
  );

  if (!res.ok) {
    const errText = await res.text().catch(() => '');
    throw new Error(`Google TTS ${res.status}: ${errText.slice(0, 120)}`);
  }

  const data = (await res.json()) as { audioContent?: string };
  if (!data.audioContent) {
    throw new Error('Google TTS returned empty audio');
  }
  return base64ToBlob(data.audioContent, 'audio/mpeg');
}

function playBlob(blob: Blob): Promise<void> {
  return new Promise((resolve, reject) => {
    const url = URL.createObjectURL(blob);
    const audio = new Audio(url);
    activeAudioUrl = url;
    activeAudioEl = audio;
    audio.onended = () => {
      if (activeAudioUrl === url) {
        URL.revokeObjectURL(url);
        activeAudioUrl = null;
        activeAudioEl = null;
      }
      resolve();
    };
    audio.onerror = () => {
      if (activeAudioUrl === url) {
        URL.revokeObjectURL(url);
        activeAudioUrl = null;
        activeAudioEl = null;
      }
      reject(new Error('Audio playback failed'));
    };
    audio.play().catch(reject);
  });
}

async function fetchEdgeTtsBlob(
  text: string,
  voiceName: string,
  rate: number,
  pitch: number
): Promise<Blob> {
  const { data, error } = await supabase.functions.invoke('bright-action', {
    body: { text, voice: voiceName, rate, pitch },
  });
  if (error) {
    let detail = error.message || 'Edge TTS error';
    const ctx = (error as { context?: Response }).context;
    if (ctx && typeof ctx.text === 'function') {
      try {
        const bodyText = await ctx.clone().text();
        if (bodyText) {
          try {
            const parsed = JSON.parse(bodyText) as { error?: string; message?: string };
            detail = parsed.error || parsed.message || bodyText.slice(0, 140);
          } catch {
            detail = bodyText.slice(0, 140);
          }
        }
      } catch {
        // ignore body read error
      }
    }
    throw new Error(detail);
  }
  const audioContent = (data as { audioContent?: string } | null)?.audioContent;
  if (!audioContent) {
    throw new Error('Edge TTS returned empty audio');
  }
  return base64ToBlob(audioContent, 'audio/mpeg');
}

/**
 * Speaks text in the active deck's learning language using either Google Cloud TTS
 * (via Supabase Edge Function master key or optional personal API key, with IndexedDB cache)
 * or the browser Web Speech API. Automatically falls back to system voice on error.
 */
export async function speakText(
  rawText: string,
  langCode: string,
  settings: SpeechSettings,
  systemVoice: SpeechSynthesisVoice | null,
  isAuthenticated: boolean,
  onFallback?: (reason: string) => void
): Promise<void> {
  stopActiveAudio();
  const requestId = activeSpeechRequestId;
  const text = cleanSpeechText(rawText);
  if (!text) return;

  const resolvedGoogleVoice = resolveGoogleVoiceForLang(settings.googleVoiceName, langCode);
  const languageCode = getLanguageCodeFromVoice(resolvedGoogleVoice, langCode);

  const personalKey = settings.googleApiKey.trim();
  const canUseGoogle = settings.engine === 'google' && (Boolean(personalKey) || isAuthenticated);

  if (canUseGoogle) {
    const cacheKey = `${resolvedGoogleVoice}|${settings.rate.toFixed(2)}|${settings.pitch.toFixed(2)}|${text}`;
    try {
      let blob = await getCachedAudio(cacheKey);
      if (requestId !== activeSpeechRequestId) return;
      if (!blob) {
        blob = personalKey
          ? await fetchGoogleTtsBlob(
              text,
              resolvedGoogleVoice,
              languageCode,
              personalKey,
              settings.rate,
              settings.pitch
            )
          : await fetchEdgeTtsBlob(
              text,
              resolvedGoogleVoice,
              settings.rate,
              settings.pitch
            );
        await setCachedAudio(cacheKey, blob);
      }
      if (requestId !== activeSpeechRequestId) return;
      await playBlob(blob);
      return;
    } catch (err) {
      if (requestId !== activeSpeechRequestId) return;
      console.warn('Google TTS failed, falling back to system voice:', err);
      onFallback?.(err instanceof Error ? err.message : 'Google TTS недоступен');
    }
  }

  if (requestId !== activeSpeechRequestId) return;
  speakWithSystemVoice(text, langCode, systemVoice, settings.rate, settings.pitch);
}
