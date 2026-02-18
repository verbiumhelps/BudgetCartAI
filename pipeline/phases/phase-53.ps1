# ============================================================
# PHASE 53 — Household creation flow (onboarding modules)
# ============================================================

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Ensure-Dir([string]$p) { if (-not (Test-Path $p)) { New-Item -ItemType Directory -Force -Path $p | Out-Null } }
function Write-Lines([string]$path, [string[]]$lines) { Ensure-Dir (Split-Path -Parent $path); Set-Content -Path $path -Value (($lines -join "`n") + "`n") -Encoding UTF8 }

Write-Lines ".\src\features\households\createHousehold.ts" @(
  'import { supabaseClient } from ''../../lib/supabase/client'';'
  ''
  'export async function createHousehold(name: string, region?: string) {'
  '  return supabaseClient().from(''households'').insert({ name, region }).select().single();'
  '}'
)

Write-Host "PHASE 53 COMPLETE"

