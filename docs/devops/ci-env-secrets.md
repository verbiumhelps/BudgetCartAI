# CI Env + Secrets

## Required env (build/test)
- EXPO_PUBLIC_SUPABASE_URL
- EXPO_PUBLIC_SUPABASE_ANON_KEY

## Policy
- Never commit .env
- Use CI secret store
- Validate env at startup (fail fast)

## Next
- Add workflow step that asserts env vars exist before lint/typecheck/test.

