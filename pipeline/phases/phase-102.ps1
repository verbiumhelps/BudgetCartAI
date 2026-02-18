# ============================================================
# PHASE 102 — Pantry empty states + guided first add — UX doc
# ============================================================

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Ensure-Dir([string]$p) { if (-not (Test-Path $p)) { New-Item -ItemType Directory -Force -Path $p | Out-Null } }
function Write-Lines([string]$path, [string[]]$lines) { Ensure-Dir (Split-Path -Parent $path); Set-Content -Path $path -Value (($lines -join "`n") + "`n") -Encoding UTF8 }

Write-Lines ".\docs\ux\pantry-empty-states.md" @(
  '# Pantry Empty States'
  ''
  '## First-time'
  '- explain value: expiring soon + waste reduction'
  '- primary CTA: Add first item'
  ''
  '## Subsequent empty'
  '- show recent items as suggestions (later)'
)

Write-Host "PHASE 102 COMPLETE"

