# ============================================================
# PHASE 134 — Frontend — Discount alerts list (opt-in UI + feed)
# ============================================================

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Ensure-Dir([string]$p) { if (-not (Test-Path $p)) { New-Item -ItemType Directory -Force -Path $p | Out-Null } }
function Write-Lines([string]$path, [string[]]$lines) { Ensure-Dir (Split-Path -Parent $path); Set-Content -Path $path -Value (($lines -join "`n") + "`n") -Encoding UTF8 }

Write-Lines ".\docs\ux\discount-alerts.md" @(
  '# Discount Alerts UX (Opt-in)'
  ''
  '## Feed'
  '- list of current ''sale'' signals (v0 heuristic)'
  '- show item + store + price drop % + timestamp'
  ''
  '## Opt-in'
  '- toggle in settings'
  '- allow category/item filter later'
  ''
  '## Tone'
  '- informational, not pushy'
)

Write-Host "PHASE 134 COMPLETE"

