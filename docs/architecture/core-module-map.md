# Core Module Map

This repository uses a layered approach designed for acquisition-grade clarity and auditability.

## Location
- src/core/domain/* â€” Canonical domain types (no UI imports).
- src/core/data/* â€” Repository interfaces (data access contracts).
- src/core/intelligence/* â€” Typed intelligence/AI contracts (no chatbot UI; structured outputs).
- src/core/index.ts â€” Barrel exports for cross-layer consumption.

## Rules
- UI must not reach directly into data adapters; it goes through app-layer orchestration (introduced later).
- Intelligence returns typed results (recommendations + projections), not prose-first output.
- These modules are stable foundations for subsequent phases.