Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

# PHASE 99 — Fully Deterministic, No LiteralPath Usage

$repoRoot = (Get-Location).Path
if ([string]::IsNullOrWhiteSpace($repoRoot)) {
    throw "Repository root path is invalid."
}

function Ensure-Directory {
    param (
        [Parameter(Mandatory = $true)]
        [string]$FullPath
    )

    if ([string]::IsNullOrWhiteSpace($FullPath)) {
        throw "Attempted to create directory with empty path."
    }

    if (-not (Test-Path $FullPath)) {
        New-Item -ItemType Directory -Force -Path $FullPath | Out-Null
    }
}

# Explicit paths (no loops, no dynamic arrays)
$srcPath     = Join-Path $repoRoot "src"
$appPath     = Join-Path $srcPath "application"
$useCasePath = Join-Path $appPath "use-cases"

Ensure-Directory -FullPath $srcPath
Ensure-Directory -FullPath $appPath
Ensure-Directory -FullPath $useCasePath

$useCaseFile = Join-Path $useCasePath "calculateBudgetUtilization.ts"

$useCaseContent = @"
import { BudgetPeriod } from "../../domain/budget";
import { Transaction } from "../../domain/transaction";

export interface BudgetUtilizationResult {
  plannedCents: number;
  spentCents: number;
  remainingCents: number;
  utilizationRatio: number;
}

export function calculateBudgetUtilization(
  budget: BudgetPeriod,
  transactions: Transaction[]
): BudgetUtilizationResult {
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
    utilizationRatio
  };
}
"@

Set-Content -Path $useCaseFile -Value $useCaseContent -Encoding UTF8 -Force

Write-Host "PHASE 99 COMPLETE"
