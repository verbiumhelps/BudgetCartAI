# ============================================================
# PHASE 61 — Role management UI + guard utilities
# ============================================================

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Ensure-Dir([string]$p) { if (-not (Test-Path $p)) { New-Item -ItemType Directory -Force -Path $p | Out-Null } }
function Write-Lines([string]$path, [string[]]$lines) { Ensure-Dir (Split-Path -Parent $path); Set-Content -Path $path -Value (($lines -join "`n") + "`n") -Encoding UTF8 }

Write-Lines ".\src\features\households\roles.ts" @(
  'export type HouseholdRole = ''owner'' | ''admin'' | ''member'';'
  ''
  'export function canManageMembers(role: HouseholdRole): boolean {'
  '  return role === ''owner'' || role === ''admin'';'
  '}'
  ''
  'export function canEditHousehold(role: HouseholdRole): boolean {'
  '  return role === ''owner'' || role === ''admin'';'
  '}'
)

Write-Host "PHASE 61 COMPLETE"

