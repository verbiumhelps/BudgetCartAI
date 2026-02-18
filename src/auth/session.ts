import { supabaseClient } from '../lib/supabase/client';

export async function getSession() {
  return supabaseClient().auth.getSession();
}

export function onAuth(cb: (event: string) => void) {
  return supabaseClient().auth.onAuthStateChange((event) => cb(event));
}

