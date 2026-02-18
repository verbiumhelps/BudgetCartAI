# ============================================================
# PHASE 120 — QA — Budget + savings consistency checks
# ============================================================

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Ensure-Dir([string]$p) { if (-not (Test-Path $p)) { New-Item -ItemType Directory -Force -Path $p | Out-Null } }
function Write-Lines([string]$path, [string[]]$lines) { Ensure-Dir (Split-Path -Parent $path); Set-Content -Path $path -Value (($lines -join "`n") + "`n") -Encoding UTF8 }

Write-Lines ".\docs\qa\budget-savings-consistency.md" @(
  '# Budget + Savings Consistency Checks'
  ''
  '## Invariants'
  '- weekly_spend rollup must match receipts sum for the week'
  '- savings_events must not reduce spend; it is an informational feed'
  '- projected savings must disclose assumptions'
  ''
  '## Tests'
  '- receipts added -> weekly_spend increases deterministically'
  '- deleting a receipt -> weekly_spend decreases deterministically'
  '- savings event added -> does NOT change weekly_spend'
)

Write-Host "PHASE 120 COMPLETE"

