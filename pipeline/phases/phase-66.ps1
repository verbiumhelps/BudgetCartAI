# ============================================================
# PHASE 66 — DB migration workflow + naming conventions doc/guardrail
# ============================================================

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Ensure-Dir([string]$p) { if (-not (Test-Path $p)) { New-Item -ItemType Directory -Force -Path $p | Out-Null } }
function Write-Lines([string]$path, [string[]]$lines) { Ensure-Dir (Split-Path -Parent $path); Set-Content -Path $path -Value (($lines -join "`n") + "`n") -Encoding UTF8 }

Write-Lines ".\docs\devops\migrations-workflow.md" @(
  '# Database Migration Workflow'
  ''
  '## Naming'
  '- supabase/migrations/NNN_slug.sql (NNN matches phase or sequence)'
  ''
  '## Rules'
  '- idempotent SQL (create table if not exists, safe alters)'
  '- keep RLS policies in separate migrations'
  '- review in PR before applying to prod'
  ''
  '## Environments'
  '- dev: local supabase'
  '- stage: staging project'
  '- prod: production project'
)

Write-Host "PHASE 66 COMPLETE"

