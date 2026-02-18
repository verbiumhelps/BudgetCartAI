# ============================================================
# PHASE 57 — Accept invite flow + deep link join stub
# ============================================================

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Ensure-Dir([string]$p) { if (-not (Test-Path $p)) { New-Item -ItemType Directory -Force -Path $p | Out-Null } }
function Write-Lines([string]$path, [string[]]$lines) { Ensure-Dir (Split-Path -Parent $path); Set-Content -Path $path -Value (($lines -join "`n") + "`n") -Encoding UTF8 }

Write-Lines ".\src\features\households\acceptInvite.ts" @(
  'import { supabaseClient } from ''../../lib/supabase/client'';'
  ''
  'export async function acceptInvite(token: string, userId: string) {'
  '  // In later phase: validate token, expiry, household permissions via RPC'
  '  const inv = await supabaseClient().from(''household_invites'').select(''*'').eq(''token'', token).single();'
  '  if (inv.error) return inv;'
  '  const household_id = (inv.data as any).household_id;'
  '  const role = ((inv.data as any).role ?? ''member'');'
  '  return supabaseClient().from(''household_members'').insert({ household_id, user_id: userId, role }).select().single();'
  '}'
)

Write-Host "PHASE 57 COMPLETE"

