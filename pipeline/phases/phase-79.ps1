# ============================================================
# PHASE 79 — Recent items materialization (per household/user)
# ============================================================

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Ensure-Dir([string]$p) { if (-not (Test-Path $p)) { New-Item -ItemType Directory -Force -Path $p | Out-Null } }
function Write-Lines([string]$path, [string[]]$lines) { Ensure-Dir (Split-Path -Parent $path); Set-Content -Path $path -Value (($lines -join "`n") + "`n") -Encoding UTF8 }

Write-Lines ".\supabase\migrations\079_recent_items.sql" @(
  '-- recent items scaffold (materialized view or table)'
  '-- Option A: table updated by triggers on grocery_list_items + pantry_events'
  'create table if not exists public.recent_items ('
  '  id uuid primary key default gen_random_uuid(),'
  '  household_id uuid not null references public.households(id) on delete cascade,'
  '  user_id uuid not null,'
  '  label text not null,'
  '  canonical_item_id uuid,'
  '  last_used_at timestamptz not null default now()'
  ');'
)

Write-Host "PHASE 79 COMPLETE"

