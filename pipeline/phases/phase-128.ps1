Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

# PHASE 128 — Application Use Case: List Household Transactions (Port-Driven)

$repoRoot = (Get-Location).Path
if ([string]::IsNullOrWhiteSpace($repoRoot)) { throw "Repo root is invalid/empty." }

function Ensure-Dir {
    param([Parameter(Mandatory=$true)][string]$Path)
    if ([string]::IsNullOrWhiteSpace($Path)) { throw "Ensure-Dir received empty path." }
    if (-not (Test-Path -Path $Path)) { New-Item -ItemType Directory -Force -Path $Path | Out-Null }
}

# Directories
$srcDir      = Join-Path $repoRoot "src"
$appDir      = Join-Path $srcDir "application"
$useCaseDir  = Join-Path $appDir "use-cases"
$docsDir     = Join-Path $repoRoot "docs"

Ensure-Dir -Path $srcDir
Ensure-Dir -Path $appDir
Ensure-Dir -Path $useCaseDir
Ensure-Dir -Path $docsDir

# Files
$useCaseFile = Join-Path $useCaseDir "listHouseholdTransactions.ts"
$docFile     = Join-Path $docsDir "application-use-cases.md"

$useCaseContent = @'
import type { Transaction } from "../../domain/transaction";
import type { TransactionRepository } from "../ports/transactionRepository";

export interface ListHouseholdTransactionsInput {
  householdId: string;
  startDate?: string; // ISO string
  endDate?: string;   // ISO string
}

export interface ListHouseholdTransactionsOutput {
  transactions: Transaction[];
}

export class ListHouseholdTransactions {
  constructor(private readonly repository: TransactionRepository) {}

  async execute(
    input: ListHouseholdTransactionsInput
  ): Promise<ListHouseholdTransactionsOutput> {
    if (!input.householdId || input.householdId.trim().length === 0) {
      throw new Error("householdId is required");
    }

    const transactions = await this.repository.listByHousehold({
      householdId: input.householdId,
      startDate: input.startDate,
      endDate: input.endDate,
    });

    return { transactions };
  }
}
'@

$docContent = @'
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
'@

Set-Content -Path $useCaseFile -Value $useCaseContent -Encoding UTF8 -Force
Set-Content -Path $docFile     -Value $docContent     -Encoding UTF8 -Force

Write-Host "PHASE 128 COMPLETE"
