# BudgetCartAI — Canonical Layer Order (Never Skip)

This file is the authoritative, human-readable layer order used for governance.
Atomic phases may exist in large quantity, but must always roll up to one active layer.

## Layers (0..8)

0. Idea Development
1. Product Strategy
2. UX/UI
3. Technical Architecture
4. Backend Foundation
5. Frontend Implementation
6. AI Integration
7. QA / Hardening
8. DevOps + Monitoring

## Rules

- Do not skip layers.
- Do not mutate locked artifacts from completed layers.
- Each completed layer must generate a layer report in /pipeline/layer-reports.
- Keep validation gates green (lint/typecheck/tests).
