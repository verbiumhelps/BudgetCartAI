# ============================================================
# PHASE 119 — Projected savings card on dashboard (v0) — UX doc
# ============================================================

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Ensure-Dir([string]$p) { if (-not (Test-Path $p)) { New-Item -ItemType Directory -Force -Path $p | Out-Null } }
function Write-Lines([string]$path, [string[]]$lines) { Ensure-Dir (Split-Path -Parent $path); Set-Content -Path $path -Value (($lines -join "`n") + "`n") -Encoding UTF8 }

Write-Lines ".\docs\ux\projected-savings-card.md" @(
  '# Projected Savings Card (v0)'
  ''
  '## Display'
  '- estimated savings this week (range optional later)'
  '- short ''why'' statement (assumptions)'
  '- link to details (future)'
  ''
  '## Guardrails'
  '- secondary insight, never dominates'
  '- calm, factual tone'
  '- no gamified celebration UI'
)

Write-Host "PHASE 119 COMPLETE"

