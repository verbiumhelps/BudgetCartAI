# ============================================================
# PHASE 106 — Set weekly budget onboarding step — UX doc
# ============================================================

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Ensure-Dir([string]$p) { if (-not (Test-Path $p)) { New-Item -ItemType Directory -Force -Path $p | Out-Null } }
function Write-Lines([string]$path, [string[]]$lines) { Ensure-Dir (Split-Path -Parent $path); Set-Content -Path $path -Value (($lines -join "`n") + "`n") -Encoding UTF8 }

Write-Lines ".\docs\ux\budget-onboarding.md" @(
  '# Budget Onboarding UX'
  ''
  '## Goal'
  'Set a weekly budget with a calm, trust-forward feel.'
  ''
  '## Inputs'
  '- weekly budget amount'
  '- optional: typical store'
  ''
  '## Copy guidance'
  '- avoid shame language'
  '- emphasize control + clarity'
)

Write-Host "PHASE 106 COMPLETE"

