# Database Migration Workflow

## Naming
- supabase/migrations/NNN_slug.sql (NNN matches phase or sequence)

## Rules
- idempotent SQL (create table if not exists, safe alters)
- keep RLS policies in separate migrations
- review in PR before applying to prod

## Environments
- dev: local supabase
- stage: staging project
- prod: production project

