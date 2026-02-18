# ============================================================
# PHASE 114 — Budget math correctness tests (week boundary, timezones) — QA doc
# ============================================================

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Ensure-Dir([string]$p) { if (-not (Test-Path $p)) { New-Item -ItemType Directory -Force -Path $p | Out-Null } }
function Write-Lines([string]$path, [string[]]$lines) { Ensure-Dir (Split-Path -Parent $path); Set-Content -Path $path -Value (($lines -join "`n") + "`n") -Encoding UTF8 }

Write-Lines ".\docs\qa\budget-math-tests.md" @(
  '# Budget Math Tests'
  ''
  '## Week boundary'
  '- ensure rollup uses deterministic week start'
  ''
  '## Timezones'
  '- purchased_at date treated consistently'
  ''
  '## Edge cases'
  '- receipts on boundary day'
  '- negative adjustments (refunds) later'
)

Write-Host "PHASE 114 COMPLETE"

