# ============================================================
# PHASE 101 — Pantry query indexing + pagination strategy — perf doc
# ============================================================

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Ensure-Dir([string]$p) { if (-not (Test-Path $p)) { New-Item -ItemType Directory -Force -Path $p | Out-Null } }
function Write-Lines([string]$path, [string[]]$lines) { Ensure-Dir (Split-Path -Parent $path); Set-Content -Path $path -Value (($lines -join "`n") + "`n") -Encoding UTF8 }

Write-Lines ".\docs\perf\pantry-indexing.md" @(
  '# Pantry Indexing + Pagination'
  ''
  '## Index ideas'
  '- (household_id, expires_at)'
  '- (household_id, created_at)'
  ''
  '## Pagination'
  '- default: newest first'
  '- use limit + created_at cursor'
)

Write-Host "PHASE 101 COMPLETE"

