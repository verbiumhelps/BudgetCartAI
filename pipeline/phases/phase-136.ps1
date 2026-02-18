# ============================================================
# PHASE 136 — Frontend — Manage alert preferences UI
# ============================================================

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Ensure-Dir([string]$p) { if (-not (Test-Path $p)) { New-Item -ItemType Directory -Force -Path $p | Out-Null } }
function Write-Lines([string]$path, [string[]]$lines) { Ensure-Dir (Split-Path -Parent $path); Set-Content -Path $path -Value (($lines -join "`n") + "`n") -Encoding UTF8 }

Write-Lines ".\docs\ux\alert-preferences.md" @(
  '# Alert Preferences UX'
  ''
  '## Controls'
  '- master toggle'
  '- filter by store (optional)'
  '- filter by category'
  '- pin specific items'
  ''
  '## Rules'
  '- minimal choices first'
  '- advanced options behind ''More'''
  ''
  '## Copy tone'
  '- helpful and neutral'
)

Write-Host "PHASE 136 COMPLETE"

