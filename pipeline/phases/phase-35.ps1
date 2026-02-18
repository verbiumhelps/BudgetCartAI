# ============================================================
# PHASE 35 — Secure env loading + runtime validation (fail fast)
# ============================================================

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Ensure-Dir([string]$p) { if (-not (Test-Path $p)) { New-Item -ItemType Directory -Force -Path $p | Out-Null } }
function Write-Lines([string]$path, [string[]]$lines) { Ensure-Dir (Split-Path -Parent $path); Set-Content -Path $path -Value (($lines -join "`n") + "`n") -Encoding UTF8 }

Write-Lines ".\src\config\env.ts" @(
  'export function getEnv() {'
  '  const url = process.env.EXPO_PUBLIC_SUPABASE_URL;'
  '  const key = process.env.EXPO_PUBLIC_SUPABASE_ANON_KEY;'
  '  if (!url || !key) throw new Error(''Missing Supabase env'');'
  '  return { supabaseUrl: url, supabaseAnonKey: key };'
  '}'
)

Write-Host "PHASE 35 COMPLETE"

