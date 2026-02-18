param()

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
$regPath  = Join-Path $repoRoot "pipeline\phase-registry.json"
if (!(Test-Path $regPath)) { throw "Missing registry: $regPath" }

$reg = Get-Content $regPath -Raw | ConvertFrom-Json

$fixed = 0
$checked = 0

foreach ($phase in $reg.phases) {
  $phase4 = ([int]$phase.id).ToString("0000")

  foreach ($rel in $phase.outputs) {
    # Never touch phase contract files
    if ($rel -like ".\pipeline\phases\PHASE-*.md") { continue }

    if ($rel -notlike "*.md") { continue }

    $abs = Join-Path $repoRoot ($rel -replace '^\.\[\\/]', '')
    if (!(Test-Path $abs)) { continue }

    $checked++
    $txt = Get-Content $abs -Raw

    # Does it already have any markdown heading line?
    if ($txt -match '(?m)^\s*#\s+') { continue }

    # Prepend deterministic heading
    $heading = "# " + $phase.title + " — " + $rel + "`n`n"
    $newTxt = $heading + $txt

    Set-Content -Path $abs -Value $newTxt -Encoding UTF8
    Write-Host "FIXED MD HEADING: $rel"
    $fixed++
  }
}

Write-Host ("CHECKED_MD: " + $checked)
Write-Host ("FIXED_MD: " + $fixed)
Write-Host "RETURN TO GATEKEEPER"
