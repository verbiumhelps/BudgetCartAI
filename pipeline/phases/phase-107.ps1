# ============================================================
# PHASE 107 — receipts table (manual totals initially)
# ============================================================

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Ensure-Dir([string]$p) { if (-not (Test-Path $p)) { New-Item -ItemType Directory -Force -Path $p | Out-Null } }
function Write-Lines([string]$path, [string[]]$lines) { Ensure-Dir (Split-Path -Parent $path); Set-Content -Path $path -Value (($lines -join "`n") + "`n") -Encoding UTF8 }

Write-Lines ".\supabase\migrations\107_receipts.sql" @(
  '-- receipts scaffold (manual totals first)'
  'create table if not exists public.receipts ('
  '  id uuid primary key default gen_random_uuid(),'
  '  household_id uuid not null references public.households(id) on delete cascade,'
  '  store_id uuid references public.stores(id) on delete set null,'
  '  purchased_at date not null,'
  '  total numeric not null,'
  '  created_at timestamptz not null default now()'
  ');'
)

Write-Host "PHASE 107 COMPLETE"

