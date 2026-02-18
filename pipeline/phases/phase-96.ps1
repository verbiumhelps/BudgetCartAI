# ============================================================
# PHASE 96 — pantry_events table (add/consume/adjust) for history
# ============================================================

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Ensure-Dir([string]$p) { if (-not (Test-Path $p)) { New-Item -ItemType Directory -Force -Path $p | Out-Null } }
function Write-Lines([string]$path, [string[]]$lines) { Ensure-Dir (Split-Path -Parent $path); Set-Content -Path $path -Value (($lines -join "`n") + "`n") -Encoding UTF8 }

Write-Lines ".\supabase\migrations\096_pantry_events.sql" @(
  '-- pantry_events scaffold (audit trail for items)'
  'create table if not exists public.pantry_events ('
  '  id uuid primary key default gen_random_uuid(),'
  '  household_id uuid not null references public.households(id) on delete cascade,'
  '  pantry_item_id uuid references public.pantry_items(id) on delete set null,'
  '  event_type text not null check (event_type in (''add'',''consume'',''adjust'')) ,'
  '  delta numeric,'
  '  note text,'
  '  created_at timestamptz not null default now()'
  ');'
)

Write-Host "PHASE 96 COMPLETE"

