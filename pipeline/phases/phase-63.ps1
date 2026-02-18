# ============================================================
# PHASE 63 — RLS for audit_log (household read-only) SQL scaffold
# ============================================================

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Ensure-Dir([string]$p) { if (-not (Test-Path $p)) { New-Item -ItemType Directory -Force -Path $p | Out-Null } }
function Write-Lines([string]$path, [string[]]$lines) { Ensure-Dir (Split-Path -Parent $path); Set-Content -Path $path -Value (($lines -join "`n") + "`n") -Encoding UTF8 }

Write-Lines ".\supabase\migrations\063_audit_log_rls.sql" @(
  '-- RLS scaffold for audit_log'
  'alter table public.audit_log enable row level security;'
  ''
  '-- TODO policies:'
  '-- - household members can read audit_log rows for their household'
  '-- - no client-side inserts/updates/deletes (use RPC/server later)'
)

Write-Host "PHASE 63 COMPLETE"

