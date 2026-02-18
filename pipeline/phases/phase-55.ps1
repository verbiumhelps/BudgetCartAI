# ============================================================
# PHASE 55 — household_invites table (SQL scaffold)
# ============================================================

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Ensure-Dir([string]$p) { if (-not (Test-Path $p)) { New-Item -ItemType Directory -Force -Path $p | Out-Null } }
function Write-Lines([string]$path, [string[]]$lines) { Ensure-Dir (Split-Path -Parent $path); Set-Content -Path $path -Value (($lines -join "`n") + "`n") -Encoding UTF8 }

Write-Lines ".\supabase\migrations\055_household_invites.sql" @(
  '-- household_invites scaffold'
  'create table if not exists public.household_invites ('
  '  id uuid primary key default gen_random_uuid(),'
  '  household_id uuid not null references public.households(id) on delete cascade,'
  '  email text not null,'
  '  role text not null check (role in (''admin'',''member'')) default ''member'','
  '  token text not null,'
  '  expires_at timestamptz not null,'
  '  created_at timestamptz not null default now()'
  ');'
)

Write-Host "PHASE 55 COMPLETE"

