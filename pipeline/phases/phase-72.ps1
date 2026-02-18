# ============================================================
# PHASE 72 — grocery_lists table (household scoped)
# ============================================================

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Ensure-Dir([string]$p) { if (-not (Test-Path $p)) { New-Item -ItemType Directory -Force -Path $p | Out-Null } }
function Write-Lines([string]$path, [string[]]$lines) { Ensure-Dir (Split-Path -Parent $path); Set-Content -Path $path -Value (($lines -join "`n") + "`n") -Encoding UTF8 }

Write-Lines ".\supabase\migrations\072_grocery_lists.sql" @(
  '-- grocery_lists scaffold (household scoped)'
  'create table if not exists public.grocery_lists ('
  '  id uuid primary key default gen_random_uuid(),'
  '  household_id uuid not null references public.households(id) on delete cascade,'
  '  name text not null,'
  '  created_at timestamptz not null default now()'
  ');'
)

Write-Host "PHASE 72 COMPLETE"

