# Backend Foundation (Supabase-ready)

This repo includes a starter SQL schema in \/supabase/schema.sql\.

Next backend phases should:
- Convert schema into Supabase migrations
- Add RLS policies (household isolation)
- Add minimal edge functions for:
  - price ingestion (admin-only)
  - recommendation generation (deterministic engine wrapper)

No runtime backend is started by this phase.

