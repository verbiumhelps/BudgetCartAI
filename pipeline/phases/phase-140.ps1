Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

# PHASE 140 — UI-Service Facade (Thin Adapter for Screens)

$repoRoot = (Get-Location).Path
if ([string]::IsNullOrWhiteSpace($repoRoot)) { throw "Repo root is invalid/empty." }

function Ensure-Dir {
    param([Parameter(Mandatory=$true)][string]$Path)
    if ([string]::IsNullOrWhiteSpace($Path)) { throw "Ensure-Dir received empty path." }
    if (-not (Test-Path -Path $Path)) { New-Item -ItemType Directory -Force -Path $Path | Out-Null }
}

# Directories
$srcDir     = Join-Path $repoRoot "src"
$servicesDir= Join-Path $srcDir "services"
$docsDir    = Join-Path $repoRoot "docs"

Ensure-Dir -Path $srcDir
Ensure-Dir -Path $servicesDir
Ensure-Dir -Path $docsDir

# Files
$serviceFile = Join-Path $servicesDir "transactionsService.ts"
$docFile     = Join-Path $docsDir "ui-service-facade.md"

$serviceContent = @'
import type { Transaction } from "../domain/transaction";
import { createListHouseholdTransactionsUseCase } from "../composition";

export async function listHouseholdTransactions(params: {
  householdId: string;
  startDate?: string;
  endDate?: string;
}): Promise<Transaction[]> {
  const useCase = createListHouseholdTransactionsUseCase();
  const result = await useCase.execute(params);
  return result.transactions;
}
'@

$docContent = @'
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
'@

Set-Content -Path $serviceFile -Value $serviceContent -Encoding UTF8 -Force
Set-Content -Path $docFile     -Value $docContent     -Encoding UTF8 -Force

Write-Host "PHASE 140 COMPLETE"
