import type { SpeechSettings } from '../types';
import { getCachedAudio, setCachedAudio } from './audioCache';
import { supabase } from './supabase';

export interface GoogleVoiceOption {
  id: string;
  label: string;
}

export const GOOGLE_DE_VOICES: GoogleVoiceOption[] = [
  { id: 'de-DE-Neural2-C', label: '★ Neural2-C (Женский, естественный)' },
  { id: 'de-DE-Neural2-B', label: '★ Neural2-B (Мужской, естественный)' },
  { id: 'de-DE-Neural2-F', label: '★ Neural2-F (Женский, мягкий)' },
  { id: 'de-DE-Neural2-D', label: '★ Neural2-D (Мужской, глубокий)' },
  { id: 'de-DE-Wavenet-C', label: 'WaveNet-C (Женский)' },
  { id: 'de-DE-Wavenet-B', label: 'WaveNet-B (Мужской)' },
];

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

export function rankVoice(v: SpeechSynthesisVoice): number {
  const name = v.name.toLowerCase();
  if (name.includes('natural') || name.includes('neural')) return 100;
  if (name.includes('google deutsch') || name.includes('google')) return 80;
  if (name.includes('anna') || name.includes('katja') || name.includes('petra') || name.includes('markus')) return 70;
  if (name.includes('siri') || name.includes('enhanced') || name.includes('premium')) return 60;
  if (v.lang === 'de-DE') return 50;
  return 10;
}

export function getSortedGermanVoices(): SpeechSynthesisVoice[] {
  if (typeof window === 'undefined' || !('speechSynthesis' in window)) return [];
  const voices = window.speechSynthesis.getVoices();
  if (!voices || voices.length === 0) return [];
  const deVoices = voices.filter((v) => v.lang && (v.lang.startsWith('de') || v.lang.includes('DE')));
  return (deVoices.length > 0 ? deVoices : voices).sort((a, b) => rankVoice(b) - rankVoice(a));
}

export function cleanGermanSpeechText(text: string): string {
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
  voice: SpeechSynthesisVoice | null,
  rate: number,
  pitch: number
): void {
  if (typeof window === 'undefined' || !('speechSynthesis' in window)) return;
  const utterance = new SpeechSynthesisUtterance(text);
  utterance.lang = 'de-DE';
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
  apiKey: string,
  rate: number,
  pitch: number
): Promise<Blob> {
  // Google TTS pitch is in semitones [-20.0, 20.0]; map UI [0.8..1.2] around 0
  const semitonePitch = Math.round((pitch - 1.0) * 10 * 10) / 10;

  const res = await fetch(
    `https://texttospeech.googleapis.com/v1/text:synthesize?key=${encodeURIComponent(apiKey)}`,
    {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({
        input: { text },
        voice: { languageCode: 'de-DE', name: voiceName },
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
    throw new Error(error.message || 'Edge TTS error');
  }
  const audioContent = (data as { audioContent?: string } | null)?.audioContent;
  if (!audioContent) {
    throw new Error('Edge TTS returned empty audio');
  }
  return base64ToBlob(audioContent, 'audio/mpeg');
}

/**
 * Speaks German text using either Google Cloud TTS (via Supabase Edge Function master key
 * or optional personal API key, with IndexedDB cache) or the default browser Web Speech API.
 * Automatically falls back to system voice on error.
 */
export async function speakGermanText(
  rawText: string,
  settings: SpeechSettings,
  systemVoice: SpeechSynthesisVoice | null,
  isAuthenticated: boolean,
  onFallback?: (reason: string) => void
): Promise<void> {
  stopActiveAudio();
  const requestId = activeSpeechRequestId;
  const text = cleanGermanSpeechText(rawText);
  if (!text) return;

  const personalKey = settings.googleApiKey.trim();
  const canUseGoogle = settings.engine === 'google' && (Boolean(personalKey) || isAuthenticated);

  if (canUseGoogle) {
    const cacheKey = `${settings.googleVoiceName}|${settings.rate.toFixed(2)}|${settings.pitch.toFixed(2)}|${text}`;
    try {
      let blob = await getCachedAudio(cacheKey);
      if (requestId !== activeSpeechRequestId) return;
      if (!blob) {
        blob = personalKey
          ? await fetchGoogleTtsBlob(
              text,
              settings.googleVoiceName,
              personalKey,
              settings.rate,
              settings.pitch
            )
          : await fetchEdgeTtsBlob(
              text,
              settings.googleVoiceName,
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
  speakWithSystemVoice(text, systemVoice, settings.rate, settings.pitch);
}
