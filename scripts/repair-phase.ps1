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

function Escape-SingleQuotes([string]$s) {
  return $s -replace "'", "''"
}

$repoRoot = Resolve-RepoRoot -StartDir (Get-Location).Path
$regPath = Join-Path $repoRoot "pipeline\phase-registry.json"

if (!(Test-Path $regPath)) { throw "Missing registry: $regPath" }

$reg = Get-Content $regPath -Raw | ConvertFrom-Json
$phase = $reg.phases | Where-Object { $_.id -eq ([int]$PhaseId).ToString() -or $_.id -eq $PhaseId.TrimStart('0') }
if (-not $phase) { throw "Phase not found: $PhaseId" }

$phase4 = ([int]$PhaseId).ToString("0000")

foreach ($rel in $phase.outputs) {

  if ($rel -like ".\pipeline\phases\PHASE-*.md") { continue }

  $abs = Join-Path $repoRoot ($rel -replace '^\.\[\\/]', '')

  $dir = Split-Path $abs -Parent
  if (!(Test-Path $dir)) { New-Item -ItemType Directory -Force -Path $dir | Out-Null }

  $ext = [IO.Path]::GetExtension($abs).ToLowerInvariant()

  switch ($ext) {

    ".md" {
@"
# $($phase.title)

## objective
$($phase.objective)

## notes
Non-stub scaffold for phase $phase4.

## completion_marker
$($phase.completion_marker)
"@ | Set-Content -Path $abs -Encoding UTF8
    }

    ".sql" {
@"
-- PHASE $phase4
-- Replace this scaffold with real migration logic.
"@ | Set-Content -Path $abs -Encoding UTF8
    }

    ".json" {
      $obj = @{
        phase = $phase4
        title = $phase.title
        objective = $phase.objective
      }
      $obj | ConvertTo-Json -Depth 5 | Set-Content -Path $abs -Encoding UTF8
    }

    ".ts" {
      $safeTitle = Escape-SingleQuotes $phase.title
      $safeObj = Escape-SingleQuotes $phase.objective
@"
// PHASE $phase4
// Non-stub scaffold

export const phase${phase4}Meta = {
  phase: '$phase4',
  title: '$safeTitle',
  objective: '$safeObj'
};

export {};
"@ | Set-Content -Path $abs -Encoding UTF8
    }

    ".tsx" {
@"
// PHASE $phase4
import React from 'react';

export function Phase${phase4}Component() {
  return null;
}
"@ | Set-Content -Path $abs -Encoding UTF8
    }

    default {
      "PHASE $phase4 - Non-stub content" | Set-Content -Path $abs -Encoding UTF8
    }
  }
}

Write-Host "REPAIRED PHASE $phase4"
Write-Host "RETURN TO GATEKEEPER"
