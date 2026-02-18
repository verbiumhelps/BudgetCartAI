# ============================================================
# PHASE 71 — Store selection UI (choose preferred store(s))
# ============================================================

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Ensure-Dir([string]$p) { if (-not (Test-Path $p)) { New-Item -ItemType Directory -Force -Path $p | Out-Null } }
function Write-Lines([string]$path, [string[]]$lines) { Ensure-Dir (Split-Path -Parent $path); Set-Content -Path $path -Value (($lines -join "`n") + "`n") -Encoding UTF8 }

Write-Lines ".\docs\ux\store-selection.md" @(
  '# Store Selection UX'
  ''
  '## Goal'
  'Let user choose preferred store(s) for pricing + substitutions.'
  ''
  '## States'
  '- first run: pick one primary store'
  '- later: manage multiple stores (optional)'
  ''
  '## Constraints'
  '- keep uncluttered'
  '- default to SoCal branded store list'
)

Write-Host "PHASE 71 COMPLETE"

