# BudgetCartAI — Phase Structure (150–400)

This folder contains the detailed, production-grade phase breakdown for Layers 4–8.

## Files
- **Layer 4 — Backend Foundation (150–240):** `layer-4-backend-foundation-150-240.md`
- **Layer 5 — Frontend Implementation (241–320):** `layer-5-frontend-implementation-241-320.md`
- **Layer 6 — AI Integration (321–350):** `layer-6-ai-integration-321-350.md`
- **Layer 7 — QA / Hardening (351–380):** `layer-7-qa-hardening-351-380.md`
- **Layer 8 — DevOps + Monitoring (381–400):** `layer-8-devops-monitoring-381-400.md`

## Aggregate
- **All Layers (150–400):** `phases-150-400-complete.md`

## Operating Rules (locked)
- Each phase is atomic, idempotent, and gate-checked.
- “No placeholders” policy: tasks specify concrete deliverables and acceptance criteria.
- Schema/security/observability items must be enforced structurally (constraints, RLS, CI gates), not by convention.