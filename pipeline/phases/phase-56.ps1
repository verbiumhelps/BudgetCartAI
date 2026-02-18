# ============================================================
# PHASE 56 — Invite member UI + send invite module stub
# ============================================================

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Ensure-Dir([string]$p) { if (-not (Test-Path $p)) { New-Item -ItemType Directory -Force -Path $p | Out-Null } }
function Write-Lines([string]$path, [string[]]$lines) { Ensure-Dir (Split-Path -Parent $path); Set-Content -Path $path -Value (($lines -join "`n") + "`n") -Encoding UTF8 }

Write-Lines ".\src\features\households\inviteMember.ts" @(
  'import { supabaseClient } from ''../../lib/supabase/client'';'
  ''
  'export async function createInvite(householdId: string, email: string, role: ''admin''|''member'') {'
  '  // token generation should be server-side (RPC/edge) in later phase'
  '  const token = ''stub-token'';'
  '  const expires_at = new Date(Date.now() + 7*24*60*60*1000).toISOString();'
  '  return supabaseClient().from(''household_invites'').insert({ household_id: householdId, email, role, token, expires_at }).select().single();'
  '}'
)

Write-Host "PHASE 56 COMPLETE"

