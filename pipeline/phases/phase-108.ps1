# ============================================================
# PHASE 108 — Add a receipt total + date + store (manual input) — module stub
# ============================================================

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Ensure-Dir([string]$p) { if (-not (Test-Path $p)) { New-Item -ItemType Directory -Force -Path $p | Out-Null } }
function Write-Lines([string]$path, [string[]]$lines) { Ensure-Dir (Split-Path -Parent $path); Set-Content -Path $path -Value (($lines -join "`n") + "`n") -Encoding UTF8 }

Write-Lines ".\src\features\budget\receiptsApi.ts" @(
  'import { supabaseClient } from ''../../lib/supabase/client'';'
  ''
  'export type ReceiptInput = { household_id: string; store_id?: string; purchased_at: string; total: number };'
  ''
  'export async function addReceipt(input: ReceiptInput) {'
  '  return supabaseClient().from(''receipts'').insert(input).select().single();'
  '}'
  ''
  'export async function listReceipts(householdId: string, limit = 50) {'
  '  return supabaseClient().from(''receipts'').select(''*'').eq(''household_id'', householdId).order(''purchased_at'', { ascending: false }).limit(limit);'
  '}'
)

Write-Host "PHASE 108 COMPLETE"

