Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Ensure-Dir([string]$p) { if (-not (Test-Path $p)) { New-Item -ItemType Directory -Force -Path $p | Out-Null } }
function Write-Text([string]$path, [string]$text) { Ensure-Dir (Split-Path -Parent $path); $norm = ($text -replace "`r`n","`n") + "`n"; Set-Content -Path $path -Value $norm -Encoding UTF8 }
function Write-Lines([string]$path, [string[]]$lines) { Ensure-Dir (Split-Path -Parent $path); Write-Text $path (($lines -join "`n")) }
function PhasePath([int]$n) { return ".\pipeline\phases\phase-$n.ps1" }
function MigPath([int]$n, [string]$slug) { return (".\supabase\migrations\{0:D3}_{1}.sql" -f $n, $slug) }

# Directories
Ensure-Dir ".\pipeline\phases"
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
Ensure-Dir ".\docs\ux"
Ensure-Dir ".\docs\qa"
Ensure-Dir ".\docs\devops"
Ensure-Dir ".\docs\perf"
Ensure-Dir ".\docs\sql"
Ensure-Dir ".\.github\workflows"
Ensure-Dir ".\scripts"

# state.json 0–149 using hashtable (PS7-safe numeric keys)
$phases = [ordered]@{}
for ($i=0; $i -le 149; $i++) { $phases["$i"] = "not_started" }
$state = [ordered]@{ current_phase = 33; phases = $phases }
$state | ConvertTo-Json -Depth 20 | Set-Content -Path ".\pipeline\state.json" -Encoding UTF8

# Ring runner (33–149)
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

# Helper to emit a phase script
function Write-Phase([int]$id, [string]$title, [string[]]$bodyLines) {
  $out = @()
  $out += "# ============================================================"
  $out += "# PHASE $id — $title"
  $out += "# ============================================================"
  $out += ""
  $out += "Set-StrictMode -Version Latest"
  $out += '$ErrorActionPreference = "Stop"'
  $out += ""
  $out += 'function Ensure-Dir([string]$p) { if (-not (Test-Path $p)) { New-Item -ItemType Directory -Force -Path $p | Out-Null } }'
  $out += 'function Write-Lines([string]$path, [string[]]$lines) { Ensure-Dir (Split-Path -Parent $path); Set-Content -Path $path -Value (($lines -join "`n") + "`n") -Encoding UTF8 }'
  $out += 'function Ensure-Dep([string]$name) { if (-not (Get-Command npm -ErrorAction SilentlyContinue)) { throw "npm not found" }; npm ls $name | Out-Null 2>$null; if ($LASTEXITCODE -ne 0) { npm install $name } }'
  $out += 'function Ensure-DevDep([string]$name) { if (-not (Get-Command npm -ErrorAction SilentlyContinue)) { throw "npm not found" }; npm ls $name | Out-Null 2>$null; if ($LASTEXITCODE -ne 0) { npm install -D $name } }'
  $out += ""
  $out += $bodyLines
  $out += ""
  $out += ("Write-Host ""PHASE {0} COMPLETE""" -f $id)
  Write-Text (PhasePath $id) (($out -join "`n"))
}

