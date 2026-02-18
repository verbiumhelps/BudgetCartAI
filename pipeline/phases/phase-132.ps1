# ============================================================
# PHASE 132 — Frontend — Price volatility indicator (subtle)
# ============================================================

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Ensure-Dir([string]$p) { if (-not (Test-Path $p)) { New-Item -ItemType Directory -Force -Path $p | Out-Null } }
function Write-Lines([string]$path, [string[]]$lines) { Ensure-Dir (Split-Path -Parent $path); Set-Content -Path $path -Value (($lines -join "`n") + "`n") -Encoding UTF8 }

Write-Lines ".\docs\ux\price-volatility-indicator.md" @(
  '# Price Volatility Indicator UX'
  ''
  '## Goal'
  '- subtle signal that price moves around'
  ''
  '## Display'
  '- small chip: ''Stable'' / ''Variable'' based on 30d range threshold'
  '- details on tap (min/max/avg)'
  ''
  '## Rules'
  '- never distract from main savings insight'
)

Write-Host "PHASE 132 COMPLETE"

