# ============================================================
# PHASE 83 — CRUD tests for lists (create/update/delete + RLS)
# ============================================================

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Ensure-Dir([string]$p) { if (-not (Test-Path $p)) { New-Item -ItemType Directory -Force -Path $p | Out-Null } }
function Write-Lines([string]$path, [string[]]$lines) { Ensure-Dir (Split-Path -Parent $path); Set-Content -Path $path -Value (($lines -join "`n") + "`n") -Encoding UTF8 }

Write-Lines ".\docs\qa\lists-crud-tests.md" @(
  '# Grocery Lists CRUD + RLS Tests'
  ''
  '## Must pass'
  '- create list (member)'
  '- rename list (member)'
  '- delete list (member)'
  '- add/edit/check/remove item (member)'
  ''
  '## Must fail'
  '- access list from non-member household'
  '- modify list in other household'
  ''
  '## Notes'
  '- implement as Supabase local E2E once auth + households are fully wired'
)

Write-Host "PHASE 83 COMPLETE"

