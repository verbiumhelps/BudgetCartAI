import { supabaseClient } from '../lib/supabase/client';

export async function requestPasswordReset(email: string, redirectTo?: string) {
  return supabaseClient().auth.resetPasswordForEmail(email, redirectTo ? { redirectTo } : undefined);
}

export async function updatePassword(newPassword: string) {
  return supabaseClient().auth.updateUser({ password: newPassword });
}

// Deep link handling will be wired in navigation layer (Expo Router).

