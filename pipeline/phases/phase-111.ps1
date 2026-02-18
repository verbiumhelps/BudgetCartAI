# ============================================================
# PHASE 111 — Calm, trust-forward budget visualization states — UX doc
# ============================================================

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Ensure-Dir([string]$p) { if (-not (Test-Path $p)) { New-Item -ItemType Directory -Force -Path $p | Out-Null } }
function Write-Lines([string]$path, [string[]]$lines) { Ensure-Dir (Split-Path -Parent $path); Set-Content -Path $path -Value (($lines -join "`n") + "`n") -Encoding UTF8 }

Write-Lines ".\docs\ux\budget-visual-states.md" @(
  '# Budget Visual States'
  ''
  '## States'
  '- on track'
  '- nearing limit'
  '- over limit (non-shaming)'
  ''
  '## Copy tone'
  '- neutral and helpful'
  '- actionable suggestions, not guilt'
)

Write-Host "PHASE 111 COMPLETE"

