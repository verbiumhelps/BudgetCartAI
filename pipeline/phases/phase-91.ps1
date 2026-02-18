# ============================================================
# PHASE 91 — Add pantry item (manual entry) + edit flow — module stub
# ============================================================

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Ensure-Dir([string]$p) { if (-not (Test-Path $p)) { New-Item -ItemType Directory -Force -Path $p | Out-Null } }
function Write-Lines([string]$path, [string[]]$lines) { Ensure-Dir (Split-Path -Parent $path); Set-Content -Path $path -Value (($lines -join "`n") + "`n") -Encoding UTF8 }

Write-Lines ".\src\features\pantry\pantryApi.ts" @(
  'import { supabaseClient } from ''../../lib/supabase/client'';'
  ''
  'export type PantryItemInput = {'
  '  household_id: string;'
  '  label: string;'
  '  canonical_item_id?: string;'
  '  quantity?: number;'
  '  unit?: string;'
  '  purchased_at?: string; // YYYY-MM-DD'
  '  expires_at?: string;   // YYYY-MM-DD'
  '};'
  ''
  'export async function addPantryItem(input: PantryItemInput) {'
  '  return supabaseClient().from(''pantry_items'').insert(input).select().single();'
  '}'
  ''
  'export async function updatePantryItem(id: string, patch: Partial<PantryItemInput>) {'
  '  return supabaseClient().from(''pantry_items'').update(patch).eq(''id'', id).select().single();'
  '}'
)

Write-Host "PHASE 91 COMPLETE"

