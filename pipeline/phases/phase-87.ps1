# ============================================================
# PHASE 87 — pantry_items table (household scoped, canonical item)
# ============================================================

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Ensure-Dir([string]$p) { if (-not (Test-Path $p)) { New-Item -ItemType Directory -Force -Path $p | Out-Null } }
function Write-Lines([string]$path, [string[]]$lines) { Ensure-Dir (Split-Path -Parent $path); Set-Content -Path $path -Value (($lines -join "`n") + "`n") -Encoding UTF8 }

Write-Lines ".\supabase\migrations\087_pantry_items.sql" @(
  '-- pantry_items scaffold (household scoped)'
  'create table if not exists public.pantry_items ('
  '  id uuid primary key default gen_random_uuid(),'
  '  household_id uuid not null references public.households(id) on delete cascade,'
  '  canonical_item_id uuid references public.canonical_items(id) on delete set null,'
  '  label text not null,'
  '  created_at timestamptz not null default now()'
  ');'
)

Write-Host "PHASE 87 COMPLETE"

