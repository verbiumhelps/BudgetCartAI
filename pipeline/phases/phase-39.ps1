# ============================================================
# PHASE 39 — Magic link / OTP sign-in option (optional UI + function stubs)
# ============================================================

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Ensure-Dir([string]$p) { if (-not (Test-Path $p)) { New-Item -ItemType Directory -Force -Path $p | Out-Null } }
function Write-Lines([string]$path, [string[]]$lines) { Ensure-Dir (Split-Path -Parent $path); Set-Content -Path $path -Value (($lines -join "`n") + "`n") -Encoding UTF8 }

Write-Lines ".\src\auth\magicLink.ts" @(
  'import { supabaseClient } from ''../lib/supabase/client'';'
  ''
  'export async function sendMagicLink(email: string, redirectTo?: string) {'
  '  return supabaseClient().auth.signInWithOtp({'
  '    email,'
  '    options: redirectTo ? { emailRedirectTo: redirectTo } : undefined,'
  '  });'
  '}'
)

Write-Host "PHASE 39 COMPLETE"

