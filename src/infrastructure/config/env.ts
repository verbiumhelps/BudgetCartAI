export type Env = {
  SUPABASE_URL: string;
  SUPABASE_ANON_KEY: string;
};

function requireNonEmpty(name: string, value: string | undefined): string {
  if (!value || value.trim().length === 0) {
    throw new Error(`Missing required env var: ${name}`);
  }
  return value;
}

/**
 * Single source of truth for runtime configuration.
 */
export function getEnv(): Env {
  const url =
    (globalThis as any)?.process?.env?.EXPO_PUBLIC_SUPABASE_URL ??
    (globalThis as any)?.process?.env?.SUPABASE_URL;

  const anonKey =
    (globalThis as any)?.process?.env?.EXPO_PUBLIC_SUPABASE_ANON_KEY ??
    (globalThis as any)?.process?.env?.SUPABASE_ANON_KEY;

  return {
    SUPABASE_URL: requireNonEmpty(
      "SUPABASE_URL (or EXPO_PUBLIC_SUPABASE_URL)",
      url
    ),
    SUPABASE_ANON_KEY: requireNonEmpty(
      "SUPABASE_ANON_KEY (or EXPO_PUBLIC_SUPABASE_ANON_KEY)",
      anonKey
    ),
  };
}
