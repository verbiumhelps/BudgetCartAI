# ============================================================
# PHASE 135 — Backend — User alert preferences table (category/item/store)
# ============================================================

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Ensure-Dir([string]$p) { if (-not (Test-Path $p)) { New-Item -ItemType Directory -Force -Path $p | Out-Null } }
function Write-Lines([string]$path, [string[]]$lines) { Ensure-Dir (Split-Path -Parent $path); Set-Content -Path $path -Value (($lines -join "`n") + "`n") -Encoding UTF8 }

Write-Lines ".\supabase\migrations\135_alert_preferences.sql" @(
  '-- alert preferences scaffold'
  'create table if not exists public.alert_preferences ('
  '  id uuid primary key default gen_random_uuid(),'
  '  household_id uuid not null references public.households(id) on delete cascade,'
  '  user_id uuid not null,'
  '  store_id uuid references public.stores(id) on delete set null,'
  '  category text,'
  '  canonical_item_id uuid references public.canonical_items(id) on delete set null,'
  '  is_enabled boolean not null default true,'
  '  created_at timestamptz not null default now()'
  ');'
)

Write-Host "PHASE 135 COMPLETE"

