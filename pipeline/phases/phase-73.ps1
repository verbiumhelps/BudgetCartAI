# ============================================================
# PHASE 73 — grocery_list_items table (qty, notes, checked state)
# ============================================================

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Ensure-Dir([string]$p) { if (-not (Test-Path $p)) { New-Item -ItemType Directory -Force -Path $p | Out-Null } }
function Write-Lines([string]$path, [string[]]$lines) { Ensure-Dir (Split-Path -Parent $path); Set-Content -Path $path -Value (($lines -join "`n") + "`n") -Encoding UTF8 }

Write-Lines ".\supabase\migrations\073_grocery_list_items.sql" @(
  '-- grocery_list_items scaffold'
  'create table if not exists public.grocery_list_items ('
  '  id uuid primary key default gen_random_uuid(),'
  '  list_id uuid not null references public.grocery_lists(id) on delete cascade,'
  '  canonical_item_id uuid references public.canonical_items(id) on delete set null,'
  '  label text not null,'
  '  qty numeric,'
  '  unit text,'
  '  note text,'
  '  is_checked boolean not null default false,'
  '  created_at timestamptz not null default now()'
  ');'
)

Write-Host "PHASE 73 COMPLETE"

