# ============================================================
# PHASE 58 — Invites RLS hardening (SQL scaffold)
# ============================================================

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Ensure-Dir([string]$p) { if (-not (Test-Path $p)) { New-Item -ItemType Directory -Force -Path $p | Out-Null } }
function Write-Lines([string]$path, [string[]]$lines) { Ensure-Dir (Split-Path -Parent $path); Set-Content -Path $path -Value (($lines -join "`n") + "`n") -Encoding UTF8 }

Write-Lines ".\supabase\migrations\058_invites_rls.sql" @(
  '-- RLS scaffold for household_invites'
  'alter table public.household_invites enable row level security;'
  ''
  '-- TODO policies:'
  '-- - only owner/admin can create/read/delete invites for their household'
  '-- - invited email can read invite by token via RPC (recommended)'
)

Write-Host "PHASE 58 COMPLETE"

