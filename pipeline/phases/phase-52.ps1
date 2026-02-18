# ============================================================
# PHASE 52 — RLS for household membership + admin/owner manage policies (SQL scaffold)
# ============================================================

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Ensure-Dir([string]$p) { if (-not (Test-Path $p)) { New-Item -ItemType Directory -Force -Path $p | Out-Null } }
function Write-Lines([string]$path, [string[]]$lines) { Ensure-Dir (Split-Path -Parent $path); Set-Content -Path $path -Value (($lines -join "`n") + "`n") -Encoding UTF8 }

Write-Lines ".\supabase\migrations\052_household_members_rls.sql" @(
  '-- RLS scaffold for households + household_members'
  'alter table public.households enable row level security;'
  'alter table public.household_members enable row level security;'
  ''
  '-- TODO policies:'
  '-- - members can read their households'
  '-- - only owner/admin can insert/update/delete household_members'
  '-- - only owner/admin can update household fields'
)

Write-Host "PHASE 52 COMPLETE"

