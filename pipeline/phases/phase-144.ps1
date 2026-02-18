# ============================================================
# PHASE 144 — Frontend — In-store substitutions panel (contextual, not chatty)
# ============================================================

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Ensure-Dir([string]$p) { if (-not (Test-Path $p)) { New-Item -ItemType Directory -Force -Path $p | Out-Null } }
function Write-Lines([string]$path, [string[]]$lines) { Ensure-Dir (Split-Path -Parent $path); Set-Content -Path $path -Value (($lines -join "`n") + "`n") -Encoding UTF8 }

Write-Lines ".\docs\ux\in-store-substitutions-panel.md" @(
  '# In-Store Substitutions Panel UX'
  ''
  '## Placement'
  '- contextual inside item row / item detail'
  ''
  '## Content'
  '- 1–3 alternatives max'
  '- show price difference if known'
  ''
  '## Rules'
  '- no chatbot UI'
  '- keep copy short + factual'
)

Write-Host "PHASE 144 COMPLETE"

