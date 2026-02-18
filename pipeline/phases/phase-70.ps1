# ============================================================
# PHASE 70 — store_items mapping (store-specific SKU/meta)
# ============================================================

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Ensure-Dir([string]$p) { if (-not (Test-Path $p)) { New-Item -ItemType Directory -Force -Path $p | Out-Null } }
function Write-Lines([string]$path, [string[]]$lines) { Ensure-Dir (Split-Path -Parent $path); Set-Content -Path $path -Value (($lines -join "`n") + "`n") -Encoding UTF8 }

Write-Lines ".\supabase\migrations\070_store_items.sql" @(
  '-- store_items scaffold (store-specific sku/meta -> canonical item)'
  'create table if not exists public.store_items ('
  '  id uuid primary key default gen_random_uuid(),'
  '  store_id uuid not null references public.stores(id) on delete cascade,'
  '  canonical_item_id uuid references public.canonical_items(id) on delete set null,'
  '  sku text,'
  '  label text,'
  '  pack_size text,'
  '  created_at timestamptz not null default now()'
  ');'
)

Write-Host "PHASE 70 COMPLETE"

