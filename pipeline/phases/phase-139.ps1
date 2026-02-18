Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

# PHASE 139 — Dependency Wiring (Composition Root)

$repoRoot = (Get-Location).Path
if ([string]::IsNullOrWhiteSpace($repoRoot)) { throw "Repo root is invalid/empty." }

function Ensure-Dir {
    param([Parameter(Mandatory=$true)][string]$Path)
    if ([string]::IsNullOrWhiteSpace($Path)) { throw "Ensure-Dir received empty path." }
    if (-not (Test-Path -Path $Path)) { New-Item -ItemType Directory -Force -Path $Path | Out-Null }
}

# Directories
$srcDir   = Join-Path $repoRoot "src"
$compDir  = Join-Path $srcDir "composition"
$docsDir  = Join-Path $repoRoot "docs"

Ensure-Dir -Path $srcDir
Ensure-Dir -Path $compDir
Ensure-Dir -Path $docsDir

# Files
$compositionFile = Join-Path $compDir "index.ts"
$docFile         = Join-Path $docsDir "composition-root.md"

$compositionContent = @'
/**
 * Composition Root
 * Centralizes dependency wiring.
 * UI layer imports from here instead of constructing infrastructure directly.
 */

import { SupabaseTransactionRepository } from "../infrastructure/repositories/supabaseTransactionRepository";
import { ListHouseholdTransactions } from "../application/use-cases/listHouseholdTransactions";

export function createListHouseholdTransactionsUseCase() {
  const repository = new SupabaseTransactionRepository();
  return new ListHouseholdTransactions(repository);
}
'@

$docContent = @'
# Composition Root

This phase introduces a Composition Root to centralize dependency wiring.

Purpose:
- Prevent UI from instantiating infrastructure classes directly.
- Keep application layer decoupled from concrete implementations.
- Enable future dependency injection (testing, mocks, server adapters).

Pattern:
UI → Composition Root → Application Use Case → Repository Port → Infrastructure Adapter

Rules:
- UI imports only from src/composition
- Application never imports infrastructure
- Infrastructure never imports UI

This solidifies Clean Architecture layering for acquisition-grade maintainability.
'@

Set-Content -Path $compositionFile -Value $compositionContent -Encoding UTF8 -Force
Set-Content -Path $docFile         -Value $docContent         -Encoding UTF8 -Force

Write-Host "PHASE 139 COMPLETE"
