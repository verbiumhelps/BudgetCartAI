# ============================================================
# PHASE 105 — budgets table (weekly budget per household)
# ============================================================

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Ensure-Dir([string]$p) { if (-not (Test-Path $p)) { New-Item -ItemType Directory -Force -Path $p | Out-Null } }
function Write-Lines([string]$path, [string[]]$lines) { Ensure-Dir (Split-Path -Parent $path); Set-Content -Path $path -Value (($lines -join "`n") + "`n") -Encoding UTF8 }

Write-Lines ".\supabase\migrations\105_budgets.sql" @(
  '-- budgets scaffold (weekly budget per household)'
  'create table if not exists public.budgets ('
  '  household_id uuid primary key references public.households(id) on delete cascade,'
  '  weekly_budget numeric not null default 0,'
  '  currency text not null default ''USD'','
  '  updated_at timestamptz not null default now()'
  ');'
)

Write-Host "PHASE 105 COMPLETE"

