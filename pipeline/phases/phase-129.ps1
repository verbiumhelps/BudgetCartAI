# ============================================================
# PHASE 129 — Frontend — Store compare screen (selected items across stores) — module stub
# ============================================================

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Ensure-Dir([string]$p) { if (-not (Test-Path $p)) { New-Item -ItemType Directory -Force -Path $p | Out-Null } }
function Write-Lines([string]$path, [string[]]$lines) { Ensure-Dir (Split-Path -Parent $path); Set-Content -Path $path -Value (($lines -join "`n") + "`n") -Encoding UTF8 }

Write-Lines ".\src\features\pricing\compareApi.ts" @(
  'import { supabaseClient } from ''../../lib/supabase/client'';'
  ''
  'export async function getLatestPricesForStoreItems(storeItemIds: string[]) {'
  '  if (storeItemIds.length === 0) return { data: [], error: null } as any;'
  '  return supabaseClient()'
  '    .from(''latest_price'')'
  '    .select(''*'')'
  '    .in(''store_item_id'', storeItemIds);'
  '}'
)

Write-Host "PHASE 129 COMPLETE"

