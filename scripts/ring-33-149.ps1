Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$statePath = ".\pipeline\state.json"
if (-not (Test-Path $statePath)) { throw "Missing pipeline/state.json" }
$state = Get-Content $statePath -Raw -Encoding UTF8 | ConvertFrom-Json
[int]$phase = $state.current_phase
if ($phase -lt 33) { throw "current_phase is $phase, expected >= 33 for this runner" }
if ($phase -gt 149) { Write-Host "ALL PHASES (33–149) COMPLETE"; exit 0 }

$phaseKey = "$phase"
$scriptPath = ".\pipeline\phases\phase-" + $phase + ".ps1"
if (-not (Test-Path $scriptPath)) { throw "Missing phase script: " + $scriptPath }

Write-Host ("=== Running Phase {0} ===" -f $phase)
$state.phases.$phaseKey = "in_progress"
$state | ConvertTo-Json -Depth 50 | Set-Content $statePath -Encoding UTF8

& $scriptPath

# Gates: lint + typecheck if present
if (Test-Path ".\package.json") {
  if (Get-Command npm -ErrorAction SilentlyContinue) {
    Write-Host "Running gate: npm run -s lint"
    npm run -s lint
    Write-Host "Running gate: npm run -s typecheck"
    npm run -s typecheck
  }
}

$state = Get-Content $statePath -Raw -Encoding UTF8 | ConvertFrom-Json
$state.phases.$phaseKey = "complete"
if ($phase -lt 149) { $state.current_phase = $phase + 1 }
$state | ConvertTo-Json -Depth 50 | Set-Content $statePath -Encoding UTF8

Write-Host ("PHASE {0} COMPLETE" -f $phase)
Write-Host "RING ADVANCED"

