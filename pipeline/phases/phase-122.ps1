# ============================================================
# PHASE 122 — DevOps — Migration guardrails + rollback procedure documented
# ============================================================

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Ensure-Dir([string]$p) { if (-not (Test-Path $p)) { New-Item -ItemType Directory -Force -Path $p | Out-Null } }
function Write-Lines([string]$path, [string[]]$lines) { Ensure-Dir (Split-Path -Parent $path); Set-Content -Path $path -Value (($lines -join "`n") + "`n") -Encoding UTF8 }

Write-Lines ".\docs\devops\rollback-procedure.md" @(
  '# Migration Guardrails + Rollback'
  ''
  '## Guardrails'
  '- migrations are idempotent'
  '- RLS changes are isolated per migration'
  '- staged rollout (dev -> stage -> prod)'
  ''
  '## Rollback'
  '- prefer forward-fix migrations'
  '- keep a rollback SQL for destructive changes'
  '- verify with smoke queries before/after'
)

Write-Host "PHASE 122 COMPLETE"

