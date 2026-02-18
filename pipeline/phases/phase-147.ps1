# ============================================================
# PHASE 147 — Frontend — Out-of-stock substitution UX in list
# ============================================================

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Ensure-Dir([string]$p) { if (-not (Test-Path $p)) { New-Item -ItemType Directory -Force -Path $p | Out-Null } }
function Write-Lines([string]$path, [string[]]$lines) { Ensure-Dir (Split-Path -Parent $path); Set-Content -Path $path -Value (($lines -join "`n") + "`n") -Encoding UTF8 }

Write-Lines ".\docs\ux\out-of-stock-ux.md" @(
  '# Out-of-Stock UX'
  ''
  '## Flow'
  '- long-press item -> ''Out of stock'''
  '- show alternatives panel'
  '- one-tap replace item'
  ''
  '## Rules'
  '- never block checkout flow'
  '- allow dismissing suggestions quickly'
)

Write-Host "PHASE 147 COMPLETE"

