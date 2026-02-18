# ============================================================
# PHASE 109 — Weekly spend rollup view (week boundaries deterministic)
# ============================================================

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Ensure-Dir([string]$p) { if (-not (Test-Path $p)) { New-Item -ItemType Directory -Force -Path $p | Out-Null } }
function Write-Lines([string]$path, [string[]]$lines) { Ensure-Dir (Split-Path -Parent $path); Set-Content -Path $path -Value (($lines -join "`n") + "`n") -Encoding UTF8 }

Write-Lines ".\supabase\migrations\109_weekly_spend_rollup.sql" @(
  '-- weekly spend rollup scaffold (deterministic week boundaries)'
  '-- NOTE: define week start (e.g., Monday) consistently. Adjust as needed.'
  'create or replace view public.weekly_spend as'
  'select'
  '  household_id,'
  '  date_trunc(''week'', purchased_at::timestamptz) as week_start,'
  '  sum(total) as total_spend'
  'from public.receipts'
  'group by household_id, date_trunc(''week'', purchased_at::timestamptz);'
)

Write-Host "PHASE 109 COMPLETE"

