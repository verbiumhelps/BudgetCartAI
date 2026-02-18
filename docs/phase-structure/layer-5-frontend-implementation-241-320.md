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