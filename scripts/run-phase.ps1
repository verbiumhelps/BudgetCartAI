# BudgetCartAI Phase Runner
Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$repoRoot = Split-Path -Parent $PSScriptRoot
$layerPath = Join-Path $repoRoot "pipeline\layer-status.json"

if (-not (Test-Path $layerPath)) {
  throw "layer-status.json missing"
}

$json = Get-Content $layerPath -Raw | ConvertFrom-Json

$inProgress = @()
$notComplete = @()

foreach ($prop in $json.PSObject.Properties) {
  if ($prop.Value -eq "in_progress") { $inProgress += $prop.Name }
  if ($prop.Value -ne "complete") { $notComplete += $prop.Name }
}

if ($inProgress.Count -gt 1) {
  throw "Multiple layers in_progress — invalid state"
}

if ($inProgress.Count -eq 1) {
  Write-Host "CURRENT LAYER: $($inProgress[0])"
  Write-Host "STATUS: in_progress"
  Write-Host "RETURN TO GATEKEEPER"
  exit 0
}

if ($notComplete.Count -eq 0) {
  Write-Host "PROJECT STATUS: COMPLETE"
  Write-Host "RETURN TO GATEKEEPER"
  exit 0
}

$next = ($notComplete | Sort-Object {[int]$_})[0]

Write-Host "NEXT LAYER: $next"
Write-Host "STATUS: not_started"
Write-Host "RETURN TO GATEKEEPER"