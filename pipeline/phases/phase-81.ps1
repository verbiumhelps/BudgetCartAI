# ============================================================
# PHASE 81 — Favorites table (user/household scoped)
# ============================================================

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Ensure-Dir([string]$p) { if (-not (Test-Path $p)) { New-Item -ItemType Directory -Force -Path $p | Out-Null } }
function Write-Lines([string]$path, [string[]]$lines) { Ensure-Dir (Split-Path -Parent $path); Set-Content -Path $path -Value (($lines -join "`n") + "`n") -Encoding UTF8 }

Write-Lines ".\supabase\migrations\081_favorites.sql" @(
  '-- favorites scaffold (user + household scoped)'
  'create table if not exists public.favorites ('
  '  household_id uuid not null references public.households(id) on delete cascade,'
  '  user_id uuid not null,'
  '  canonical_item_id uuid references public.canonical_items(id) on delete cascade,'
  '  label text not null,'
  '  created_at timestamptz not null default now(),'
  '  primary key (household_id, user_id, label)'
  ');'
)

Write-Host "PHASE 81 COMPLETE"

