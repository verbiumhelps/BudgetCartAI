# ============================================================
# PHASE 95 — Expiring soon section + notifications toggle (UI only) — UX doc
# ============================================================

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Ensure-Dir([string]$p) { if (-not (Test-Path $p)) { New-Item -ItemType Directory -Force -Path $p | Out-Null } }
function Write-Lines([string]$path, [string[]]$lines) { Ensure-Dir (Split-Path -Parent $path); Set-Content -Path $path -Value (($lines -join "`n") + "`n") -Encoding UTF8 }

Write-Lines ".\docs\ux\expiring-soon.md" @(
  '# Expiring Soon UX'
  ''
  '## Section'
  '- show items expiring within 7 days'
  '- group by: soon (<=3 days), week (<=7 days)'
  ''
  '## Notification toggle (UI only for now)'
  '- allow opt-in later when push is wired'
)

Write-Host "PHASE 95 COMPLETE"

