# ============================================================
# PHASE 86 — In-store mode usability regression checklist
# ============================================================

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Ensure-Dir([string]$p) { if (-not (Test-Path $p)) { New-Item -ItemType Directory -Force -Path $p | Out-Null } }
function Write-Lines([string]$path, [string[]]$lines) { Ensure-Dir (Split-Path -Parent $path); Set-Content -Path $path -Value (($lines -join "`n") + "`n") -Encoding UTF8 }

Write-Lines ".\docs\qa\in-store-regression.md" @(
  '# In-Store Mode Regression Checklist'
  ''
  '## Must remain true'
  '- fast open (no spinners if cached)'
  '- check/uncheck is instant'
  '- offline-friendly (later)'
  '- no accidental deletes'
  ''
  '## Device coverage'
  '- small screens'
  '- one-hand usage'
  '- low battery mode'
)

Write-Host "PHASE 86 COMPLETE"

