import { supabaseClient } from '../lib/supabase/client';

export async function signUp(email: string, password: string) {
  return supabaseClient().auth.signUp({ email, password });
}

export async function signIn(email: string, password: string) {
  return supabaseClient().auth.signInWithPassword({ email, password });
}

