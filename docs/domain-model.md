# BudgetCartAI — Domain Model Foundation

## Deterministic Money
All money values are stored as integer cents in USD to avoid rounding drift.

## Core Entities
- CanonicalItem: normalized grocery item identity
- PantryEntry: household inventory snapshot
- ShoppingList + ShoppingListItem: weekly planning & in-store checklist
- StorePrice: time-stamped price evidence (store-aware)
- Recommendation: small, auditable suggestion unit (no chatbot)

## Eventing (future)
A thin append-only event log can be added for analytics and auditability (savings over time).

