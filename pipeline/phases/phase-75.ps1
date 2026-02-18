# ============================================================
# PHASE 75 — Grocery list creation + rename + delete
# ============================================================

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Ensure-Dir([string]$p) { if (-not (Test-Path $p)) { New-Item -ItemType Directory -Force -Path $p | Out-Null } }
function Write-Lines([string]$path, [string[]]$lines) { Ensure-Dir (Split-Path -Parent $path); Set-Content -Path $path -Value (($lines -join "`n") + "`n") -Encoding UTF8 }

Write-Lines ".\src\features\lists\listsApi.ts" @(
  'import { supabaseClient } from ''../../lib/supabase/client'';'
  ''
  'export async function createList(householdId: string, name: string) {'
  '  return supabaseClient().from(''grocery_lists'').insert({ household_id: householdId, name }).select().single();'
  '}'
  ''
  'export async function renameList(listId: string, name: string) {'
  '  return supabaseClient().from(''grocery_lists'').update({ name }).eq(''id'', listId).select().single();'
  '}'
  ''
  'export async function deleteList(listId: string) {'
  '  return supabaseClient().from(''grocery_lists'').delete().eq(''id'', listId);'
  '}'
)

Write-Host "PHASE 75 COMPLETE"

