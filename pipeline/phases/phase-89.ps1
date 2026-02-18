# ============================================================
# PHASE 89 — RLS for pantry (household membership)
# ============================================================

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Ensure-Dir([string]$p) { if (-not (Test-Path $p)) { New-Item -ItemType Directory -Force -Path $p | Out-Null } }
function Write-Lines([string]$path, [string[]]$lines) { Ensure-Dir (Split-Path -Parent $path); Set-Content -Path $path -Value (($lines -join "`n") + "`n") -Encoding UTF8 }

Write-Lines ".\supabase\migrations\089_pantry_rls.sql" @(
  '-- RLS scaffold for pantry_items'
  'alter table public.pantry_items enable row level security;'
  ''
  '-- TODO policies:'
  '-- - household members can read/write pantry_items for their household'
  '-- - deny cross-household access'
)

Write-Host "PHASE 89 COMPLETE"

