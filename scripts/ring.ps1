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

$repoRoot = Resolve-RepoRoot -StartDir (Get-Location).Path
$regPath = Join-Path $repoRoot "pipeline\phase-registry.json"
$statePath = Join-Path $repoRoot "pipeline\state.json"

if (!(Test-Path $regPath)) { throw "Missing registry: $regPath" }
if (!(Test-Path $statePath)) { throw "Missing state: $statePath" }

$reg = Get-Content $regPath -Raw | ConvertFrom-Json
$state = Get-Content $statePath -Raw | ConvertFrom-Json
$current = $state.current_phase
# --- SELF_HEAL_CURRENT_PHASE ---
if (-not $current -or $current -eq "") {
  $last = $state.last_completed_phase
  if ($last -and $last -ne "") {
    $nextNum = ([int]$last) + 1
    $current = $nextNum.ToString("0000")
    $state.current_phase = $current
    Set-Content -Path $statePath -Value ($state | ConvertTo-Json -Depth 6) -Encoding UTF8
  } else {
    throw "state.json missing current_phase and last_completed_phase"
  }
}
# --- END SELF_HEAL_CURRENT_PHASE ---

Write-Host "=== PHASE RING (ENFORCEMENT) ==="
Write-Host ("Repo root: " + $repoRoot)
Write-Host ("Current phase: " + $current)

pwsh -NoProfile -ExecutionPolicy Bypass -File (Join-Path $repoRoot "scripts\run.ps1") -PhaseId $current | Out-Host

$phase = $reg.phases | Where-Object { $_.id -eq ([int]$current).ToString() -or $_.id -eq $current.TrimStart('0') }
if (-not $phase) { throw "Phase not found: $current" }

$pid4 = ([int]$current).ToString("0000")
if ($null -eq $state.completed) { $state.completed = @() }
if ($state.completed -notcontains $pid4) { $state.completed += $pid4 }

$state.last_completed_phase = $pid4
$state.current_phase = if ($phase.next -and $phase.next.Length -gt 0) { ([int]$phase.next).ToString("0000") } else { "" }

Set-Content -Path $statePath -Value ($state | ConvertTo-Json -Depth 6) -Encoding UTF8
Write-Host "RETURN TO GATEKEEPER"

