# BudgetCartAI — Phases 150–400 (Complete)

This document aggregates the detailed phase breakdown for Layers 4–8.

---
# Layer 4 — Backend Foundation (150–240)

This layer locks the backend into a production-grade foundation: canonical schema, strict RLS enforcement, integration harness, repository hardening, and a stable error taxonomy.

---

## 150–170: Canonical schema lock

**Goal:** Freeze a production-grade relational core so everything above it stays stable.

### 150 — Domain model freeze + naming conventions
**Scope**
- Lock canonical entity names, PK/FK patterns, timestamps, soft-delete strategy, and household propagation rule.
- Commit to:
  - UUID primary keys everywhere.
  - `created_at`, `updated_at` as server-generated timestamps; optional `deleted_at` for soft-delete where relevant.
  - Household propagation rule: every household-scoped table carries `household_id`.
  - Money stored as integer cents; default currency USD.
- Document canonical naming (snake_case), constraint naming, and migration conventions.

**Deliverables**
- `/docs/backend/schema-conventions.md`
- `/docs/backend/domain-entities.md`

**Acceptance Criteria**
- Every table follows the same PK/FK/timestamp conventions.
- Household scoping rule is explicit and consistently applied.

---

### 151 — Canonical tables v1 (minimum viable core)
**Scope**
Create and lock these tables with complete columns/types/constraints (no TODOs):

- `profiles` (1:1 with auth user id)
- `households`
- `household_members` (role, status, join metadata)
- `stores` (SoCal chain definitions; extendable)
- `items` (canonical items catalog)
- `store_items` (store-specific representation + pricing + pack sizes)
- `weekly_budgets`
- `transactions` (receipts/purchases; household-scoped)
- `transaction_lines` (line items referencing items/store_items)
- `pantry_items` (household inventory)

**Required constraints**
- Unique constraints for stable “natural keys”:
  - Weekly budgets: `(household_id, week_start)`
  - Household members: `(household_id, user_id)`
  - Store items: `(store_id, item_id)` or `(store_id, store_sku)` depending on your catalog strategy
- Foreign keys on all relations, with explicit on-delete behavior.
- CHECK constraints for:
  - money cents >= 0
  - quantity >= 0
  - valid roles/status enums
  - week boundaries (week_start aligns to chosen start-of-week)
- Not-null constraints on required columns.
- Deterministic defaults (server timestamps, default values).

**Deliverables**
- Deterministic migrations committed in proper order.
- A schema dump or inspection step that verifies migrations fully describe the schema.

**Acceptance Criteria**
- Schema supports these read/write behaviors without hacks:
  - Create household and membership
  - Create weekly budget and compute summaries
  - Add transactions with optional line items
  - Track pantry items with quantity and optional expiry

---

### 152 — Enums + constraint hardening
**Scope**
- Convert “business invariants” into DB-enforced constraints.
- Examples (adapt to your final fields):
  - `household_members.role IN ('owner','admin','member')`
  - `transactions.status IN ('draft','posted','void')`
  - `pantry_items.unit IN ('each','g','kg','oz','lb','ml','l','cup','tbsp','tsp')`
- Ensure constraints are applied consistently across all relevant tables.

**Deliverables**
- Migration adding enum types (or CHECK constraints) and required validations.
- `/docs/backend/invariants.md` listing every invariant and where it is enforced.

**Acceptance Criteria**
- Invalid state cannot be inserted even if application code is buggy.

---

### 153 — Canonical views for read patterns
**Scope**
Create stable read-optimized views for frontend/API read patterns:

- `v_household_member_summary`
- `v_weekly_budget_summary` (planned vs actual)
- `v_pantry_summary` (counts + expiring soon)
- `v_store_item_latest_price`

**Deliverables**
- Migration that creates/updates views.
- `/docs/backend/views.md` describing each view, columns, and intended usage.

