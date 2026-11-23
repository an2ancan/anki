import { createClient } from 'https://esm.sh/@supabase/supabase-js@2';

const CORS_HEADERS = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
  'Access-Control-Allow-Methods': 'POST, OPTIONS',
};

// Strict allowlist of Google Cloud TTS voices covered by the 1M chars/month free tier
const ALLOWED_VOICES = new Set([
  'de-DE-Neural2-C',
  'de-DE-Neural2-B',
  'de-DE-Neural2-F',
  'de-DE-Neural2-D',
  'de-DE-Wavenet-C',
  'de-DE-Wavenet-B',
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
    const voice = String(payload?.voice ?? 'de-DE-Neural2-C');
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
    const semitonePitch = Math.round((pitch - 1.0) * 10 * 10) / 10;
    const googleRes = await fetch(
      `https://texttospeech.googleapis.com/v1/text:synthesize?key=${encodeURIComponent(googleApiKey)}`,
      {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          input: { text },
          voice: { languageCode: 'de-DE', name: voice },
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
