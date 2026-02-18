Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

# PHASE 146 — Budget Summary Domain Service (Pure Business Logic)

$repoRoot = (Get-Location).Path
if ([string]::IsNullOrWhiteSpace($repoRoot)) { throw "Repo root is invalid/empty." }

function Ensure-Dir {
    param([Parameter(Mandatory=$true)][string]$Path)
    if ([string]::IsNullOrWhiteSpace($Path)) { throw "Ensure-Dir received empty path." }
    if (-not (Test-Path -Path $Path)) { New-Item -ItemType Directory -Force -Path $Path | Out-Null }
}

# Directories
$srcDir     = Join-Path $repoRoot "src"
$domainDir  = Join-Path $srcDir "domain"
$servicesDir= Join-Path $domainDir "services"
$docsDir    = Join-Path $repoRoot "docs"

Ensure-Dir -Path $srcDir
Ensure-Dir -Path $domainDir
Ensure-Dir -Path $servicesDir
Ensure-Dir -Path $docsDir

# Files
$serviceFile = Join-Path $servicesDir "budgetSummary.ts"
$docFile     = Join-Path $docsDir "budget-summary-domain-service.md"

$serviceContent = @'
import type { BudgetPeriod } from "../budget";
import type { Transaction } from "../transaction";

export interface BudgetSummary {
  plannedCents: number;
  spentCents: number;
  remainingCents: number;
  utilizationRatio: number;
  isOverBudget: boolean;
}

export function buildBudgetSummary(params: {
  budget: BudgetPeriod;
  transactions: Transaction[];
}): BudgetSummary {
  const { budget, transactions } = params;

  const spentCents = transactions
    .filter(t => t.householdId === budget.householdId)
    .reduce((sum, t) => sum + t.totalCents, 0);

  const plannedCents = budget.plannedAmountCents;
  const remainingCents = plannedCents - spentCents;
  const utilizationRatio =
    plannedCents === 0 ? 0 : spentCents / plannedCents;

  return {
    plannedCents,
    spentCents,
    remainingCents,
    utilizationRatio,
    isOverBudget: remainingCents < 0,
  };
}
'@

$docContent = @'
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
'@

Set-Content -Path $serviceFile -Value $serviceContent -Encoding UTF8 -Force
Set-Content -Path $docFile     -Value $docContent     -Encoding UTF8 -Force

Write-Host "PHASE 146 COMPLETE"