**Acceptance Criteria**
- Frontend budget and pantry screens can be powered by canonical views without custom client-side math.

---

### 154 — Seed strategy
**Scope**
- Deterministic seed for dev/test:
  - SoCal stores list (name, slug, region, and a brand-key field if you map to assets)
  - Minimal item catalog to support early screens and substitution tests later
- Seed must be repeatable and safe to re-run.

**Deliverables**
- Seed SQL/scripts
- `/docs/backend/seeding.md`

**Acceptance Criteria**
- Fresh database can be seeded consistently and produce the same baseline dataset.

---

### 155 — Index plan v1 (real, query-driven)
**Scope**
Add indexes justified by known query patterns:

- Household scoping indexes:
  - `(household_id, created_at DESC)` on major household tables
- Membership:
  - `(household_id, user_id)` unique
  - `(user_id)` for listing memberships
- Weekly budgets:
  - `(household_id, week_start)` unique
- Pantry:
  - `(household_id, expires_on)` plus partial index for `expires_on IS NOT NULL`
- Transactions:
  - `(household_id, purchased_at DESC)` (or `created_at` if that’s your canonical sort)

**Deliverables**
- Migration adding indexes
- `/docs/backend/indexing.md` with:
  - index → query pattern → justification

**Acceptance Criteria**
- Explain plans for critical reads show index usage (no obvious sequential scans on household-wide queries).

---

### 156 — Audit + metadata
**Scope**
- Add author tracking where it matters: `created_by`, `updated_by` (UUID auth user id).
- Decide whether to stamp via:
  - triggers, or
  - application-layer stamping
- Lock one approach and document it.

**Deliverables**
- Migration updates
- `/docs/backend/audit-fields.md`

**Acceptance Criteria**
- Writes are attributable without relying on fragile client data.

---

### 157 — “No breaking changes” schema contract
**Scope**
- Establish a rule: after schema lock, changes must be additive by default.
- Breaking changes require explicit migration strategy + phase gating.

**Deliverables**
- `/docs/backend/schema-contract.md`

**Acceptance Criteria**
- Team (and CI) has a single source of truth for schema evolution rules.

---

### 158–170 — Consolidation + drift prevention
**Scope**
- Add CI checks:
  - migrations are ordered and deterministic
  - no retroactive edits to old migrations
  - optional schema snapshot matches current migration output
- Add guard scripts that fail fast and print actionable errors.

**Deliverables**
- `scripts/check-migrations.*` (or equivalent)
- `/docs/backend/ci-drift-prevention.md`

**Acceptance Criteria**
- Any schema drift fails CI deterministically before merge.

---

## 171–190: RLS + policy enforcement

**Goal:** Make cross-household access structurally impossible from the client role, even if the API is buggy.

### 171 — RLS baseline: deny by default
**Scope**
- Enable RLS on every household-scoped table.
- Revoke broad grants.
- Grant access only through defined roles and policies.

**Deliverables**
- Migration enabling RLS across all household tables
- `/docs/backend/rls-baseline.md`

**Acceptance Criteria**
- Without a policy, reads/writes are denied (default-deny posture).

---

### 172 — Household membership authority function
**Scope**
- Create canonical function used by all RLS policies:
  - `is_household_member(user_id, household_id) -> boolean`
- If SECURITY DEFINER is used, justify and document the threat model and mitigation.

**Deliverables**
- Migration creating function(s)
- `/docs/backend/rls-functions.md`

**Acceptance Criteria**
- All policies depend on one centralized membership check, not copied SQL fragments.

---

### 173 — SELECT policies
**Scope**
- Every household table has a SELECT policy:
  - users can read rows only where they are a household member
- Public tables (like `stores`, `items`) require explicit read policy (public or authenticated), not implied access.

**Deliverables**
- Migration with SELECT policies
- `/docs/backend/rls-select.md`

**Acceptance Criteria**
- Attempted cross-household SELECT returns zero rows or forbidden (depending on access mode), consistently.

