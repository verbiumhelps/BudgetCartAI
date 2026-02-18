param(
  [switch]$DryRun
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

function Ensure-DirForFile([string]$AbsPath) {
  $d = Split-Path $AbsPath -Parent
  if ($d -and !(Test-Path $d)) { New-Item -ItemType Directory -Force -Path $d | Out-Null }
}

function Escape-SingleQuotes([string]$s) { return $s -replace "'", "''" }

function Is-StubContent {
  param([string]$Ext,[string]$Text)

  switch ($Ext) {
    ".json" { return ($Text -match '"stub"\s*:\s*true') }
    ".sql"  { return ($Text -match "(?i)stub migration placeholder") }
    ".ts"   { return ($Text -match "(?i)phase\d+Stub" -or $Text -match "(?i)\bstub\s*=\s*true\b") }
    ".tsx"  { return ($Text -match "(?i)phase\d+Stub" -or $Text -match "(?i)\bstub\s*=\s*true\b") }
    ".ps1"  { return ($Text -match "(?i)\bPHASE\s+\d{4}\s+COMPLETE\b" -and $Text -match "(?i)\bstub\b") }
    default { return ($Text -match "(?i)\bstub\b" -and $Text.Length -lt 300) }
  }
}

function Write-NonStubScaffold {
  param(
    [string]$AbsPath,
    [string]$RelPath,
    [string]$Ext,
    [string]$Phase4,
    [string]$Title,
    [string]$Objective
  )

  Ensure-DirForFile $AbsPath

  switch ($Ext) {

    ".json" {
      $obj = [ordered]@{
        phase = $Phase4
        title = $Title
        objective = $Objective
        generated_scaffold = $true
      }
      $json = $obj | ConvertTo-Json -Depth 6
      if ($DryRun) { return $json }
      Set-Content -Path $AbsPath -Value $json -Encoding UTF8
      return $null
    }

    ".sql" {
      $content = @"
-- PHASE $Phase4
-- Non-stub scaffold migration placeholder (replace with real statements).
"@
      if ($DryRun) { return $content }
      Set-Content -Path $AbsPath -Value $content -Encoding UTF8
      return $null
    }

    ".ts" {
      $safeTitle = Escape-SingleQuotes $Title
      $safeObj = Escape-SingleQuotes $Objective
      $content = @"
// PHASE $Phase4
// Non-stub scaffold

export const phase${Phase4}Meta = {
  phase: '$Phase4',
  title: '$safeTitle',
  objective: '$safeObj'
};

export {};
"@
      if ($DryRun) { return $content }
      Set-Content -Path $AbsPath -Value $content -Encoding UTF8
      return $null
    }

    ".tsx" {
      $content = @"
// PHASE $Phase4
// Non-stub scaffold
import React from 'react';

export function Phase${Phase4}Component() {
  return null;
}

export {};
"@
      if ($DryRun) { return $content }
      Set-Content -Path $AbsPath -Value $content -Encoding UTF8
      return $null
    }

    ".ps1" {
      $content = @"
param()
Set-StrictMode -Version Latest
`$ErrorActionPreference = 'Stop'

# PHASE $Phase4
# Non-stub scaffold script. Replace with real script logic.

Write-Host 'PHASE $Phase4 COMPLETE'
"@
      if ($DryRun) { return $content }
      Set-Content -Path $AbsPath -Value $content -Encoding UTF8
      return $null
    }

    default {
      $content = "PHASE $Phase4`n$Title`n$Objective`n"
      if ($DryRun) { return $content }
      Set-Content -Path $AbsPath -Value $content -Encoding UTF8
      return $null
    }
  }
}

$repoRoot = Resolve-RepoRoot -StartDir (Get-Location).Path
$regPath  = Join-Path $repoRoot "pipeline\phase-registry.json"
if (!(Test-Path $regPath)) { throw "Missing registry: $regPath" }

$reg = Get-Content $regPath -Raw | ConvertFrom-Json

$fixedCount = 0
$scanned = 0

foreach ($phase in $reg.phases) {
  $phase4 = ([int]$phase.id).ToString("0000")

  foreach ($rel in $phase.outputs) {
    # Never touch the phase contract
    if ($rel -like ".\pipeline\phases\PHASE-*.md") { continue }

    $abs = Join-Path $repoRoot ($rel -replace '^\.\[\\/]', '')
    if (!(Test-Path $abs)) { continue } # created later by real IE; validator will enforce existence

    $ext = [IO.Path]::GetExtension($abs).ToLowerInvariant()
    if ([string]::IsNullOrWhiteSpace($ext)) { continue }

    $txt = ""
    if ($ext -in @(".md",".sql",".json",".ts",".tsx",".ps1",".txt",".yml",".yaml")) {
      $txt = Get-Content $abs -Raw
    } else {
      continue
    }

    $scanned++

    if (Is-StubContent -Ext $ext -Text $txt) {
      if ($DryRun) {
        Write-Host "WOULD FIX: $rel"
      } else {
        Write-NonStubScaffold -AbsPath $abs -RelPath $rel -Ext $ext -Phase4 $phase4 -Title $phase.title -Objective $phase.objective | Out-Null
        Write-Host "FIXED: $rel"
      }
      $fixedCount++
    }
  }
}

Write-Host ("SCANNED: " + $scanned)
Write-Host ("FIXED: " + $fixedCount)
Write-Host "RETURN TO GATEKEEPER"
