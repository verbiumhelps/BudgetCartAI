param(
  [Parameter(Mandatory=$true)][string]$PhaseId,
  [switch]$CheckMarker
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

function Assert-NoStubContent {
  param(
    [string]$AbsPath,
    [string]$RelPath,
    [string]$Phase4
  )

  $ext = [IO.Path]::GetExtension($AbsPath).ToLowerInvariant()
  $txt = ""
  if ($ext -in @(".md",".sql",".ts",".tsx",".json",".ps1",".txt",".yml",".yaml")) {
    $txt = Get-Content $AbsPath -Raw
  }

  # Extension-specific anti-stub rules
  switch ($ext) {
    ".sql" {
      if ($txt -notmatch ("(?m)^\s*--\s*PHASE\s+" + [regex]::Escape($Phase4) + "\s*$")) {
        throw "SQL missing required first-line marker '-- PHASE $Phase4': $RelPath"
      }
      if ($txt -match "(?i)stub migration placeholder") {
        throw "SQL contains stub placeholder text: $RelPath"
      }
    }
    ".json" {
      if ($txt -match '"stub"\s*:\s*true') {
        throw "JSON contains stub=true: $RelPath"
      }
    }
    ".ts" { if ($txt -match "(?i)stub\s*=\s*true" -or $txt -match "(?i)phase\d+Stub") { throw "TS contains stub export: $RelPath" } }
    ".tsx" { if ($txt -match "(?i)stub\s*=\s*true" -or $txt -match "(?i)phase\d+Stub") { throw "TSX contains stub export: $RelPath" } }
    ".md" {
      if ($txt -match ("(?m)^\s*PHASE\s+" + [regex]::Escape($Phase4) + "\s+stub\s*$")) {
        throw "MD is a stub placeholder: $RelPath"
      }
      if ($txt -notmatch "(?m)^\s*#\s+") {
        throw "MD missing at least one heading: $RelPath"
      }
    }
    default {
      # generic anti-stub
      if ($txt -match "(?i)\bstub\b" -and $txt.Length -lt 200) {
        throw "File appears to be stub content: $RelPath"
      }
    }
  }
}

$repoRoot = Resolve-RepoRoot -StartDir (Get-Location).Path
$regPath = Join-Path $repoRoot "pipeline\phase-registry.json"
$phasesDir = Join-Path $repoRoot "pipeline\phases"
$enfPath = Join-Path $repoRoot "pipeline\enforcement.json"

if (!(Test-Path $regPath)) { throw "Missing registry: $regPath" }

$enf = Read-JsonFile -Path $enfPath
$enforcementOn = $false
$disallowStubs = $false
if ($null -ne $enf) {
  $enforcementOn = [bool]$enf.enforcement_mode
  $disallowStubs = [bool]$enf.disallow_stubs
}

$reg = Get-Content $regPath -Raw | ConvertFrom-Json
$phase = $reg.phases | Where-Object { $_.id -eq ([int]$PhaseId).ToString() -or $_.id -eq $PhaseId.TrimStart('0') }
if (-not $phase) { throw "Phase not found in registry: $PhaseId" }

$phase4 = ([int]$PhaseId).ToString("0000")
$contract = Join-Path $phasesDir ("PHASE-" + $phase4 + ".md")
if (!(Test-Path $contract)) { throw "Missing phase contract: $contract" }

# Contract must contain exact title heading
$contractText = Get-Content $contract -Raw
if ($contractText -notmatch [regex]::Escape("# " + $phase.title)) { throw "Contract missing exact title heading: # $($phase.title)" }

if ($CheckMarker) {
  if ($contractText -notmatch [regex]::Escape($phase.completion_marker)) { throw "Contract missing completion_marker: $($phase.completion_marker)" }
}

# Outputs must exist and be non-empty; in enforcement mode, must not be stubs
foreach ($p in $phase.outputs) {
  $abs = Join-Path $repoRoot ($p -replace '^\.\[\\/]', '')
  if (!(Test-Path $abs)) { throw "Missing required output: $p" }
  if ((Get-Item $abs).Length -lt 1) { throw "Output is empty: $p" }

  if ($enforcementOn -and $disallowStubs) {
    Assert-NoStubContent -AbsPath $abs -RelPath $p -Phase4 $phase4
  }
}

Write-Host ("PHASE " + $phase4 + " VALIDATED")
