Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$repoRoot = (Resolve-Path ".").Path
$statePath = Join-Path $repoRoot "pipeline\state.json"
$docsPath = Join-Path $repoRoot "docs"
$artifactPath = Join-Path $docsPath "system-architecture-foundation.md"

if (-not (Test-Path $statePath)) {
    throw "pipeline/state.json not found."
}

if ([string]::IsNullOrWhiteSpace($docsPath)) {
    throw "Resolved docs path is invalid."
}

if (-not (Test-Path $docsPath)) {
    New-Item -ItemType Directory -Path $docsPath -Force | Out-Null
}

$architectureDoc = @"
# BudgetCartAI — System Architecture Foundation

## Architectural Intent

BudgetCartAI is designed as an acquisition-grade, mobile-first grocery intelligence platform.
The architecture prioritizes:

- Deterministic build and deployment
- Strict type safety (TypeScript strict mode)
- Modular domain boundaries
- Testable services
- CI-enforced validation gates
- Horizontal scalability

---

## Core System Layers

### 1. Presentation Layer (Mobile-First)

- React Native / Expo
- Strict TypeScript
- Component-driven UI
- Deterministic state management
- No business logic in UI components

### 2. Application Layer

- Feature-scoped modules
- Domain services
- Budget intelligence engine
- Pantry intelligence engine
- Store optimization engine

### 3. Domain Layer

Core entities:

- User
- Household
- PantryItem
- BudgetPeriod
- Transaction
- Store
- PriceEntry

All business rules isolated here.

### 4. Data Layer

- Supabase (Postgres)
- Row-Level Security enforced
- Migration-driven schema evolution
- Strict relational integrity
- Deterministic seed data (non-production)

### 5. Intelligence Layer

- AI substitution modeling
- Budget projection modeling
- Savings delta calculation
- Pantry expiration forecasting

No chat UI.
Intelligence surfaces through structured UI outputs only.

---

## Non-Goals (At This Stage)

- No speculative gamification
- No coupon scraping engines
- No real-time scraping infrastructure
- No feature creep outside defined scope

---

## Acquisition Readiness Principles

- Clean modular separation
- Test coverage enforced per phase
- CI validation gates never bypassed
- No relaxed lint rules
- No disabled strict TypeScript flags
- Idempotent phase advancement

This document defines the baseline architectural intent.
Subsequent phases will expand deterministically.
"@

Set-Content -Path $artifactPath -Value $architectureDoc -Encoding UTF8 -Force

Write-Host "PHASE 80 COMPLETE"
