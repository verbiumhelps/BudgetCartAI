# Budget Summary Domain Service

This phase introduces a pure domain service responsible for constructing a budget summary.

## Characteristics
- Lives in src/domain/services
- No infrastructure imports
- No UI logic
- Pure deterministic calculation
- Fully unit-testable

## Responsibility
Transforms:
- BudgetPeriod
- Transaction[]

Into:
- BudgetSummary

This keeps financial intelligence inside the domain layer, preserving acquisition-grade architecture discipline.
