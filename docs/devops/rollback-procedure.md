# Migration Guardrails + Rollback

## Guardrails
- migrations are idempotent
- RLS changes are isolated per migration
- staged rollout (dev -> stage -> prod)

## Rollback
- prefer forward-fix migrations
- keep a rollback SQL for destructive changes
- verify with smoke queries before/after