---

### 174 — INSERT policies (prevent household_id forgery)
**Scope**
- Insert allowed only if user is a member of the referenced household.
- Enforce `created_by` stamping rule where applicable.

**Deliverables**
- Migration with INSERT policies
- `/docs/backend/rls-insert.md`

**Acceptance Criteria**
- A user cannot insert rows into a household they do not belong to, even by forging `household_id`.

---

### 175 — UPDATE policies (role-aware)
**Scope**
- Update allowed only if member and (where required) role is sufficient:
  - membership edits owner/admin-only
  - budget edits might be owner/admin-only
  - pantry edits typically member+
- Define role thresholds per table.

**Deliverables**
- Migration with UPDATE policies
- `/docs/backend/rls-update.md`

**Acceptance Criteria**
- Role-limited operations are enforced at the database level.

---

### 176 — DELETE / soft-delete policies
**Scope**
- Decide deletion strategy:
  - true deletes only for restricted cases (drafts, admin operations), or
  - soft-delete for user-facing records
- Enforce via policies + constraints.

**Deliverables**
- Migration + `/docs/backend/rls-delete.md`

**Acceptance Criteria**
- Deletion behavior is consistent and cannot be bypassed.

---

### 177 — Membership management hard rules (anti-escalation)
**Scope**
- Prevent privilege escalation:
  - only owners can create/promote owners
  - cannot remove the last owner
  - cannot edit memberships across households
- Enforce with a combination of policies, functions, and constraints.

**Deliverables**
- Migration(s) implementing anti-escalation rules
- `/docs/backend/membership-security.md`

**Acceptance Criteria**
- Escalation and “last owner removal” are prevented structurally.

---

### 178 — Service role boundaries
**Scope**
- Explicitly document:
  - what client role can do
  - what service role can do
  - which operations are server-only
- Keep service role usage minimal and auditable.

**Deliverables**
- `/docs/backend/roles-and-trust.md`

**Acceptance Criteria**
- No production client code requires service role privileges.

---

### 179–190 — Proof: policy tests + coverage map
**Scope**
- Create RLS coverage document mapping:
  - table → policies for select/insert/update/delete → function deps
- Add automated check failing if:
  - a household table lacks RLS
  - any policy type is missing

**Deliverables**
- `/docs/backend/rls-coverage.md`
- Automated “RLS coverage” test in CI

**Acceptance Criteria**
- CI fails deterministically if a household table is missing RLS/policy coverage.

---

## 191–210: Integration test harness

**Goal:** End-to-end database verification (schema + RLS + invariants) that runs locally and in CI.

### 191 — Test database lifecycle
**Scope**
- Deterministic lifecycle:
  - start/reset DB
  - apply migrations
  - seed baseline
  - run integration tests

**Deliverables**
- `scripts/test-db.*`
- `/docs/backend/testing.md` with exact commands

**Acceptance Criteria**
- One documented command runs full DB integration suite.

---

### 192 — Test fixtures
**Scope**
- Canonical fixtures for tests:
  - two households (A/B)
  - users (userA/userB/admin)
  - roles (owner/admin/member)
  - baseline store/items/store_items

**Deliverables**
- fixture builder utilities (deterministic)
- fixture IDs stable across runs

**Acceptance Criteria**
- Tests do not rely on fragile “random” IDs; fixtures are predictable.

---

### 193 — RLS denial tests (read)
**Scope**
- Verify userA cannot read householdB rows across all household tables, including:
  - transactions, transaction_lines
  - pantry_items
  - weekly_budgets
  - household_members

**Deliverables**
- integration tests asserting denial/empty results

**Acceptance Criteria**
- Cross-household reads are consistently denied for every household table.

---

### 194 — RLS denial tests (write)
**Scope**
- Verify cross-household insert/update/delete are blocked.
- Verify `household_id` cannot be forged.

