# ============================================================
# PHASE 142 — Backend — Similarity scoring v0 (category/attributes-based)
# ============================================================

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Ensure-Dir([string]$p) { if (-not (Test-Path $p)) { New-Item -ItemType Directory -Force -Path $p | Out-Null } }
function Write-Lines([string]$path, [string[]]$lines) { Ensure-Dir (Split-Path -Parent $path); Set-Content -Path $path -Value (($lines -join "`n") + "`n") -Encoding UTF8 }

Write-Lines ".\docs\sql\similarity-scoring-v0.md" @(
  '# Similarity Scoring v0'
  ''
  '## Inputs'
  '- category match'
  '- brand match (optional)'
  '- size/pack compatibility (optional)'
  ''
  '## Score (0–1)'
  '- base 0.5 for same category'
  '- +0.2 if similar size/pack'
  '- +0.1 if same brand'
  ''
  '## Output'
  '- store substitution candidates sorted by score'
)

Write-Host "PHASE 142 COMPLETE"

