Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

# PREMAKE ALL PHASE SCRIPTS PRESENT IN pipeline/state.json
# - Creates missing: .\pipeline\phases\phase-<N>.ps1
# - Does NOT overwrite existing phase scripts
# - Generated phases are safe placeholders that FAIL fast until implemented

$repoRoot = (Get-Location).Path
if ([string]::IsNullOrWhiteSpace($repoRoot)) { throw "Repo root is invalid/empty." }

$pipelineDir = Join-Path $repoRoot "pipeline"
$phasesDir   = Join-Path $pipelineDir "phases"
$statePath   = Join-Path $pipelineDir "state.json"

if (-not (Test-Path -Path $pipelineDir)) { throw "Missing pipeline directory: $pipelineDir" }
if (-not (Test-Path -Path $statePath)) { throw "Missing state file: $statePath" }

if (-not (Test-Path -Path $phasesDir)) {
  New-Item -ItemType Directory -Force -Path $phasesDir | Out-Null
}

$raw = Get-Content $statePath -Raw
if ([string]::IsNullOrWhiteSpace($raw)) { throw "pipeline/state.json is empty." }

try { $state = $raw | ConvertFrom-Json } catch { throw "pipeline/state.json is invalid JSON." }

if ($null -eq $state.phases) { throw "pipeline/state.json missing 'phases' object." }

# Collect numeric phase keys from state.phases
$phaseNums = @()
foreach ($p in $state.phases.PSObject.Properties) {
  $name = $p.Name
  if ($name -match '^\d+$') {
    $phaseNums += [int]$name
  }
}

if ($phaseNums.Count -eq 0) { throw "No numeric phases found in pipeline/state.json phases." }

$phaseNums = $phaseNums | Sort-Object -Unique

$created = 0
$skipped = 0

foreach ($n in $phaseNums) {
  $phaseFile = Join-Path $phasesDir ("phase-{0}.ps1" -f $n)
  if (Test-Path -Path $phaseFile) {
    $skipped++
    continue
  }

  $content = @"
Set-StrictMode -Version Latest
`$ErrorActionPreference = "Stop"

# PHASE $n — PLACEHOLDER (NOT IMPLEMENTED YET)
# This phase was pre-created to reserve the slot in the ring.
# Replace the body with the real atomic implementation when this phase becomes active.

throw "PHASE $n NOT IMPLEMENTED"

Write-Host "PHASE $n COMPLETE"
"@

  Set-Content -Path $phaseFile -Value $content -Encoding UTF8 -Force
  $created++
}

Write-Host ("PHASE SCAFFOLD COMPLETE")
Write-Host ("Created: " + $created)
Write-Host ("Skipped (already existed): " + $skipped)
