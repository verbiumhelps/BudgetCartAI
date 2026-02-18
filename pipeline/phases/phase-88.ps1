# ============================================================
# PHASE 88 — Pantry fields: quantity, unit, purchase date, expiry date
# ============================================================

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Ensure-Dir([string]$p) { if (-not (Test-Path $p)) { New-Item -ItemType Directory -Force -Path $p | Out-Null } }
function Write-Lines([string]$path, [string[]]$lines) { Ensure-Dir (Split-Path -Parent $path); Set-Content -Path $path -Value (($lines -join "`n") + "`n") -Encoding UTF8 }

Write-Lines ".\supabase\migrations\088_pantry_fields.sql" @(
  '-- add pantry fields scaffold'
  'alter table public.pantry_items add column if not exists quantity numeric;'
  'alter table public.pantry_items add column if not exists unit text;'
  'alter table public.pantry_items add column if not exists purchased_at date;'
  'alter table public.pantry_items add column if not exists expires_at date;'
)

Write-Host "PHASE 88 COMPLETE"

