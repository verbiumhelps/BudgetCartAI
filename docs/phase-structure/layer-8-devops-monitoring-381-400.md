# Layer 8 — DevOps + Monitoring (381–400)

Repeatable gated releases with observability and final governance lock.

## 381–390: CI + deployment pipeline
- 381 CI gates (install/lint/typecheck/unit/integration/AI eval)
- 382 Artifact strategy (versioned, reproducible, retained)
- 383 Environment separation (dev/staging/prod; config rules)
- 384 Migration deploy rules (failure handling, verification, rollback/forward-only policy)
- 385–390 Governance enforcement (protections, required checks, minimal approvals)

## 391–395: Observability
- 391 Structured logging contract (trace_id, safe ids, event names, no sensitive payload)
- 392 Error tracking (frontend+backend, trace correlation, grouping)
- 393 Metrics (latency, error rates by code, auth failures, forbidden spikes, migration timing)
- 394 Alerts (actionable thresholds, low noise)
- 395 Runbooks (clear steps for common incidents)

## 396–400: Release governance + final lock
- 396 Release checklist (gates green, migrations verified, audit updated, notes prepared)
- 397 Versioning rules (semver/build numbers; changelog requirements)
- 398 Final policy locks (schema/RLS/error taxonomy/AI eval governance)
- 399 Final audit report (scope, risks, mitigations, maturity)
- 400 Acquisition readiness summary (1–2 pages; diligence-ready)