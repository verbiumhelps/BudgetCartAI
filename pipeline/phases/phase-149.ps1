# ============================================================
# PHASE 149 — Frontend — Preferences settings UI (simple toggles + exclusions list)
# ============================================================

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Ensure-Dir([string]$p) { if (-not (Test-Path $p)) { New-Item -ItemType Directory -Force -Path $p | Out-Null } }
function Write-Lines([string]$path, [string[]]$lines) { Ensure-Dir (Split-Path -Parent $path); Set-Content -Path $path -Value (($lines -join "`n") + "`n") -Encoding UTF8 }

Write-Lines ".\docs\ux\preferences.md" @(
  '# Preferences UI'
  ''
  '## Controls (v0)'
  '- dietary toggles (e.g., vegetarian, gluten-free) stored as flags'
  '- brand exclusions list (free text v0)'
  ''
  '## Rules'
  '- keep minimal by default'
  '- advanced options hidden behind ''More'''
  ''
  '## Tone'
  '- calm, non-judgmental'
)

Write-Host "PHASE 149 COMPLETE"

