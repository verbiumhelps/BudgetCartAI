# ============================================================
# PHASE 92 — Pantry item consumption flow (decrement qty) — module stub
# ============================================================

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Ensure-Dir([string]$p) { if (-not (Test-Path $p)) { New-Item -ItemType Directory -Force -Path $p | Out-Null } }
function Write-Lines([string]$path, [string[]]$lines) { Ensure-Dir (Split-Path -Parent $path); Set-Content -Path $path -Value (($lines -join "`n") + "`n") -Encoding UTF8 }

Write-Lines ".\src\features\pantry\consume.ts" @(
  'import { supabaseClient } from ''../../lib/supabase/client'';'
  ''
  'export async function consumePantryItem(itemId: string, amount: number) {'
  '  // NOTE: real implementation should be transactional (RPC) later.'
  '  const current = await supabaseClient().from(''pantry_items'').select(''quantity'').eq(''id'', itemId).single();'
  '  if (current.error) return current;'
  '  const q = (current.data as any).quantity ?? 0;'
  '  const next = Math.max(0, Number(q) - Number(amount));'
  '  return supabaseClient().from(''pantry_items'').update({ quantity: next }).eq(''id'', itemId).select().single();'
  '}'
)

Write-Host "PHASE 92 COMPLETE"

