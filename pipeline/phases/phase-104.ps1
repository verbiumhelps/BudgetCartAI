# ============================================================
# PHASE 104 — Seed data scripts (stores, categories, sample items) — devops doc
# ============================================================

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Ensure-Dir([string]$p) { if (-not (Test-Path $p)) { New-Item -ItemType Directory -Force -Path $p | Out-Null } }
function Write-Lines([string]$path, [string[]]$lines) { Ensure-Dir (Split-Path -Parent $path); Set-Content -Path $path -Value (($lines -join "`n") + "`n") -Encoding UTF8 }

Write-Lines ".\docs\devops\seed-data.md" @(
  '# Seed Data'
  ''
  '## Stores'
  '- SoCal chains (initial set)'
  ''
  '## Categories'
  '- produce, dairy, meat, pantry, frozen, household, etc.'
  ''
  '## Sample items'
  '- canonical_items for local testing'
  ''
  '## Script plan'
  '- implement seed runner later once schema is stable'
)

Write-Host "PHASE 104 COMPLETE"

