# ============================================================
# PHASE 48 — Auth security regression tests scaffolding
# ============================================================

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Ensure-Dir([string]$p) { if (-not (Test-Path $p)) { New-Item -ItemType Directory -Force -Path $p | Out-Null } }
function Write-Lines([string]$path, [string[]]$lines) { Ensure-Dir (Split-Path -Parent $path); Set-Content -Path $path -Value (($lines -join "`n") + "`n") -Encoding UTF8 }

Write-Lines ".\docs\qa\auth-security-regression.md" @(
  '# Auth Security Regression'
  ''
  '## Cases'
  '- Expired session token should force re-auth'
  '- Invalid/garbled session should clear local state'
  '- Refresh token failures should not loop indefinitely'
  '- Password reset links must be single-use (server-side)'
  ''
  '## Notes'
  '- Implement E2E once navigation/screens are wired.'
)

Write-Host "PHASE 48 COMPLETE"

