# ============================================================
# PHASE 34 — Supabase typed exports + client wrapper API surface
# ============================================================

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Ensure-Dir([string]$p) { if (-not (Test-Path $p)) { New-Item -ItemType Directory -Force -Path $p | Out-Null } }
function Write-Lines([string]$path, [string[]]$lines) { Ensure-Dir (Split-Path -Parent $path); Set-Content -Path $path -Value (($lines -join "`n") + "`n") -Encoding UTF8 }

Write-Lines ".\src\lib\supabase\index.ts" @(
  'export { supabaseClient } from ''./client'';'
  'export type { Session, User } from ''@supabase/supabase-js'';'
)

Write-Host "PHASE 34 COMPLETE"

