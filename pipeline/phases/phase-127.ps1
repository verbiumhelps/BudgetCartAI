# ============================================================
# PHASE 127 — Backend — Price normalization rules (per-unit, pack sizes)
# ============================================================

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Ensure-Dir([string]$p) { if (-not (Test-Path $p)) { New-Item -ItemType Directory -Force -Path $p | Out-Null } }
function Write-Lines([string]$path, [string[]]$lines) { Ensure-Dir (Split-Path -Parent $path); Set-Content -Path $path -Value (($lines -join "`n") + "`n") -Encoding UTF8 }

Write-Lines ".\docs\sql\price-normalization.md" @(
  '# Price Normalization Rules'
  ''
  '## Goals'
  '- compute unit_price consistently for comparisons'
  ''
  '## Inputs'
  '- store_items.pack_size (e.g., ''12 oz'', ''1 lb'', ''6 ct'')'
  '- prices.price'
  ''
  '## Rules (v0)'
  '- if unit_price provided, accept'
  '- else compute when pack_size parseable'
  '- else leave null and exclude from unit comparisons'
)

Write-Host "PHASE 127 COMPLETE"