**Deliverables**
- tests covering write attempts with explicit expected failures

**Acceptance Criteria**
- Cross-household writes fail deterministically.

---

### 195 — Role-based policy tests
**Scope**
- Verify owner/admin-only operations:
  - membership changes
  - budget locking/closing if implemented
- Verify member-only restrictions.

**Deliverables**
- role matrix tests with explicit allow/deny table

**Acceptance Criteria**
- Role rules are enforced at DB level and proven in tests.

---

### 196 — Invariant tests
**Scope**
- Confirm constraints reject invalid data:
  - negative cents
  - invalid enums
  - orphaned FKs
  - invalid week boundaries

**Deliverables**
- tests that assert DB rejects invalid inserts/updates

**Acceptance Criteria**
- Invalid states cannot persist in DB.

---

### 197 — View correctness tests
**Scope**
- Validate views return correct aggregates:
  - weekly budget totals
  - pantry summaries
  - latest price resolution

**Deliverables**
- tests for each canonical view

**Acceptance Criteria**
- Views are trustworthy data sources for UI.

---

### 198 — Performance sanity checks (lightweight)
**Scope**
- Not full benchmarking, but guard against catastrophic regressions:
  - check explain plan shape for key queries
  - ensure expected index usage exists

**Deliverables**
- plan-shape checks with deterministic thresholds

**Acceptance Criteria**
- Critical household queries do not degrade into obvious full scans.

---

### 199–210 — CI wiring + gates
**Scope**
- CI runs integration suite and fails fast on:
  - migration drift
  - missing RLS coverage
  - failing tests

**Deliverables**
- CI job config updates
- `/docs/backend/ci-gates.md`

**Acceptance Criteria**
- A PR cannot merge if backend gates fail.
---
# Layer 5 — Frontend Implementation (241–320)

This layer builds a function-first mobile UI: stable shell + auth/household + budget vertical slice + pantry/transactions.

## 241–260: App shell + navigation
- 241 Navigation architecture (Budget/Pantry/Transactions/Settings; deep links; stable route names)
- 242 Layout primitives (safe area, spacing, typography, keyboard avoidance, reusable scaffolds)
- 243 State/query strategy (server cache keys scoped by household, invalidation rules)
- 244 Standard UX components (loading/empty/error/retry; error taxonomy mapping)
- 245 Telemetry hooks (trace_id correlation, safe context capture)
- 246–260 Accessibility + tokenized styling (font scaling, touch targets, consistent tokens)

## 261–280: Auth + household flows
- 261 Auth screens (sign in/up/reset/provider) with offline and rate-limit handling
- 262 Session persistence + deterministic boot routing
- 263 Household picker (multi-household support, remember last)
- 264 Household create (creator becomes owner, immediate routing)
- 265 Invite/join (if supported) with safe invalid/expired handling
- 266 Forbidden UX (cross-household, recovery actions, no existence leaks)
- 267–280 Race/edge hardening (token refresh mid-nav, household switch in-flight, cache isolation)

## 281–300: Weekly budget vertical slice
- 281 Budget overview (target/actual/remaining; labeled “Estimated” projections if shown)
- 282 Budget set/edit (cents formatting, week alignment, non-negative)
- 283 Weekly transactions list (date/store/total; deterministic week filter)
- 284 Add transaction (store/date/total; minimal but real)
- 285 Budget correctness rules (backend canonical source; no float math)
- 286–300 Edge cases (empty weeks, week transitions, missing stores, error mapping)

## 301–320: Pantry + transactions
- 301 Pantry list (qty/unit, optional expiry grouping)
- 302 Add/edit pantry item (catalog selection, validation)
- 303 Expiry UX (expiring soon grouping, non-alarming tone)
- 304 Transaction detail (works even if no line items)
- 305 Add-from-transaction to pantry (idempotent UX rules)
- 306–320 Consistency tests (cache isolation, correctness under edits)
---
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
---
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
---
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