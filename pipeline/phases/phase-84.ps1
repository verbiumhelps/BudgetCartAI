# ============================================================
# PHASE 84 — List rendering optimization (large list virtualization)
# ============================================================

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Ensure-Dir([string]$p) { if (-not (Test-Path $p)) { New-Item -ItemType Directory -Force -Path $p | Out-Null } }
function Write-Lines([string]$path, [string[]]$lines) { Ensure-Dir (Split-Path -Parent $path); Set-Content -Path $path -Value (($lines -join "`n") + "`n") -Encoding UTF8 }

Write-Lines ".\docs\perf\list-virtualization.md" @(
  '# List Virtualization Plan'
  ''
  '## Goal'
  'Support 200+ items without jank.'
  ''
  '## Approach'
  '- Use virtualized list component'
  '- Stable keys'
  '- Minimize re-renders on check/uncheck'
  ''
  '## Metrics'
  '- scroll FPS'
  '- time to interactive'
  '- memory usage'
)

Write-Host "PHASE 84 COMPLETE"

