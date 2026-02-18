# ============================================================
# PHASE 98 — Pantry-to-list action (generate list items from low stock) — scaffold
# ============================================================

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Ensure-Dir([string]$p) { if (-not (Test-Path $p)) { New-Item -ItemType Directory -Force -Path $p | Out-Null } }
function Write-Lines([string]$path, [string[]]$lines) { Ensure-Dir (Split-Path -Parent $path); Set-Content -Path $path -Value (($lines -join "`n") + "`n") -Encoding UTF8 }

Write-Lines ".\docs\phase-notes\phase-98-pantry-to-list.md" @(
  '# Pantry → List (Low Stock) Scaffold'
  ''
  '## Concept'
  '- Identify low-stock staples and suggest adding to a grocery list.'
  ''
  '## Next implementation steps'
  '- Define low-stock thresholds'
  '- Add RPC to generate suggestions'
  '- UI: one-tap add'
)

Write-Host "PHASE 98 COMPLETE"

