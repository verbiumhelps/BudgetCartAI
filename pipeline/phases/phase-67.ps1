# ============================================================
# PHASE 67 — canonical_items table (SQL scaffold)
# ============================================================

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Ensure-Dir([string]$p) { if (-not (Test-Path $p)) { New-Item -ItemType Directory -Force -Path $p | Out-Null } }
function Write-Lines([string]$path, [string[]]$lines) { Ensure-Dir (Split-Path -Parent $path); Set-Content -Path $path -Value (($lines -join "`n") + "`n") -Encoding UTF8 }

Write-Lines ".\supabase\migrations\067_canonical_items.sql" @(
  '-- canonical_items scaffold'
  'create table if not exists public.canonical_items ('
  '  id uuid primary key default gen_random_uuid(),'
  '  name text not null,'
  '  brand text,'
  '  size text,'
  '  category text,'
  '  created_at timestamptz not null default now()'
  ');'
)

Write-Host "PHASE 67 COMPLETE"

