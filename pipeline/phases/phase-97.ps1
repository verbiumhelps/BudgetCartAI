# ============================================================
# PHASE 97 — Pantry history view (audit trail for items) — module stub
# ============================================================

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Ensure-Dir([string]$p) { if (-not (Test-Path $p)) { New-Item -ItemType Directory -Force -Path $p | Out-Null } }
function Write-Lines([string]$path, [string[]]$lines) { Ensure-Dir (Split-Path -Parent $path); Set-Content -Path $path -Value (($lines -join "`n") + "`n") -Encoding UTF8 }

Write-Lines ".\src\features\pantry\history.ts" @(
  'import { supabaseClient } from ''../../lib/supabase/client'';'
  ''
  'export async function listPantryEvents(householdId: string, limit = 100) {'
  '  return supabaseClient()'
  '    .from(''pantry_events'')'
  '    .select(''*'')'
  '    .eq(''household_id'', householdId)'
  '    .order(''created_at'', { ascending: false })'
  '    .limit(limit);'
  '}'
)

Write-Host "PHASE 97 COMPLETE"

