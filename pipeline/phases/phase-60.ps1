# ============================================================
# PHASE 60 — Household settings screens (name/members list/roles)
# ============================================================

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Ensure-Dir([string]$p) { if (-not (Test-Path $p)) { New-Item -ItemType Directory -Force -Path $p | Out-Null } }
function Write-Lines([string]$path, [string[]]$lines) { Ensure-Dir (Split-Path -Parent $path); Set-Content -Path $path -Value (($lines -join "`n") + "`n") -Encoding UTF8 }

Write-Lines ".\docs\ux\household-settings.md" @(
  '# Household Settings UX'
  ''
  '## Sections'
  '- Household name + region'
  '- Members list (role badge, last active later)'
  '- Actions: invite, remove, promote/demote (guarded)'
  ''
  '## Tone'
  '- Calm, administrative, trust-forward (no gamification)'
)

Write-Host "PHASE 60 COMPLETE"