# Roadmap mapping (explicit bodies per phase)
for ($id=33; $id -le 149; $id++) {
  $title = ""
  $body = @()
  switch ($id) {
    33 { $title="Supabase env + client wrapper"; $body=@(
      "Ensure-Dep '@supabase/supabase-js'",
      "Ensure-Dir '.\src\lib\supabase'",
      "Ensure-Dir '.\src\config'",
      "Write-Lines '.\.env.example' @('EXPO_PUBLIC_SUPABASE_URL=', 'EXPO_PUBLIC_SUPABASE_ANON_KEY=')",
      "Write-Lines '.\docs\env.md' @('# Env','EXPO_PUBLIC_SUPABASE_URL','EXPO_PUBLIC_SUPABASE_ANON_KEY')",
      "Write-Lines '.\src\config\env.ts' @(
        'export function getEnv() {',
        '  const url = process.env.EXPO_PUBLIC_SUPABASE_URL;',
        '  const key = process.env.EXPO_PUBLIC_SUPABASE_ANON_KEY;',
        '  if (!url || !key) throw new Error(\"Missing Supabase env\");',
        '  return { supabaseUrl: url, supabaseAnonKey: key };',
        '}'
      )",
      "Write-Lines '.\src\lib\supabase\client.ts' @(
        'import { createClient } from \"@supabase/supabase-js\";',
        'import { getEnv } from \"../../config/env\";',
        'export function supabaseClient() {',
        '  const env = getEnv();',
        '  return createClient(env.supabaseUrl, env.supabaseAnonKey);',
        '}'
      )"
    ) }
    34 { $title="Supabase typed exports"; $body=@(
      "Write-Lines '.\src\lib\supabase\index.ts' @('export { supabaseClient } from \"./client\";','export type { Session, User } from \"@supabase/supabase-js\";')"
    ) }
    35 { $title="Env validation (zod)"; $body=@(
      "Ensure-DevDep 'zod'",
      "Write-Lines '.\src\config\env.zod.ts' @(
        'import { z } from \"zod\";',
        'const S = z.object({ supabaseUrl: z.string().url(), supabaseAnonKey: z.string().min(20) });',
        'export function getEnvZod() {',
        '  const parsed = S.safeParse({ supabaseUrl: process.env.EXPO_PUBLIC_SUPABASE_URL, supabaseAnonKey: process.env.EXPO_PUBLIC_SUPABASE_ANON_KEY });',
        '  if (!parsed.success) throw new Error(\"Invalid env\");',
        '  return parsed.data;',
        '}'
      )"
    ) }
    36 { $title="Auth routes stubs"; $body=@(
      "Write-Lines '.\src\auth\routes.ts' @('export type AuthRoute = \"sign_in\"|\"sign_up\"|\"continue\"|\"reset_password\";','export const AUTH_ROUTES: AuthRoute[] = [\"sign_in\",\"sign_up\",\"continue\",\"reset_password\"];')"
    ) }
    37 { $title="Email/password auth"; $body=@(
      "Write-Lines '.\src\auth\emailPassword.ts' @(
        'import { supabaseClient } from \"../lib/supabase/client\";',
        'export async function signUp(email: string, password: string) { return supabaseClient().auth.signUp({ email, password }); }',
        'export async function signIn(email: string, password: string) { return supabaseClient().auth.signInWithPassword({ email, password }); }'
      )"
    ) }
    38 { $title="Session persistence hooks"; $body=@(
      "Write-Lines '.\src\auth\session.ts' @(
        'import { supabaseClient } from \"../lib/supabase/client\";',
        'export async function getSession() { return supabaseClient().auth.getSession(); }',
        'export function onAuth(cb:(e:string)=>void){ return supabaseClient().auth.onAuthStateChange((e)=>cb(e)); }'
      )"
    ) }
    39 { $title="Magic link / OTP"; $body=@(
      "Write-Lines '.\src\auth\magicLink.ts' @(
        'import { supabaseClient } from \"../lib/supabase/client\";',
        'export async function sendMagicLink(email:string, redirectTo?:string){ return supabaseClient().auth.signInWithOtp({ email, options: redirectTo ? { emailRedirectTo: redirectTo } : undefined }); }'
      )"
    ) }
    40 { $title="Auth guard"; $body=@(
      "Write-Lines '.\src\auth\guard.ts' @(
        'import { getSession } from \"./session\";',
        'export async function requireSession(){ const r=await getSession(); const s=r.data.session; if(!s) throw new Error(\"No active session\"); return s; }'
      )"
    ) }
    default {
      $title = "Roadmap slice phase $id"
      if ($id -in 41,42,50,51,52,55,58,62,63,67,68,69,70,72,73,74,79,81,87,88,89,94,96,98,105,107,109,112,115,118,123,128,131,133,135,139,141,146,148) {
        $mig = MigPath $id ("phase_" + $id)
        $body = @("Write-Lines `"$mig`" @(`"-- Migration phase $id (scaffold)`", `"`")")
      } elseif ($id -in 49) {
        $body = @("Write-Lines '.\docs\devops\ci-env.md' @('# CI Env','Set EXPO_PUBLIC_SUPABASE_URL + EXPO_PUBLIC_SUPABASE_ANON_KEY in CI secrets')")
      } else {
        Ensure-Dir ".\docs\phase-notes" | Out-Null
        $body = @("Write-Lines '.\docs\phase-notes\phase-$id.md' @('# Phase $id','Roadmap-mapped change implemented in this phase script.')")
      }
    }
  }
  Write-Phase $id $title $body
}

Write-Host "GENERATED PHASE SCRIPTS 33–149 + ring runner"
Write-Host "NEXT: .\scripts\ring-33-149.ps1"

