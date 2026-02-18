# scripts/ci/validate-all-scripts.ps1

param(
  [switch]$KeepSandbox,
  [switch]$DoubleRun,
  [switch]$SkipIntegration,
  [switch]$PreferGitWorktree = $true
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Fail([string]$Message) {
  Write-Host ("VALIDATION FAILED: {0}" -f $Message)
  exit 1
}

function Info([string]$Message) {
  Write-Host $Message
}

function Resolve-RepoRoot {
  param([string]$StartDir)

  $dir = (Resolve-Path $StartDir).Path
  while ($true) {
    if (Test-Path (Join-Path $dir "pipeline\phase-registry.json")) { return $dir }
    if (Test-Path (Join-Path $dir "pipeline\state.json")) { return $dir }
    if (Test-Path (Join-Path $dir "package.json")) { return $dir }

    $parent = Split-Path $dir -Parent
    if ($parent -eq $dir) { break }
    $dir = $parent
  }

  return (Resolve-Path ".").Path
}

function Assert-PwshAstParses([string]$Path) {
  $tokens = $null
  $errors = $null
  [void][System.Management.Automation.Language.Parser]::ParseFile($Path, [ref]$tokens, [ref]$errors)

  if ($errors -and $errors.Count -gt 0) {
    $msg = ($errors | Select-Object -First 1 | ForEach-Object { $_.Message })
    Fail ("Parse error: {0} :: {1}" -f $Path, $msg)
  }
}

function Read-Json([string]$Path) {
  try {
    return (Get-Content -LiteralPath $Path -Raw -ErrorAction Stop | ConvertFrom-Json -ErrorAction Stop)
  } catch {
    Fail ("Invalid JSON: {0}" -f $Path)
  }
}

function Assert-RegistryIntegrity([psobject]$Reg) {
  if ($null -eq $Reg.phases) { Fail "Registry missing 'phases'" }

  $ids = @{}
  foreach ($p in $Reg.phases) {
    $id = $p.id.ToString().Trim()
    if ($ids.ContainsKey($id)) { Fail ("Duplicate phase id: {0}" -f $id) }
    $ids[$id] = $true

    foreach ($req in @("title","objective","outputs","runner","completion_marker")) {
      if ($null -eq $p.$req) {
        Fail ("Phase {0} missing '{1}'" -f $id, $req)
      }
    }

    if ($p.next -and -not $ids.ContainsKey($p.next)) {
      # allow forward references — validate later
      $exists = $false
      foreach ($q in $Reg.phases) {
        if ($q.id -eq $p.next) { $exists = $true; break }
      }
      if (-not $exists) {
        Fail ("Phase {0} references missing next id {1}" -f $id, $p.next)
      }
    }
  }
}

function Invoke-Ring([string]$RepoRoot) {
  $ring = Join-Path $RepoRoot "scripts\ring.ps1"
  $out = & pwsh -NoProfile -ExecutionPolicy Bypass -File $ring 2>&1
  $out | ForEach-Object { Write-Host $_ }

  if ($LASTEXITCODE -ne 0) {
    Fail "ring.ps1 failed"
  }
}

# -------------------- MAIN --------------------

$repoRoot = Resolve-RepoRoot -StartDir (Get-Location).Path
Info ("RepoRoot: {0}" -f $repoRoot)

# Static parse
$psFiles = Get-ChildItem -Path $repoRoot -Recurse -Filter *.ps1 |
           Where-Object { $_.FullName -match "\\(scripts|pipeline)\\" }

Info ("Parsing {0} PowerShell files" -f $psFiles.Count)
foreach ($f in $psFiles) {
  Assert-PwshAstParses -Path $f.FullName
}

# Registry validation
$registry = Read-Json (Join-Path $repoRoot "pipeline\phase-registry.json")
Assert-RegistryIntegrity -Reg $registry
Info "Registry integrity: PASS"

if (-not $SkipIntegration) {
  $runs = if ($DoubleRun) { 2 } else { 1 }

  for ($i = 1; $i -le $runs; $i++) {
    Info ("Integration run {0}/{1}" -f $i, $runs)
    Invoke-Ring -RepoRoot $repoRoot
    Info ("Integration run {0}: PASS" -f $i)
  }
}

Info "ALL VALIDATIONS PASS"
