# ============================================================
# PHASE 138 — Performance — Index tuning for price queries (store/item/time)
# ============================================================

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Ensure-Dir([string]$p) { if (-not (Test-Path $p)) { New-Item -ItemType Directory -Force -Path $p | Out-Null } }
function Write-Lines([string]$path, [string[]]$lines) { Ensure-Dir (Split-Path -Parent $path); Set-Content -Path $path -Value (($lines -join "`n") + "`n") -Encoding UTF8 }

Write-Lines ".\docs\perf\price-index-tuning.md" @(
  '# Price Query Index Tuning'
  ''
  '## Current index'
  '- prices(store_item_id, captured_at desc)'
  ''
  '## Candidates'
  '- prices(captured_at desc) for global feeds'
  '- store_items(store_id, canonical_item_id)'
  ''
  '## Measure'
  '- EXPLAIN ANALYZE key queries before changes'
)

Write-Host "PHASE 138 COMPLETE"

