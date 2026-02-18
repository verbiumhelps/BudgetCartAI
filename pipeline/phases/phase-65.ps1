# ============================================================
# PHASE 65 — Membership negative tests scaffold (non-admin denied)
# ============================================================

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Ensure-Dir([string]$p) { if (-not (Test-Path $p)) { New-Item -ItemType Directory -Force -Path $p | Out-Null } }
function Write-Lines([string]$path, [string[]]$lines) { Ensure-Dir (Split-Path -Parent $path); Set-Content -Path $path -Value (($lines -join "`n") + "`n") -Encoding UTF8 }

Write-Lines ".\docs\qa\membership-negative-tests.md" @(
  '# Membership Negative Tests'
  ''
  '## Goal'
  'Ensure non-admin/non-owner cannot perform privileged membership actions.'
  ''
  '## Must fail (denied)'
  '- member promotes/demotes another member'
  '- member removes another member'
  '- member creates invites'
  '- member edits household name/region'
  ''
  '## Must pass'
  '- admin/owner can invite, promote/demote, remove'
  '- members can read household + members list'
)

Write-Host "PHASE 65 COMPLETE"

