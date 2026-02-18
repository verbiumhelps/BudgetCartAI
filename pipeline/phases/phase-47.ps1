# ============================================================
# PHASE 47 — Password reset implementation + deep link handling stubs
# ============================================================

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Ensure-Dir([string]$p) { if (-not (Test-Path $p)) { New-Item -ItemType Directory -Force -Path $p | Out-Null } }
function Write-Lines([string]$path, [string[]]$lines) { Ensure-Dir (Split-Path -Parent $path); Set-Content -Path $path -Value (($lines -join "`n") + "`n") -Encoding UTF8 }

Write-Lines ".\src\auth\passwordReset.ts" @(
  'import { supabaseClient } from ''../lib/supabase/client'';'
  ''
  'export async function requestPasswordReset(email: string, redirectTo?: string) {'
  '  return supabaseClient().auth.resetPasswordForEmail(email, redirectTo ? { redirectTo } : undefined);'
  '}'
  ''
  'export async function updatePassword(newPassword: string) {'
  '  return supabaseClient().auth.updateUser({ password: newPassword });'
  '}'
  ''
  '// Deep link handling will be wired in navigation layer (Expo Router).'
)

Write-Host "PHASE 47 COMPLETE"

