Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

# PHASE 99 — Application Use-Case Skeleton (Atomic + Idempotent)

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

# Ensure required dirs
$appDir = Join-Path $repoRoot "src\application"
$useCaseDir = Join-Path $appDir "use-cases"
Ensure-Dir $appDir
Ensure-Dir $useCaseDir

# --- Use Case: Calculate Budget Utilization ---

$calculateBudgetUtilizationTs = @"
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

# Deterministic write
Set-Content `
  -Path (Join-Path $useCaseDir "calculateBudgetUtilization.ts") `
  -Value $calculateBudgetUtilizationTs `
  -Encoding UTF8 `
  -Force

Write-Host "PHASE 99 COMPLETE"
