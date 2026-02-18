# ============================================================
# PHASE 121 — Performance — Rollups caching strategy (views/materialized views)
# ============================================================

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Ensure-Dir([string]$p) { if (-not (Test-Path $p)) { New-Item -ItemType Directory -Force -Path $p | Out-Null } }
function Write-Lines([string]$path, [string[]]$lines) { Ensure-Dir (Split-Path -Parent $path); Set-Content -Path $path -Value (($lines -join "`n") + "`n") -Encoding UTF8 }

Write-Lines ".\docs\perf\rollups-caching.md" @(
  '# Rollups Caching Strategy'
  ''
  '## Candidates'
  '- weekly_spend (view now; materialize later if needed)'
  '- expiring soon (view now)'
  ''
  '## Approach'
  '- start with views + indexes'
  '- add materialized views if query costs grow'
  '- refresh strategy documented before enabling'
)

Write-Host "PHASE 121 COMPLETE"

