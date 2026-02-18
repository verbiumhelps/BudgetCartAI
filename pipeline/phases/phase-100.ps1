# ============================================================
# PHASE 100 — Pantry CRUD + event log integrity tests — doc scaffold
# ============================================================

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Ensure-Dir([string]$p) { if (-not (Test-Path $p)) { New-Item -ItemType Directory -Force -Path $p | Out-Null } }
function Write-Lines([string]$path, [string[]]$lines) { Ensure-Dir (Split-Path -Parent $path); Set-Content -Path $path -Value (($lines -join "`n") + "`n") -Encoding UTF8 }

Write-Lines ".\docs\qa\pantry-tests.md" @(
  '# Pantry Tests'
  ''
  '## CRUD'
  '- add item'
  '- edit item'
  '- consume item'
  ''
  '## Event integrity'
  '- add → pantry_events add'
  '- consume → pantry_events consume'
  '- adjust → pantry_events adjust'
  ''
  '## RLS'
  '- cross-household denial'
)

Write-Host "PHASE 100 COMPLETE"

