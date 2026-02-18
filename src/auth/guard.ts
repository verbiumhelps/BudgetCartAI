import { getSession } from './session';

export async function requireSession() {
  const r = await getSession();
  const session = r.data.session;
  if (!session) throw new Error('No active session');
  return session;
}

