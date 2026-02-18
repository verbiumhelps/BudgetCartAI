# ============================================================
# PHASE 103 — Cross-household pantry access denial tests — QA doc
# ============================================================

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Ensure-Dir([string]$p) { if (-not (Test-Path $p)) { New-Item -ItemType Directory -Force -Path $p | Out-Null } }
function Write-Lines([string]$path, [string[]]$lines) { Ensure-Dir (Split-Path -Parent $path); Set-Content -Path $path -Value (($lines -join "`n") + "`n") -Encoding UTF8 }

Write-Lines ".\docs\qa\pantry-isolation.md" @(
  '# Pantry Cross-household Isolation'
  ''
  '## Must fail'
  '- read pantry_items from other household'
  '- insert pantry_items into other household'
  '- update/delete other household items'
)

Write-Host "PHASE 103 COMPLETE"

