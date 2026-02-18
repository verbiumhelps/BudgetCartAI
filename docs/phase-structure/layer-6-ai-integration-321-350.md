# Layer 6 — AI Integration (321–350)

Lean AI, high impact: deterministic substitution and conservative savings projections, backed by an evaluation harness.

## 321–335: Deterministic substitution engine
- 321 Substitution spec (inputs/outputs, ranking fields, reason codes)
- 322 Deterministic similarity signals (category/attributes/dietary/tier; fixed weights and tie-breakers)
- 323 Pricing integration + unit normalization (cents-based, missing price rules)
- 324 Ranking + reason codes (fixed code set + structured explanations)
- 325 UI integration (intent-driven reveal; top 1–3; minimal footprint)
- 326–335 Hardening (no results, missing prices, deterministic ties, integration tests)

## 336–345: Savings projection modeling
- 336 Definition (applied-substitution savings as primary; optional what-if clearly labeled)
- 337 Baseline model (cents-based deltas; structured line-item breakdown)
- 338 Guardrails (insufficient data => not available; caps to avoid spikes; explicit reasons)
- 339 UI display rules (Estimated label, explain basis, drill-in)
- 340–345 Golden validation cases (mixed units, partial prices, applied vs what-if)

## 346–350: Evaluation harness
- 346 Golden dataset (items, store prices, expected substitutions and savings)
- 347 Eval runner in CI (strict compare; explicit update workflow)
- 348 Metrics output (top-1/top-3, diff counts, stability)
- 349–350 Golden update governance (reviewable diffs, documented process)