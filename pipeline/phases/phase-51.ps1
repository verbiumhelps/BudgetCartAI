# ============================================================
# PHASE 51 — household_members table + roles (SQL migration scaffold)
# ============================================================

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Ensure-Dir([string]$p) { if (-not (Test-Path $p)) { New-Item -ItemType Directory -Force -Path $p | Out-Null } }
function Write-Lines([string]$path, [string[]]$lines) { Ensure-Dir (Split-Path -Parent $path); Set-Content -Path $path -Value (($lines -join "`n") + "`n") -Encoding UTF8 }

Write-Lines ".\supabase\migrations\051_household_members.sql" @(
  '-- household_members join table scaffold'
  'create table if not exists public.household_members ('
  '  household_id uuid not null references public.households(id) on delete cascade,'
  '  user_id uuid not null,'
  '  role text not null check (role in (''owner'',''admin'',''member'')) default ''member'','
  '  created_at timestamptz not null default now(),'
  '  primary key (household_id, user_id)'
  ');'
)

Write-Host "PHASE 51 COMPLETE"

