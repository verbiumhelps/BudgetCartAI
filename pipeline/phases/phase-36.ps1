# ============================================================
# PHASE 36 — Auth entry UX routes (Sign in / Sign up / Continue)
# ============================================================

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Ensure-Dir([string]$p) { if (-not (Test-Path $p)) { New-Item -ItemType Directory -Force -Path $p | Out-Null } }
function Write-Lines([string]$path, [string[]]$lines) { Ensure-Dir (Split-Path -Parent $path); Set-Content -Path $path -Value (($lines -join "`n") + "`n") -Encoding UTF8 }

Write-Lines ".\src\auth\routes.ts" @(
  'export type AuthRoute = ''sign_in'' | ''sign_up'' | ''continue'' | ''reset_password'';'
  'export const AUTH_ROUTES: AuthRoute[] = [''sign_in'',''sign_up'',''continue'',''reset_password''];'
)

Write-Host "PHASE 36 COMPLETE"

