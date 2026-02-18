# Application Use Cases

This phase introduces a formal application-layer use case:

## ListHouseholdTransactions

Responsibilities:
- Validates input
- Delegates data access to a repository port
- Returns domain entities without exposing infrastructure details

Architectural Rules:
- Depends only on domain types and ports
- No Supabase imports
- No UI logic
- No persistence logic

This reinforces Clean Architecture boundaries and prepares for dependency injection wiring in later phases.
