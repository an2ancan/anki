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

export function speakGermanText(
  rawText: string,
  voice: SpeechSynthesisVoice | null,
  rate: number,
  pitch: number
): void {
  if (typeof window === 'undefined' || !('speechSynthesis' in window)) return;
  window.speechSynthesis.cancel();

  const text = cleanGermanSpeechText(rawText);
  if (!text) return;

  const utterance = new SpeechSynthesisUtterance(text);
  utterance.lang = 'de-DE';
  utterance.rate = rate;
  utterance.pitch = pitch;
  if (voice) utterance.voice = voice;

  window.speechSynthesis.speak(utterance);
}
