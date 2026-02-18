# ============================================================
# PHASE 143 — AI/Backend — Recommendation endpoint: cheaper similar at current store
# ============================================================

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Ensure-Dir([string]$p) { if (-not (Test-Path $p)) { New-Item -ItemType Directory -Force -Path $p | Out-Null } }
function Write-Lines([string]$path, [string[]]$lines) { Ensure-Dir (Split-Path -Parent $path); Set-Content -Path $path -Value (($lines -join "`n") + "`n") -Encoding UTF8 }

Write-Lines ".\src\features\recommendations\recommendationsApi.ts" @(
  'import { supabaseClient } from ''../../lib/supabase/client'';'
  ''
  'export type RecommendationQuery = {'
  '  store_id: string;'
  '  canonical_item_id: string;'
  '};'
  ''
  'export async function getCheaperSimilarAtStore(q: RecommendationQuery) {'
  '  // Placeholder: implement via RPC (recommended) once pricing + rules stabilize.'
  '  // Expected RPC: recommend_cheaper_similar(store_id, canonical_item_id)'
  '  return supabaseClient().rpc(''recommend_cheaper_similar'', q as any);'
  '}'
)

Write-Host "PHASE 143 COMPLETE"

