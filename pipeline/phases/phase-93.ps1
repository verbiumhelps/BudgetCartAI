# ============================================================
# PHASE 93 — Pantry filters (expiring soon, category, staples) — UX doc
# ============================================================

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Ensure-Dir([string]$p) { if (-not (Test-Path $p)) { New-Item -ItemType Directory -Force -Path $p | Out-Null } }
function Write-Lines([string]$path, [string[]]$lines) { Ensure-Dir (Split-Path -Parent $path); Set-Content -Path $path -Value (($lines -join "`n") + "`n") -Encoding UTF8 }

Write-Lines ".\docs\ux\pantry-filters.md" @(
  '# Pantry Filters UX'
  ''
  '## Filters'
  '- Expiring soon (default quick chip)'
  '- Category (multi-select later)'
  '- Staples (favorites/recurring items later)'
  ''
  '## Rules'
  '- filters should be collapsible'
  '- keep UI minimal'
)

Write-Host "PHASE 93 COMPLETE"

