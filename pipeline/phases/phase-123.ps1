# ============================================================
# PHASE 123 — Backend — prices table (store_item_id, price, unit_price, timestamp)
# ============================================================

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Ensure-Dir([string]$p) { if (-not (Test-Path $p)) { New-Item -ItemType Directory -Force -Path $p | Out-Null } }
function Write-Lines([string]$path, [string[]]$lines) { Ensure-Dir (Split-Path -Parent $path); Set-Content -Path $path -Value (($lines -join "`n") + "`n") -Encoding UTF8 }

Write-Lines ".\supabase\migrations\123_prices.sql" @(
  '-- prices scaffold'
  'create table if not exists public.prices ('
  '  id uuid primary key default gen_random_uuid(),'
  '  store_item_id uuid not null references public.store_items(id) on delete cascade,'
  '  price numeric not null,'
  '  unit_price numeric,'
  '  currency text not null default ''USD'','
  '  captured_at timestamptz not null default now()'
  ');'
  ''
  'create index if not exists idx_prices_store_item_time on public.prices(store_item_id, captured_at desc);'
)

Write-Host "PHASE 123 COMPLETE"

