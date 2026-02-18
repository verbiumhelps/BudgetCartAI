# ============================================================
# PHASE 68 — item_aliases table (store label → canonical item)
# ============================================================

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Ensure-Dir([string]$p) { if (-not (Test-Path $p)) { New-Item -ItemType Directory -Force -Path $p | Out-Null } }
function Write-Lines([string]$path, [string[]]$lines) { Ensure-Dir (Split-Path -Parent $path); Set-Content -Path $path -Value (($lines -join "`n") + "`n") -Encoding UTF8 }

Write-Lines ".\supabase\migrations\068_item_aliases.sql" @(
  '-- item_aliases scaffold (store label -> canonical item)'
  'create table if not exists public.item_aliases ('
  '  id uuid primary key default gen_random_uuid(),'
  '  store_label text not null,'
  '  canonical_item_id uuid not null references public.canonical_items(id) on delete cascade,'
  '  created_at timestamptz not null default now()'
  ');'
)

Write-Host "PHASE 68 COMPLETE"

