Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

# PHASE 85 — deterministic, idempotent, no empty paths

$repoRoot = (Resolve-Path ".").Path
if ([string]::IsNullOrWhiteSpace($repoRoot)) {
    throw "Repo root resolved to empty."
}

function Ensure-Dir([string]$Path) {
    if ([string]::IsNullOrWhiteSpace($Path)) { throw "Ensure-Dir received empty path." }
    if (-not (Test-Path -LiteralPath $Path)) {
        New-Item -ItemType Directory -Force -Path $Path | Out-Null
    }
}

# Required dirs (explicit, never empty)
$docsDir = Join-Path $repoRoot "docs"
$domainDir = Join-Path $repoRoot "src\domain"
$appDir = Join-Path $repoRoot "src\application"
$infraDir = Join-Path $repoRoot "src\infrastructure"

Ensure-Dir $docsDir
Ensure-Dir $domainDir
Ensure-Dir $appDir
Ensure-Dir $infraDir

# Real artifact: enforce architectural boundaries doc (idempotent write)
$artifactPath = Join-Path $docsDir "architecture-boundaries.md"
$artifact = @"
# BudgetCartAI — Architectural Boundary Definition

## Purpose
Formalize strict architectural boundaries to preserve acquisition-grade maintainability and scalability.

---

## Layer Separation Rules

### Domain Layer
**Path:** `src/domain`
- Pure business logic only
- No framework imports (no React, Expo, Supabase, etc.)
- No network calls
- No database access
- Deterministic, unit-testable in isolation

### Application Layer
**Path:** `src/application`
- Coordinates workflows and use-cases
- Calls into domain services
- No UI rendering
- No direct persistence implementation details (use interfaces)

### Infrastructure Layer
**Path:** `src/infrastructure`
- External adapters (Supabase client, HTTP, storage)
- Persistence implementations
- Environment/config wiring

### Presentation Layer
**Path:** UI code under `src/`
- React Native / Expo UI
- No business rules
- Uses application layer only

---

## Enforcement Principles
- Strict TypeScript remains enabled
- No circular dependencies across layers
- Lint + typecheck + tests remain mandatory gates
- No speculative features introduced by architecture phases

"@

Set-Content -Path $artifactPath -Value $artifact -Encoding UTF8 -Force

Write-Host "PHASE 85 COMPLETE"
