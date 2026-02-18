# ============================================================
# PHASE 130 — UX/UI — Price compare UI stays uncluttered (one primary insight)
# ============================================================

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Ensure-Dir([string]$p) { if (-not (Test-Path $p)) { New-Item -ItemType Directory -Force -Path $p | Out-Null } }
function Write-Lines([string]$path, [string[]]$lines) { Ensure-Dir (Split-Path -Parent $path); Set-Content -Path $path -Value (($lines -join "`n") + "`n") -Encoding UTF8 }

Write-Lines ".\docs\ux\price-compare.md" @(
  '# Price Compare UX'
  ''
  '## Primary insight'
  '- ''Cheapest store for your selected items'' (single headline)'
  ''
  '## Secondary'
  '- per-item breakdown collapsible'
  '- unit price shown only when available'
  ''
  '## Rules'
  '- avoid dense tables by default'
  '- show 1–2 stores at a time, with ''compare more'' action'
)

Write-Host "PHASE 130 COMPLETE"

