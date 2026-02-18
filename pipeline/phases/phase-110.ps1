# ============================================================
# PHASE 110 — Budget dashboard: spent vs budget (basic) — UX doc
# ============================================================

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Ensure-Dir([string]$p) { if (-not (Test-Path $p)) { New-Item -ItemType Directory -Force -Path $p | Out-Null } }
function Write-Lines([string]$path, [string[]]$lines) { Ensure-Dir (Split-Path -Parent $path); Set-Content -Path $path -Value (($lines -join "`n") + "`n") -Encoding UTF8 }

Write-Lines ".\docs\ux\budget-dashboard.md" @(
  '# Budget Dashboard UX'
  ''
  '## Primary card'
  '- weekly budget'
  '- spent so far'
  '- remaining'
  ''
  '## Rules'
  '- calm visualization'
  '- avoid aggressive alerts'
  '- highlight savings wins subtly'
)

Write-Host "PHASE 110 COMPLETE"

