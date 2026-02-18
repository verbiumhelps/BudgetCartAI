# ============================================================
# PHASE 137 — QA — Pricing ingest validation tests (bad rows, missing fields)
# ============================================================

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Ensure-Dir([string]$p) { if (-not (Test-Path $p)) { New-Item -ItemType Directory -Force -Path $p | Out-Null } }
function Write-Lines([string]$path, [string[]]$lines) { Ensure-Dir (Split-Path -Parent $path); Set-Content -Path $path -Value (($lines -join "`n") + "`n") -Encoding UTF8 }

Write-Lines ".\docs\qa\pricing-ingest-validation.md" @(
  '# Pricing Ingest Validation Tests'
  ''
  '## Reject cases'
  '- missing store_item_id'
  '- missing price'
  '- price < 0'
  '- invalid captured_at format'
  ''
  '## Accept cases'
  '- unit_price missing but pack_size parseable later'
  '- captured_at omitted (defaults now)'
  ''
  '## Outputs'
  '- inserted count'
  '- rejected rows file'
)

Write-Host "PHASE 137 COMPLETE"

