# ============================================================
# PHASE 64 — Surface audit log in household settings (UI/module stub)
# ============================================================

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Ensure-Dir([string]$p) { if (-not (Test-Path $p)) { New-Item -ItemType Directory -Force -Path $p | Out-Null } }
function Write-Lines([string]$path, [string[]]$lines) { Ensure-Dir (Split-Path -Parent $path); Set-Content -Path $path -Value (($lines -join "`n") + "`n") -Encoding UTF8 }

Write-Lines ".\src\features\households\auditLog.ts" @(
  'import { supabaseClient } from ''../../lib/supabase/client'';'
  ''
  'export async function listAuditLog(householdId: string, limit = 50) {'
  '  return supabaseClient()'
  '    .from(''audit_log'')'
  '    .select(''*'')'
  '    .eq(''household_id'', householdId)'
  '    .order(''created_at'', { ascending: false })'
  '    .limit(limit);'
  '}'
)

Write-Host "PHASE 64 COMPLETE"

