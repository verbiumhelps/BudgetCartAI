# ============================================================
# PHASE 133 — Backend — Sale detection heuristic (drop vs trailing average)
# ============================================================

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Ensure-Dir([string]$p) { if (-not (Test-Path $p)) { New-Item -ItemType Directory -Force -Path $p | Out-Null } }
function Write-Lines([string]$path, [string[]]$lines) { Ensure-Dir (Split-Path -Parent $path); Set-Content -Path $path -Value (($lines -join "`n") + "`n") -Encoding UTF8 }

Write-Lines ".\docs\sql\sale-detection.md" @(
  '# Sale Detection Heuristic (v0)'
  ''
  '## Inputs'
  '- latest price'
  '- 30d average price'
  ''
  '## Rule (v0)'
  '- if latest <= (avg_30d * (1 - threshold)) => sale'
  '- start threshold at 10–15%'
  ''
  '## Notes'
  '- avoid false positives for irregular items'
  '- incorporate unit_price when available'
)

Write-Host "PHASE 133 COMPLETE"

