# ============================================================
# PHASE 90 — Pantry home screen (summary + item list) — UX doc
# ============================================================

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Ensure-Dir([string]$p) { if (-not (Test-Path $p)) { New-Item -ItemType Directory -Force -Path $p | Out-Null } }
function Write-Lines([string]$path, [string[]]$lines) { Ensure-Dir (Split-Path -Parent $path); Set-Content -Path $path -Value (($lines -join "`n") + "`n") -Encoding UTF8 }

Write-Lines ".\docs\ux\pantry-home.md" @(
  '# Pantry Home UX'
  ''
  '## Sections'
  '- Summary (staples count, expiring soon count)'
  '- Item list (sorted by expiry by default)'
  ''
  '## Actions'
  '- Add item'
  '- Edit item'
  '- Consume item'
  ''
  '## Tone'
  '- calm, helpful, not gamified'
)

Write-Host "PHASE 90 COMPLETE"

