param(
  [Parameter(Mandatory=$true)][string]$PhaseId
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Resolve-RepoRoot {
  param([string]$StartDir)
  $dir = (Resolve-Path $StartDir).Path
  while ($true) {
    if (Test-Path (Join-Path $dir "pipeline")) { return (Resolve-Path $dir).Path }
    $parent = Split-Path $dir -Parent
    if ($parent -eq $dir) { break }
    $dir = $parent
  }
  return (Resolve-Path ".").Path
}

function Read-JsonFile {
  param([string]$Path)
  if (!(Test-Path $Path)) { return $null }
  try { return (Get-Content $Path -Raw | ConvertFrom-Json) }
  catch { throw "Invalid JSON: $Path" }
}

function Get-NpmScripts {
  param([string]$RepoRoot)
  $pkg = Join-Path $RepoRoot "package.json"
  if (!(Test-Path $pkg)) { return @{} }
  $obj = Get-Content $pkg -Raw | ConvertFrom-Json
  if ($null -eq $obj.scripts) { return @{} }
  $h = @{}
  $obj.scripts.PSObject.Properties | ForEach-Object { $h[$_.Name] = $_.Value }
  return $h
}

function Run-NpmIfExists {
  param(
    [hashtable]$Scripts,
    [string]$Name,
    [string]$PreferredCmd,
    [string]$FallbackCmd
  )
  if ($Scripts.ContainsKey($Name)) {
    Write-Host ("RUN: " + $PreferredCmd)
    cmd /c $PreferredCmd
    if ($LASTEXITCODE -ne 0) { throw "FAILED: $PreferredCmd" }
  } elseif ($FallbackCmd) {
    # optional fallback if script missing (rare)
    Write-Host ("SKIP (missing npm script '" + $Name + "')")
  }
}

$repoRoot = Resolve-RepoRoot -StartDir (Get-Location).Path
$regPath  = Join-Path $repoRoot "pipeline\phase-registry.json"
$statePath = Join-Path $repoRoot "pipeline\state.json"
$enfPath  = Join-Path $repoRoot "pipeline\enforcement.json"

if (!(Test-Path $regPath)) { throw "Missing registry: $regPath" }
if (!(Test-Path $statePath)) { throw "Missing state: $statePath" }

$enf = Read-JsonFile -Path $enfPath
$enforcementOn = $false
$runNpm = $true
$preferCi = $true
if ($null -ne $enf) {
  $enforcementOn = [bool]$enf.enforcement_mode
  $runNpm = [bool]$enf.run_npm
  $preferCi = [bool]$enf.npm_prefer_ci
}

# Always validate structure + markers first (and in enforcement, validate non-stub too)
pwsh -NoProfile -ExecutionPolicy Bypass -File (Join-Path $repoRoot "scripts\validate-phase.ps1") -PhaseId $PhaseId -CheckMarker | Out-Host

if ($enforcementOn -and $runNpm) {
  $scripts = Get-NpmScripts -RepoRoot $repoRoot

  # Prefer npm ci if lockfile exists (non-destructive, deterministic)
  $hasLock = (Test-Path (Join-Path $repoRoot "package-lock.json")) -or (Test-Path (Join-Path $repoRoot "pnpm-lock.yaml")) -or (Test-Path (Join-Path $repoRoot "yarn.lock"))
  if ($preferCi -and $hasLock) {
    if (Test-Path (Join-Path $repoRoot "package-lock.json")) {
      # --- LOCKFILE_HASH_CACHE (do not edit marker) ---
function Get-FileHashSafe([string]$Path) {
  if (!(Test-Path $Path)) { return "" }
  return (Get-FileHash -Algorithm SHA256 -Path $Path).Hash
}

$lockPath = Join-Path $repoRoot "package-lock.json"
$cacheDir = Join-Path $repoRoot ".cache"
$cacheFile = Join-Path $cacheDir "lockfile.sha256"

New-Item -ItemType Directory -Force -Path $cacheDir | Out-Null

$lockHash = Get-FileHashSafe $lockPath
$prevHash = if (Test-Path $cacheFile) { (Get-Content $cacheFile -Raw).Trim() } else { "" }

$needInstall = $false
if (!(Test-Path (Join-Path $repoRoot "node_modules"))) { $needInstall = $true }
elseif ($lockHash -and ($lockHash -ne $prevHash)) { $needInstall = $true }

if ($needInstall) {
  Write-Host "RUN: npm ci"
  cmd /c "npm ci"
  if ($LASTEXITCODE -ne 0) { throw "FAILED: npm ci" }
  if ($lockHash) { Set-Content -Path $cacheFile -Value $lockHash -Encoding UTF8 }
} else {
  Write-Host "SKIP: npm ci (deps unchanged)"
}
# --- END LOCKFILE_HASH_CACHE ---
    
  # Security gate (real risk): fail on moderate+ vulnerabilities
  Write-Host "RUN: npm audit --audit-level=moderate"
  cmd /c "npm audit --audit-level=moderate"
  if ($LASTEXITCODE -ne 0) { throw "FAILED: npm audit --audit-level=moderate" }
} else {
      # if pnpm/yarn used, do not guess; rely on scripts
      Write-Host "INFO: Non-npm lockfile detected; skipping install step (rely on existing node_modules)."
    }
  }

  # Quality gates (only run if scripts exist)
  Run-NpmIfExists -Scripts $scripts -Name "lint"      -PreferredCmd "npm run -s lint"      -FallbackCmd ""
  Run-NpmIfExists -Scripts $scripts -Name "typecheck" -PreferredCmd "npm run -s typecheck" -FallbackCmd ""
  Run-NpmIfExists -Scripts $scripts -Name "test"      -PreferredCmd "npm test --silent"    -FallbackCmd ""
  Run-NpmIfExists -Scripts $scripts -Name "build"     -PreferredCmd "npm run -s build"     -FallbackCmd ""
}

$pid4 = ([int]$PhaseId).ToString("0000")
Write-Host "ENFORCEMENT CHECKS PASSED"
Write-Host ("PHASE " + $pid4 + " COMPLETE")


