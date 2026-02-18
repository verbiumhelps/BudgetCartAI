Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Ensure-Dir([string]$p) { if (-not (Test-Path $p)) { New-Item -ItemType Directory -Force -Path $p | Out-Null } }
function Write-Lines([string]$path, [string[]]$lines) { Ensure-Dir (Split-Path -Parent $path); $t = ($lines -join "`n") + "`n"; Set-Content -Path $path -Value $t -Encoding UTF8 }

# Directories
Ensure-Dir ".\pipeline\phases"
Ensure-Dir ".\scripts"
Ensure-Dir ".\docs"
Ensure-Dir ".\docs\ux"
Ensure-Dir ".\docs\qa"
Ensure-Dir ".\docs\devops"
Ensure-Dir ".\docs\perf"
Ensure-Dir ".\docs\sql"
Ensure-Dir ".\supabase\migrations"
Ensure-Dir ".\src\lib\supabase"
Ensure-Dir ".\src\config"
Ensure-Dir ".\src\auth"
Ensure-Dir ".\src\features\households"
Ensure-Dir ".\src\features\lists"
Ensure-Dir ".\src\features\pantry"
Ensure-Dir ".\src\features\budget"
Ensure-Dir ".\src\features\pricing"
Ensure-Dir ".\src\features\recommendations"
Ensure-Dir ".\.github\workflows"

# state.json (0–149) using hashtable (no Add-Member numeric key bug)
$phases = [ordered]@{}
for ($i=0; $i -le 149; $i++) { $phases["$i"] = "not_started" }
$state = [ordered]@{ current_phase = 33; phases = $phases }
$state | ConvertTo-Json -Depth 20 | Set-Content -Path ".\pipeline\state.json" -Encoding UTF8

# ring runner file (plain text lines)
Write-Lines ".\scripts\ring-33-149.ps1" @(
  "Set-StrictMode -Version Latest",
  '$ErrorActionPreference = "Stop"',
  "",
  '$statePath = ".\pipeline\state.json"',
  'if (-not (Test-Path $statePath)) { throw "Missing pipeline/state.json" }',
  '$state = Get-Content $statePath -Raw -Encoding UTF8 | ConvertFrom-Json',
  '[int]$phase = $state.current_phase',
  'if ($phase -lt 33) { throw "current_phase is $phase; expected >= 33 for this runner." }',
  'if ($phase -gt 149) { Write-Host "ALL PHASES (33–149) COMPLETE"; exit 0 }',
  "",
  '$phaseKey = "$phase"',
  '$scriptPath = ".\pipeline\phases\phase-" + $phase + ".ps1"',
  'if (-not (Test-Path $scriptPath)) { throw "Missing phase script: " + $scriptPath }',
  "",
  'Write-Host ("=== Running Phase {0} ===" -f $phase)',
  '$state.phases.$phaseKey = "in_progress"',
  '$state | ConvertTo-Json -Depth 50 | Set-Content $statePath -Encoding UTF8',
  "",
  '& $scriptPath',
  "",
  'if (Test-Path ".\package.json" -and (Get-Command npm -ErrorAction SilentlyContinue)) {',
  '  $pkg = Get-Content ".\package.json" -Raw -Encoding UTF8 | ConvertFrom-Json',
  '  if ($pkg.scripts -and $pkg.scripts.PSObject.Properties.Name -contains "lint") { npm run -s lint }',
  '  if ($pkg.scripts -and $pkg.scripts.PSObject.Properties.Name -contains "typecheck") { npm run -s typecheck }',
  '}',
  "",
  '$state = Get-Content $statePath -Raw -Encoding UTF8 | ConvertFrom-Json',
  '$state.phases.$phaseKey = "complete"',
  'if ($phase -lt 149) { $state.current_phase = $phase + 1 }',
  '$state | ConvertTo-Json -Depth 50 | Set-Content $statePath -Encoding UTF8',
  "",
  'Write-Host ("PHASE {0} COMPLETE" -f $phase)',
  'Write-Host "RING ADVANCED"'
)

# Phase script writer (strings only; no early variable evaluation)
function Write-Phase([int]$id, [string]$title, [string[]]$body) {
  $p = ".\pipeline\phases\phase-$id.ps1"
  $lines = @()
  $lines += "# PHASE $id — $title"
  $lines += "Set-StrictMode -Version Latest"
  $lines += '$ErrorActionPreference = "Stop"'
  $lines += "function Ensure-Dir([string]$p) { if (-not (Test-Path $p)) { New-Item -ItemType Directory -Force -Path $p | Out-Null } }"
  $lines += "function Write-Lines([string]$path,[string[]]$ls){ Ensure-Dir (Split-Path -Parent $path); Set-Content -Path $path -Value (($ls -join '`n') + '`n') -Encoding UTF8 }"
  $lines += ""
  $lines += $body
  $lines += ""
  $lines += "Write-Host `"PHASE $id COMPLETE`""
  Set-Content -Path $p -Value (($lines -join "`n") + "`n") -Encoding UTF8
}

# Minimal example: generate Phase 33–40 only (prove it works).
# After success, I will extend generator to 33–149 without interactive breakage.
Write-Phase 33 "Supabase env + client wrapper baseline" @(
  'Write-Lines ".\docs\env.md" @("# Env","EXPO_PUBLIC_SUPABASE_URL","EXPO_PUBLIC_SUPABASE_ANON_KEY")',
  'Write-Lines ".\src\lib\supabase\client.ts" @("export const supabaseClient = () => null;")'
)
Write-Phase 34 "Supabase typed exports" @(
  'Write-Lines ".\src\lib\supabase\index.ts" @("export * from './client';")'
)
Write-Phase 35 "Env validation scaffold" @(
  'Write-Lines ".\src\config\env.ts" @("export const getEnv = () => ({ supabaseUrl: process.env.EXPO_PUBLIC_SUPABASE_URL!, supabaseAnonKey: process.env.EXPO_PUBLIC_SUPABASE_ANON_KEY! });")'
)
Write-Phase 36 "Auth route stubs" @(
  'Write-Lines ".\src\auth\routes.ts" @("export type AuthRoute = 'sign_in'|'sign_up';")'
)
Write-Phase 37 "Email/password auth stubs" @(
  'Write-Lines ".\src\auth\emailPassword.ts" @("export async function signIn(){ return; }","export async function signUp(){ return; }")'
)
Write-Phase 38 "Session stubs" @(
  'Write-Lines ".\src\auth\session.ts" @("export async function getSession(){ return null; }")'
)
Write-Phase 39 "Magic link stub" @(
  'Write-Lines ".\src\auth\magicLink.ts" @("export async function sendMagicLink(){ return; }")'
)
Write-Phase 40 "Auth guard stub" @(
  'Write-Lines ".\src\auth\guard.ts" @("export async function requireSession(){ throw new Error('No session'); }")'
)

Write-Host "GEN OK: phases 33–40 generated + runner written"
Write-Host "NEXT: Run .\scripts\ring-33-149.ps1"

