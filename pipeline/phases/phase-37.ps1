# ============================================================
# PHASE 37 — Email/password sign-up + sign-in scaffolding
# ============================================================

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Ensure-Dir([string]$p) { if (-not (Test-Path $p)) { New-Item -ItemType Directory -Force -Path $p | Out-Null } }
function Write-Lines([string]$path, [string[]]$lines) { Ensure-Dir (Split-Path -Parent $path); Set-Content -Path $path -Value (($lines -join "`n") + "`n") -Encoding UTF8 }

Write-Lines ".\src\auth\emailPassword.ts" @(
  'import { supabaseClient } from ''../lib/supabase/client'';'
  ''
  'export async function signUp(email: string, password: string) {'
  '  return supabaseClient().auth.signUp({ email, password });'
  '}'
  ''
  'export async function signIn(email: string, password: string) {'
  '  return supabaseClient().auth.signInWithPassword({ email, password });'
  '}'
)

Write-Host "PHASE 37 COMPLETE"

