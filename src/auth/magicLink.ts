import { supabaseClient } from '../lib/supabase/client';

export async function sendMagicLink(email: string, redirectTo?: string) {
  return supabaseClient().auth.signInWithOtp({
    email,
    options: redirectTo ? { emailRedirectTo: redirectTo } : undefined,
  });
}

