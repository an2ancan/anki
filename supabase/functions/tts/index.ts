import { createClient } from 'https://esm.sh/@supabase/supabase-js@2';

const CORS_HEADERS = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
  'Access-Control-Allow-Methods': 'POST, OPTIONS',
};

// Strict allowlist of active Google Cloud TTS voices covered by the free tier
const ALLOWED_VOICES = new Set([
  // German (active + legacy fallback)
  'de-DE-Neural2-G',
  'de-DE-Neural2-H',
  'de-DE-Wavenet-G',
  'de-DE-Wavenet-H',
  'de-DE-Wavenet-C',
  'de-DE-Wavenet-B',
  // English
  'en-US-Neural2-C',
  'en-US-Neural2-D',
  'en-US-Neural2-F',
  'en-GB-Neural2-A',
  'en-GB-Neural2-B',
  'en-US-Wavenet-C',
  // French (active F/G models)
  'fr-FR-Neural2-F',
  'fr-FR-Neural2-G',
  'fr-FR-Wavenet-F',
  'fr-FR-Wavenet-G',
  'fr-FR-Standard-F',
  'fr-FR-Standard-G',
  // Russian
  'ru-RU-Wavenet-C',
  'ru-RU-Wavenet-B',
  'ru-RU-Wavenet-A',
  'ru-RU-Wavenet-D',
  // Spanish & Italian (active models)
  'es-ES-Neural2-E',
  'es-ES-Neural2-F',
  'es-ES-Neural2-G',
  'it-IT-Neural2-E',
  'it-IT-Neural2-F',
]);

const MAX_TEXT_LENGTH = 300;

function jsonResponse(body: unknown, status = 200): Response {
  return new Response(JSON.stringify(body), {
    status,
    headers: { ...CORS_HEADERS, 'Content-Type': 'application/json' },
  });
}

Deno.serve(async (req: Request) => {
  if (req.method === 'OPTIONS') {
    return new Response('ok', { headers: CORS_HEADERS });
  }
  if (req.method !== 'POST') {
    return jsonResponse({ error: 'Method not allowed' }, 405);
  }

  try {
    // 1. Verify authenticated Supabase user
    const authHeader = req.headers.get('Authorization');
    if (!authHeader) {
      return jsonResponse({ error: 'Missing Authorization header' }, 401);
    }

    const supabaseUrl = Deno.env.get('SUPABASE_URL') ?? '';
    const supabaseAnonKey = Deno.env.get('SUPABASE_ANON_KEY') ?? '';
    const userClient = createClient(supabaseUrl, supabaseAnonKey, {
      global: { headers: { Authorization: authHeader } },
    });

    const {
      data: { user },
      error: authError,
    } = await userClient.auth.getUser();

    if (authError || !user) {
      return jsonResponse({ error: 'Unauthorized' }, 401);
    }

    // 2. Read master Google TTS API key from Supabase Secrets
    const googleApiKey = Deno.env.get('GOOGLE_TTS_API_KEY');
    if (!googleApiKey) {
      return jsonResponse({ error: 'GOOGLE_TTS_API_KEY secret is not configured' }, 500);
    }

    // 3. Validate request payload
    const payload = await req.json();
    const text = String(payload?.text ?? '').trim();
    const voice = String(payload?.voice ?? 'de-DE-Neural2-G');
    const rate = Math.min(1.2, Math.max(0.7, Number(payload?.rate) || 0.92));
    const pitch = Math.min(1.2, Math.max(0.8, Number(payload?.pitch) || 1.0));

    if (!text) {
      return jsonResponse({ error: 'Text is required' }, 400);
    }
    if (text.length > MAX_TEXT_LENGTH) {
      return jsonResponse({ error: `Text exceeds ${MAX_TEXT_LENGTH} characters` }, 400);
    }
    if (!ALLOWED_VOICES.has(voice)) {
      return jsonResponse({ error: 'Voice is not in the allowed free-tier list' }, 400);
    }

    // 4. Synthesize speech via Google Cloud TTS
    const languageCode = voice.split('-').slice(0, 2).join('-') || 'de-DE';
    const semitonePitch = Math.round((pitch - 1.0) * 10 * 10) / 10;
    const googleRes = await fetch(
      `https://texttospeech.googleapis.com/v1/text:synthesize?key=${encodeURIComponent(googleApiKey)}`,
      {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          input: { text },
          voice: { languageCode, name: voice },
          audioConfig: {
            audioEncoding: 'MP3',
            speakingRate: rate,
            pitch: semitonePitch,
          },
        }),
      }
    );

    if (!googleRes.ok) {
      const errBody = await googleRes.text().catch(() => '');
      return jsonResponse(
        { error: `Google TTS error (${googleRes.status}): ${errBody.slice(0, 150)}` },
        502
      );
    }

    const data = (await googleRes.json()) as { audioContent?: string };
    if (!data.audioContent) {
      return jsonResponse({ error: 'Empty audio returned by Google TTS' }, 502);
    }

    return jsonResponse({ audioContent: data.audioContent }, 200);
  } catch (err) {
    return jsonResponse(
      { error: err instanceof Error ? err.message : 'Unexpected server error' },
      500
    );
  }
});
