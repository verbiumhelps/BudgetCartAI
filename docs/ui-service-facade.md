# UI Service Facade

This phase introduces a thin UI-facing service facade that screens can call.

## Why
- Keeps screens simple (one function call)
- Preserves boundaries (screens do not instantiate repositories/use-cases)
- Enables easy swap to mocks in tests

## Pattern
Screen → src/services/* → composition root → use case → port → infrastructure

## Added
- src/services/transactionsService.ts

No UI components are created in this phase.
