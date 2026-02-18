# ============================================================
# PHASE 113 — Basic analytics page (weekly trend) — UX doc
# ============================================================

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Ensure-Dir([string]$p) { if (-not (Test-Path $p)) { New-Item -ItemType Directory -Force -Path $p | Out-Null } }
function Write-Lines([string]$path, [string[]]$lines) { Ensure-Dir (Split-Path -Parent $path); Set-Content -Path $path -Value (($lines -join "`n") + "`n") -Encoding UTF8 }

Write-Lines ".\docs\ux\analytics-weekly-trend.md" @(
  '# Weekly Trend Analytics UX'
  ''
  '## View'
  '- weekly spend line over last 8–12 weeks'
  '- optional average line later'
  ''
  '## Rules'
  '- keep uncluttered'
  '- default to last 8 weeks'
)

Write-Host "PHASE 113 COMPLETE"

