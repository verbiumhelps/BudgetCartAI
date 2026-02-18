Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"
$statePath = ".\pipeline\state.json"
if (-not (Test-Path $statePath)) { throw "Missing state.json" }
$state = Get-Content $statePath -Raw | ConvertFrom-Json
[int]$phase = $state.current_phase
if ($phase -gt 9) { Write-Host "ALL PHASES COMPLETE"; exit }
$phaseScript = ".\pipeline\phases\phase-" + $phase + ".ps1"
if (-not (Test-Path $phaseScript)) { throw "Missing " + $phaseScript }
Write-Host "=== Running Phase " $phase
$state.phases."$phase" = "in_progress"
$state | ConvertTo-Json -Depth 5 | Set-Content $statePath
& $phaseScript
$state = Get-Content $statePath -Raw | ConvertFrom-Json
$state.phases."$phase" = "complete"
if ($phase -lt 9) { $state.current_phase = $phase + 1 }
$state | ConvertTo-Json -Depth 5 | Set-Content $statePath
Write-Host "PHASE COMPLETE"
