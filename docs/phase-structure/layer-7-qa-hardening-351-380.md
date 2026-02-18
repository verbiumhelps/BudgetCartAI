# Layer 7 — QA / Hardening (351–380)

Stability proof layer: security guarantees, performance baselines, and failure mode modeling.

## 351–365: Security + cross-household denial
- 351 Cross-household scenario suite (DB RLS + API + UI forbidden handling)
- 352 Permission matrix tests (owner/admin/member allow/deny enforced)
- 353 Abuse cases (ID guessing, payload tamper, replay, no existence leaks)
- 354–365 Fixes + regression locks (every fix gets a test)

## 366–372: Performance baseline
- 366 Critical paths (Budget load, Pantry load, Add transaction, Transaction detail)
- 367 Baseline capture (TTFD, call counts, worst query timings)
- 368 Bottleneck fixes (indexes, N+1, payload size)
- 369–372 CI regression guards (non-flaky gross regression thresholds)

## 373–380: Failure mode modeling
- 373 Failure catalog (offline, timeout, 429, partial outage, invalid session, corrupted cache)
- 374 UI handling rules (retry/fallback, safe copy, re-auth triggers, trace capture)
- 375 Deterministic failure simulation tests
- 376–380 Final stability pass (remove flake, deterministic startup)