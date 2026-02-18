# ============================================================
# PHASE 126 — DevOps — Admin-only ingest scripts + validation checks
# ============================================================

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Ensure-Dir([string]$p) { if (-not (Test-Path $p)) { New-Item -ItemType Directory -Force -Path $p | Out-Null } }
function Write-Lines([string]$path, [string[]]$lines) { Ensure-Dir (Split-Path -Parent $path); Set-Content -Path $path -Value (($lines -join "`n") + "`n") -Encoding UTF8 }

Write-Lines ".\docs\devops\admin-ingest.md" @(
  '# Admin Ingest (Pricing)'
  ''
  '## Constraints'
  '- admin-only (service role key; never shipped to client)'
  '- validate CSV schema before insert'
  '- reject rows with missing store_item_id or price'
  ''
  '## Checks'
  '- store_item_id exists'
  '- price >= 0'
  '- captured_at parseable'
  ''
  '## Logging'
  '- write bad rows to a reject file'
  '- summary counts (inserted/rejected)'
)

Write-Host "PHASE 126 COMPLETE"

