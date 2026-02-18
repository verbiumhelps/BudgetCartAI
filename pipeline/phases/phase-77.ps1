# ============================================================
# PHASE 77 — List empty states + quick-add affordances
# ============================================================

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Ensure-Dir([string]$p) { if (-not (Test-Path $p)) { New-Item -ItemType Directory -Force -Path $p | Out-Null } }
function Write-Lines([string]$path, [string[]]$lines) { Ensure-Dir (Split-Path -Parent $path); Set-Content -Path $path -Value (($lines -join "`n") + "`n") -Encoding UTF8 }

Write-Lines ".\docs\ux\list-empty-states.md" @(
  '# Grocery List Empty States'
  ''
  '## When no lists'
  '- show primary CTA: Create your first list'
  ''
  '## When list has no items'
  '- show Quick Add field'
  '- show Recent items section (once available)'
  ''
  '## Copy tone'
  '- calm, competent, not goofy'
)

Write-Host "PHASE 77 COMPLETE"

