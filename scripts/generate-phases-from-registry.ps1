Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Ensure-Dir([string]$p) { if (-not (Test-Path $p)) { New-Item -ItemType Directory -Force -Path $p | Out-Null } }

$reg = Get-Content ".\pipeline\phase-registry.json" -Raw -Encoding UTF8 | ConvertFrom-Json

Ensure-Dir ".\pipeline\phases"

foreach ($p in $reg) {
  $id = [int]$p.id
  $path = ".\pipeline\phases\phase-$id.ps1"

  $lines = @()
  $lines += "# PHASE $id — $($p.title)"
  $lines += "Set-StrictMode -Version Latest"
  $lines += '$ErrorActionPreference = "Stop"'
  $lines += ""
  $lines += '$target = "' + $p.write.path.Replace('"','\"') + '"'
  $lines += '$content = @('
  foreach ($ln in ($p.write.content -split "`n")) {
    $lines += '  "' + ($ln.Replace('"','\"')) + '"'
  }
  $lines += ') -join "`n"'
  $lines += 'New-Item -ItemType Directory -Force -Path (Split-Path -Parent $target) | Out-Null'
  $lines += 'Set-Content -Path $target -Value ($content + "`n") -Encoding UTF8'
  $lines += ""
  $lines += 'Write-Host "PHASE ' + $id + ' COMPLETE"'

  Set-Content -Path $path -Value (($lines -join "`n") + "`n") -Encoding UTF8
}

Write-Host "PHASES GENERATED FROM REGISTRY"

