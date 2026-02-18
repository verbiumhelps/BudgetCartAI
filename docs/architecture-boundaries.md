# BudgetCartAI — Architectural Boundary Definition

## Purpose
Formalize strict architectural boundaries to preserve acquisition-grade maintainability and scalability.

---

## Layer Separation Rules

### Domain Layer
**Path:** src/domain
- Pure business logic only
- No framework imports (no React, Expo, Supabase, etc.)
- No network calls
- No database access
- Deterministic, unit-testable in isolation

### Application Layer
**Path:** src/application
- Coordinates workflows and use-cases
- Calls into domain services
- No UI rendering
- No direct persistence implementation details (use interfaces)

### Infrastructure Layer
**Path:** src/infrastructure
- External adapters (Supabase client, HTTP, storage)
- Persistence implementations
- Environment/config wiring

### Presentation Layer
**Path:** UI code under src/
- React Native / Expo UI
- No business rules
- Uses application layer only

---

## Enforcement Principles
- Strict TypeScript remains enabled
- No circular dependencies across layers
- Lint + typecheck + tests remain mandatory gates
- No speculative features introduced by architecture phases

