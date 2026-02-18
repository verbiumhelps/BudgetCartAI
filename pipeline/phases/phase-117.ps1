Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

# PHASE 117 — Infrastructure Adapter Interface + Supabase Impl Skeleton (Atomic + Idempotent)

$repoRoot = (Get-Location).Path
if ([string]::IsNullOrWhiteSpace($repoRoot)) { throw "Repo root is invalid/empty." }

function Ensure-Dir {
    param([Parameter(Mandatory=$true)][string]$Path)
    if ([string]::IsNullOrWhiteSpace($Path)) { throw "Ensure-Dir received empty path." }
    if (-not (Test-Path -Path $Path)) { New-Item -ItemType Directory -Force -Path $Path | Out-Null }
}

# Directories
$srcDir   = Join-Path $repoRoot "src"
$appDir   = Join-Path $srcDir "application"
$portsDir = Join-Path $appDir "ports"
$infraDir = Join-Path $srcDir "infrastructure"
$repoDir  = Join-Path $infraDir "repositories"
$docsDir  = Join-Path $repoRoot "docs"

Ensure-Dir -Path $srcDir
Ensure-Dir -Path $appDir
Ensure-Dir -Path $portsDir
Ensure-Dir -Path $infraDir
Ensure-Dir -Path $repoDir
Ensure-Dir -Path $docsDir

# Files
$portFile  = Join-Path $portsDir "transactionRepository.ts"
$implFile  = Join-Path $repoDir "supabaseTransactionRepository.ts"
$docFile   = Join-Path $docsDir "ports-and-adapters.md"

# Content (single-quoted here-strings to avoid PS interpolation)
$portContent = @'
import type { Transaction } from "../../domain/transaction";

export interface TransactionRepository {
  /**
   * Returns transactions for a household within an optional date range.
   */
  listByHousehold(params: {
    householdId: string;
    startDate?: string; // ISO
    endDate?: string;   // ISO
  }): Promise<Transaction[]>;
}
'@

$implContent = @'
import type { Transaction } from "../../domain/transaction";
import type { TransactionRepository } from "../../application/ports/transactionRepository";
import { getSupabaseClient } from "../supabase/client";

type TransactionRow = {
  id: string;
  household_id: string;
  store_id: string;
  total_cents: number;
  occurred_at: string;
};

function mapRow(r: TransactionRow): Transaction {
  return {
    id: r.id,
    householdId: r.household_id,
    storeId: r.store_id,
    totalCents: r.total_cents,
    occurredAt: r.occurred_at,
  };
}

/**
 * Supabase implementation of TransactionRepository.
 * NOTE: Table/column names are placeholders until schema phase locks them.
 */
export class SupabaseTransactionRepository implements TransactionRepository {
  async listByHousehold(params: {
    householdId: string;
    startDate?: string;
    endDate?: string;
  }): Promise<Transaction[]> {
    const supabase = getSupabaseClient();

    let query = supabase
      .from("transactions")
      .select("id, household_id, store_id, total_cents, occurred_at")
      .eq("household_id", params.householdId);

    if (params.startDate) query = query.gte("occurred_at", params.startDate);
    if (params.endDate) query = query.lte("occurred_at", params.endDate);

    const { data, error } = await query;
    if (error) throw error;

    return (data ?? []).map(mapRow);
  }
}
'@

$docContent = @'
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
'@

Set-Content -Path $portFile -Value $portContent -Encoding UTF8 -Force
Set-Content -Path $implFile -Value $implContent -Encoding UTF8 -Force
Set-Content -Path $docFile  -Value $docContent  -Encoding UTF8 -Force

Write-Host "PHASE 117 COMPLETE"
