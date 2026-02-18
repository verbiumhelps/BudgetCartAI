# ============================================================
# PHASE 124 — Backend — Data retention policy + partitioning approach (if needed)
# ============================================================

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Ensure-Dir([string]$p) { if (-not (Test-Path $p)) { New-Item -ItemType Directory -Force -Path $p | Out-Null } }
function Write-Lines([string]$path, [string[]]$lines) { Ensure-Dir (Split-Path -Parent $path); Set-Content -Path $path -Value (($lines -join "`n") + "`n") -Encoding UTF8 }

Write-Lines ".\docs\devops\prices-retention.md" @(
  '# Prices Retention + Partitioning'
  ''
  '## Retention'
  '- keep all history in dev initially'
  '- define prod retention (e.g., 12–24 months) once volume known'
  ''
  '## Partitioning (optional)'
  '- partition by month on captured_at if table grows large'
  '- keep latest-price view indexed'
  ''
  '## Policy'
  '- never delete latest snapshots needed for analytics without replacement'
)

Write-Host "PHASE 124 COMPLETE"

