# ============================================================
# PHASE 115 — Savings events table (store swap, substitute, deal)
# ============================================================

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Ensure-Dir([string]$p) { if (-not (Test-Path $p)) { New-Item -ItemType Directory -Force -Path $p | Out-Null } }
function Write-Lines([string]$path, [string[]]$lines) { Ensure-Dir (Split-Path -Parent $path); Set-Content -Path $path -Value (($lines -join "`n") + "`n") -Encoding UTF8 }

Write-Lines ".\supabase\migrations\115_savings_events.sql" @(
  '-- savings_events scaffold'
  'create table if not exists public.savings_events ('
  '  id uuid primary key default gen_random_uuid(),'
  '  household_id uuid not null references public.households(id) on delete cascade,'
  '  event_type text not null,'
  '  amount numeric not null default 0,'
  '  metadata jsonb not null default ''{}''::jsonb,'
  '  created_at timestamptz not null default now()'
  ');'
)

Write-Host "PHASE 115 COMPLETE"

