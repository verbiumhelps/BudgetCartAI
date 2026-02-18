# ============================================================
# PHASE 145 — UX/UI — Explainability pattern (why this is similar/cheaper)
# ============================================================

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Ensure-Dir([string]$p) { if (-not (Test-Path $p)) { New-Item -ItemType Directory -Force -Path $p | Out-Null } }
function Write-Lines([string]$path, [string[]]$lines) { Ensure-Dir (Split-Path -Parent $path); Set-Content -Path $path -Value (($lines -join "`n") + "`n") -Encoding UTF8 }

Write-Lines ".\docs\ux\substitution-explainability.md" @(
  '# Substitution Explainability'
  ''
  '## Must answer'
  '- why similar (category/size/brand)'
  '- why cheaper (latest price vs current)'
  ''
  '## Copy examples'
  '- ''Same category, similar size, currently $1.20 less at this store.'''
  ''
  '## Guardrails'
  '- avoid overconfidence'
  '- show ''price last updated'' timestamp'
)

Write-Host "PHASE 145 COMPLETE"

