# ============================================================
# PHASE 54 — Household selector (multi-household UI/module stubs)
# ============================================================

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Ensure-Dir([string]$p) { if (-not (Test-Path $p)) { New-Item -ItemType Directory -Force -Path $p | Out-Null } }
function Write-Lines([string]$path, [string[]]$lines) { Ensure-Dir (Split-Path -Parent $path); Set-Content -Path $path -Value (($lines -join "`n") + "`n") -Encoding UTF8 }

Write-Lines ".\src\features\households\selectHousehold.ts" @(
  'import { supabaseClient } from ''../../lib/supabase/client'';'
  ''
  'export async function listMyHouseholds(userId: string) {'
  '  // requires household_members RLS + join view later'
  '  return supabaseClient().from(''household_members'').select(''household_id, role'').eq(''user_id'', userId);'
  '}'
)

Write-Host "PHASE 54 COMPLETE"

