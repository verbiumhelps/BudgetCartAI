# Ports & Adapters (Clean Architecture Boundary)

## Goal
Keep the domain and application layers isolated from infrastructure details.

## Pattern
- **Ports** live in `src/application/ports`
  - Pure TypeScript interfaces
  - Depend only on domain types
- **Adapters/Implementations** live in `src/infrastructure`
  - Supabase-specific code
  - Mapping between DB rows and domain entities

## Added in this phase
- `TransactionRepository` port
- `SupabaseTransactionRepository` adapter skeleton

## Rules
- UI must call application use-cases (not infrastructure).
- Application depends on ports, not concrete implementations.
- Infrastructure implements ports and depends outward (Supabase).
