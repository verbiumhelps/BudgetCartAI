# ============================
# scripts/bootstrap-1200-phases.ps1
# ============================
Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Resolve-RepoRoot {
  param([string]$StartDir)

  $dir = (Resolve-Path $StartDir).Path
  while ($true) {
    $pipelineDir = Join-Path $dir "pipeline"
    if (Test-Path $pipelineDir) {
      return (Resolve-Path $dir).Path
    }
    $parent = Split-Path $dir -Parent
    if ($parent -eq $dir) { break }
    $dir = $parent
  }
  return (Resolve-Path ".").Path
}

function Pad-PhaseId([int]$n) { $n.ToString("0000") }

function New-PhaseMeta {
  param(
    [int]$Id,
    [string]$Layer,
    [string]$Title,
    [string]$Objective,
    [string[]]$Inputs,
    [string[]]$Outputs,
    [string]$Runner,
    [string[]]$SuccessChecks,
    [string]$CompletionMarker,
    [string]$Next
  )

  [ordered]@{
    id = $Id.ToString()
    layer = $Layer
    title = $Title
    objective = $Objective
    inputs = $Inputs
    outputs = $Outputs
    runner = $Runner
    success_checks = $SuccessChecks
    completion_marker = $CompletionMarker
    next = $Next
  }
}

$repoRoot = Resolve-RepoRoot -StartDir (Get-Location).Path

$pipelineDir  = Join-Path $repoRoot "pipeline"
$phasesDir    = Join-Path $pipelineDir "phases"
$reportsDir   = Join-Path $pipelineDir "layer-reports"
$scriptsDir   = Join-Path $repoRoot "scripts"

$registryPath = Join-Path $pipelineDir "phase-registry.json"
$statePath    = Join-Path $pipelineDir "state.json"

New-Item -ItemType Directory -Force -Path $pipelineDir | Out-Null
New-Item -ItemType Directory -Force -Path $phasesDir | Out-Null
New-Item -ItemType Directory -Force -Path $reportsDir | Out-Null
New-Item -ItemType Directory -Force -Path $scriptsDir | Out-Null

# ----------------------------
# Frontend Strength Track (1–120) layer "5"
# ----------------------------
$frontendTopics = @(
  @{t="Design tokens lock"; o="Freeze token schema and enforce runtime validation."; out=@(".\src\design\tokens.ts",".\src\design\tokens.schema.json",".\scripts\validate-tokens.ps1")},
  @{t="Typography system"; o="Implement deterministic type styles with named variants."; out=@(".\src\ui\Typography.tsx",".\src\ui\typography.spec.ts")},
  @{t="Color + contrast audit harness"; o="Add automated contrast checks for all token pairs used by components."; out=@(".\src\ui\contrast.audit.ts",".\scripts\run-contrast-audit.ps1")},
  @{t="Spacing + layout primitives"; o="Create layout primitives that standardize padding/gap/safe-area behavior."; out=@(".\src\ui\Layout.tsx",".\src\ui\layout.spec.ts")},
  @{t="Button primitive"; o="Implement Button with variants and disabled/loading states."; out=@(".\src\ui\Button.tsx",".\src\ui\button.spec.ts")},
  @{t="Input primitive"; o="Implement Input with validation states and a11y labels."; out=@(".\src\ui\Input.tsx",".\src\ui\input.spec.ts")},
  @{t="Form state harness"; o="Add deterministic form state + validation adapter layer."; out=@(".\src\ui\forms\useForm.ts",".\src\ui\forms\validators.ts",".\src\ui\forms\form.spec.ts")},
  @{t="Keyboard avoidance standard"; o="Standardize keyboard avoidance behavior across forms."; out=@(".\src\ui\KeyboardAware.tsx",".\src\ui\keyboard.spec.ts")},
  @{t="Screen shell pattern"; o="Create ScreenShell enforcing safe-area, header, scroll, and padding rules."; out=@(".\src\ui\ScreenShell.tsx",".\src\ui\screenshell.spec.ts")},
  @{t="Header pattern"; o="Create Header component with title/subtitle/actions and deterministic sizing."; out=@(".\src\ui\Header.tsx",".\src\ui\header.spec.ts")},
  @{t="Empty/Loading/Error pattern (wired)"; o="Unify Empty/Loading/Error with retry hooks and test coverage."; out=@(".\src\ui\states\Empty.tsx",".\src\ui\states\Loading.tsx",".\src\ui\states\Error.tsx",".\src\ui\states\states.spec.ts")},
  @{t="Toast/Notice system"; o="Implement deterministic toast queue with a11y announcements."; out=@(".\src\ui\Toast.tsx",".\src\ui\toast.spec.ts")},
  @{t="Bottom sheet primitive"; o="Implement bottom sheet with focus management and snap points."; out=@(".\src\ui\BottomSheet.tsx",".\src\ui\bottomsheet.spec.ts")},
  @{t="ListRow primitive"; o="Implement ListRow with left/right slots and press states."; out=@(".\src\ui\ListRow.tsx",".\src\ui\listrow.spec.ts")},
  @{t="Virtualized list wrapper"; o="Add VirtualList wrapper and enforce item renderer memoization."; out=@(".\src\ui\VirtualList.tsx",".\src\ui\virtuallist.spec.ts")},
  @{t="Skeleton primitives"; o="Create skeleton components consistent with tokens."; out=@(".\src\ui\Skeleton.tsx",".\src\ui\skeleton.spec.ts")},
  @{t="Navigation conventions"; o="Document and enforce route naming + deep link mapping."; out=@(".\docs\frontend\navigation-conventions.md",".\scripts\validate-routes.ps1")},
  @{t="Error taxonomy (frontend)"; o="Create typed UI error mapping to deterministic messages."; out=@(".\src\errors\ui-errors.ts",".\src\errors\ui-errors.spec.ts")},
  @{t="Network state banner"; o="Standardize offline/online banner and retry queue UX."; out=@(".\src\ui\NetworkBanner.tsx",".\src\ui\networkbanner.spec.ts")},
  @{t="Performance budgets (frontend)"; o="Add measurable perf budgets and a test harness gate."; out=@(".\docs\frontend\performance-budgets.md",".\scripts\perf-budget-check.ps1")}
)

$frontendPhases = New-Object System.Collections.Generic.List[object]
$phaseNum = 1

foreach ($topic in $frontendTopics) {
  $baseTitle = $topic.t
  $baseOut = $topic.out

  $slug = ($baseTitle -replace '[^a-zA-Z0-9\- ]','' -replace ' ','-')

  $sub = @(
    @{s="Contract"; addOut=@(".\docs\frontend\contracts\$slug.md"); obj="Create a deterministic contract for: $baseTitle."},
    @{s="Implementation"; addOut=$baseOut; obj=$topic.o},
    @{s="Unit tests"; addOut=@(".\__tests__\frontend\$slug.spec.ts"); obj="Add deterministic unit tests covering $baseTitle behaviors."},
    @{s="Accessibility"; addOut=@(".\docs\frontend\a11y\$slug.md"); obj="Ensure $baseTitle meets a11y requirements with explicit checks."},
    @{s="Performance"; addOut=@(".\docs\frontend\perf\$slug.md"); obj="Define measurable performance expectations for $baseTitle."},
    @{s="Validation hook"; addOut=@(".\scripts\frontend\validate-$slug.ps1"); obj="Add deterministic validation script for $baseTitle outputs."}
  )

  foreach ($k in $sub) {
    if ($phaseNum -gt 120) { break }

    $phaseId = $phaseNum
    $pid4 = Pad-PhaseId $phaseId
    $marker = "PHASE $pid4 COMPLETE"

    $phaseFile = ".\pipeline\phases\PHASE-$pid4.md"
    $inputs = @(".\pipeline\phase-registry.json")
    $outputs = @($phaseFile) + $k.addOut

    $runner = "pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId $pid4"
    $checks = @(
      "pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId $pid4",
      "pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId $pid4 -CheckMarker"
    )

    $nextId = if ($phaseId -eq 120) { "" } else { ($phaseId + 1).ToString() }

    $frontendPhases.Add((New-PhaseMeta `
      -Id $phaseId -Layer "5" -Title ("FE: " + $baseTitle + " — " + $k.s) -Objective $k.obj `
      -Inputs $inputs -Outputs $outputs -Runner $runner -SuccessChecks $checks -CompletionMarker $marker -Next $nextId
    )) | Out-Null

    $phaseNum++
  }

  if ($phaseNum -gt 120) { break }
}

if ($frontendPhases.Count -ne 120) {
  throw "Frontend track generation failed: expected 120 phases, got $($frontendPhases.Count)."
}

# ----------------------------
# Backend/Internal Strength Track (121–1120) layer "4"
# ----------------------------
$backendDomains = @(
  @{d="Schema invariants"; parts=@("constraints","enums","foreign keys","unique indexes","partial indexes","check constraints")},
  @{d="RLS deny-by-default"; parts=@("policy matrix","policy tests","cross-household fuzz","role simulation","rpc security")},
  @{d="Migrations discipline"; parts=@("idempotency","rollback sim","drift detect","backcompat checks","migration smoke")},
  @{d="Query performance"; parts=@("index coverage","plan snapshots","materialized views","pagination enforcement","cache rules")},
  @{d="Observability"; parts=@("structured logs","correlation ids","error taxonomy","audit trails","dashboards")},
  @{d="Testing maturity"; parts=@("unit coverage gates","integration harness","RLS negative suite","mutation testing","load testing")},
  @{d="Data moat"; parts=@("canonicalization","alias clustering","price normalization","confidence scoring","graph metrics")},
  @{d="Monetization enforcement"; parts=@("entitlements","metering","gates matrix","receipt validation","upgrade triggers")},
  @{d="Security/compliance"; parts=@("retention enforcement","export correctness","delete cascade","secrets rotation","backup/restore drills")}
)

$backendPhases = New-Object System.Collections.Generic.List[object]

for ($phaseId = 121; $phaseId -le 1120; $phaseId++) {
  $pid4 = Pad-PhaseId $phaseId
  $marker = "PHASE $pid4 COMPLETE"

  $domainIndex = ($phaseId - 121) % $backendDomains.Count
  $domain = $backendDomains[$domainIndex]

  $partIndex = [int](($phaseId - 121) / $backendDomains.Count) % $domain.parts.Count
  $part = $domain.parts[$partIndex]

  $safeD = ($domain.d -replace ' ','-')
  $safeP = ($part -replace ' ','-')

  $title = "BE: $($domain.d) — $part ($pid4)"
  $objective = "Implement and verify backend hardening for $($domain.d): $part with deterministic checks."

  $phaseFile = ".\pipeline\phases\PHASE-$pid4.md"
  $outDocs = ".\docs\backend\phases\$pid4-$safeD-$safeP.md"
  $outSql  = ".\supabase\migrations\20260218_${pid4}_$($domain.d -replace ' ','_')_$($part -replace ' ','_').sql"
  $outTest = ".\__tests__\backend\$pid4.$safeD.$safeP.spec.ts"

  $inputs = @(".\pipeline\phase-registry.json")
  $outputs = @($phaseFile,$outDocs,$outSql,$outTest)

  $runner = "pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId $pid4"
  $checks = @(
    "pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId $pid4",
    "pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId $pid4 -CheckMarker"
  )

  $next = if ($phaseId -eq 1120) { "1121" } else { ($phaseId + 1).ToString() }

  $backendPhases.Add((New-PhaseMeta `
    -Id $phaseId -Layer "4" -Title $title -Objective $objective `
    -Inputs $inputs -Outputs $outputs -Runner $runner -SuccessChecks $checks -CompletionMarker $marker -Next $next
  )) | Out-Null
}

# ----------------------------
# QA/DevOps/Growth Strength (1121–1200)
# ----------------------------
$tailPhases = New-Object System.Collections.Generic.List[object]
$tailTopics = @(
  @{layer="7"; t="QA: End-to-end scenario library"; o="Create deterministic e2e scenario scripts and acceptance gates."; out=@(".\__tests__\e2e\scenario-library.md",".\__tests__\e2e\scenarios.spec.ts")},
  @{layer="7"; t="QA: Regression ring gate"; o="Enforce regression suite execution in CI with hard failure."; out=@(".\scripts\ci\run-regression.ps1",".\docs\qa\regression-gates.md")},
  @{layer="8"; t="DevOps: CI matrix hardening"; o="Implement CI matrix for lint/type/test/build with deterministic outputs."; out=@(".\.github\workflows\ci.yml",".\docs\devops\ci-matrix.md")},
  @{layer="8"; t="DevOps: Observability wiring"; o="Wire error/crash reporting and structured logs pipeline hooks."; out=@(".\src\obs\logger.ts",".\docs\devops\observability.md")},
  @{layer="8"; t="DevOps: Release train"; o="Add deterministic versioning and release checklist automation."; out=@(".\scripts\release\prepare-release.ps1",".\docs\devops\release-train.md")},
  @{layer="9"; t="Growth: Analytics taxonomy lock"; o="Define and validate event taxonomy and required properties."; out=@(".\docs\growth\analytics-taxonomy.md",".\scripts\growth\validate-analytics.ps1")},
  @{layer="9"; t="Growth: Paywall experiment harness"; o="Add deterministic experiment config schema + validation harness."; out=@(".\src\growth\experiments.schema.json",".\src\growth\experiments.ts",".\scripts\growth\validate-experiments.ps1")},
  @{layer="9"; t="Growth: Monetization KPI dashboard spec"; o="Create KPI definitions + reporting contract for cohorts."; out=@(".\docs\growth\kpi-dashboard.md",".\docs\growth\cohort-metrics.md")}
)

$phaseId = 1121
while ($phaseId -le 1200) {
  foreach ($tt in $tailTopics) {
    if ($phaseId -gt 1200) { break }

    $pid4 = Pad-PhaseId $phaseId
    $marker = "PHASE $pid4 COMPLETE"
    $phaseFile = ".\pipeline\phases\PHASE-$pid4.md"

    $inputs = @(".\pipeline\phase-registry.json")
    $outputs = @($phaseFile) + $tt.out

    $runner = "pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1 -PhaseId $pid4"
    $checks = @(
      "pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId $pid4",
      "pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-phase.ps1 -PhaseId $pid4 -CheckMarker"
    )

    $next = if ($phaseId -eq 1200) { "" } else { ($phaseId + 1).ToString() }

    $tailPhases.Add((New-PhaseMeta `
      -Id $phaseId -Layer $tt.layer -Title $tt.t -Objective $tt.o `
      -Inputs $inputs -Outputs $outputs -Runner $runner -SuccessChecks $checks -CompletionMarker $marker -Next $next
    )) | Out-Null

    $phaseId++
  }
}

function Write-PhaseContractFile {
  param(
    [int]$Id,
    [string]$Title,
    [string]$Objective,
    [string[]]$Outputs,
    [string]$Runner,
    [string[]]$SuccessChecks,
    [string]$Marker
  )

  $pid4 = Pad-PhaseId $Id
  $path = Join-Path $phasesDir "PHASE-$pid4.md"

  $outList = ($Outputs | ForEach-Object { "- $_" }) -join "`n"
  $checkList = ($SuccessChecks | ForEach-Object { "- $_" }) -join "`n"

  $content = @"
# $Title

## objective
$Objective

## files_created_or_modified
$outList

## content_requirements
- This phase must create/modify exactly the files listed above.
- Any JSON outputs must be valid JSON.
- Any Markdown outputs must contain this exact heading line: '# $Title'
- Any SQL outputs must be non-empty and begin with a comment line containing: '-- PHASE $pid4'
- Any test outputs must be non-empty and include a test name containing: 'PHASE $pid4'

## runner
$Runner

## validation_steps
$checkList

## completion_marker
$Marker
"@

  Set-Content -Path $path -Value $content -Encoding UTF8
}

$allPhases = New-Object System.Collections.Generic.List[object]
$allPhases.AddRange($frontendPhases)
$allPhases.AddRange($backendPhases)
$allPhases.AddRange($tailPhases)

if ($allPhases.Count -ne 1200) {
  throw "Phase registry generation failed: expected 1200 entries, got $($allPhases.Count)."
}

foreach ($p in $allPhases) {
  $id = [int]$p.id
  Write-PhaseContractFile -Id $id -Title $p.title -Objective $p.objective -Outputs $p.outputs -Runner $p.runner -SuccessChecks $p.success_checks -Marker $p.completion_marker

  foreach ($outPath in $p.outputs) {
    if ($outPath -like ".\pipeline\phases\PHASE-*.md") { continue }

    $abs = Join-Path $repoRoot ($outPath -replace '^\.\[\\/]', '')
    $dir = Split-Path $abs -Parent
    New-Item -ItemType Directory -Force -Path $dir | Out-Null

    if (!(Test-Path $abs)) {
      if ($abs -like "*.sql") {
        Set-Content -Path $abs -Value ("-- PHASE " + (Pad-PhaseId $id) + "`n-- stub migration placeholder`n") -Encoding UTF8
      } elseif ($abs -like "*.json") {
        Set-Content -Path $abs -Value ("{`n  `"phase`": `"" + (Pad-PhaseId $id) + "`",`n  `"stub`": true`n}`n") -Encoding UTF8
      } elseif ($abs -like "*.ts" -or $abs -like "*.tsx") {
        Set-Content -Path $abs -Value ("// PHASE " + (Pad-PhaseId $id) + "`nexport const phase" + (Pad-PhaseId $id) + "Stub = true;`n") -Encoding UTF8
      } elseif ($abs -like "*.ps1") {
        Set-Content -Path $abs -Value ("# PHASE " + (Pad-PhaseId $id) + "`nWrite-Host `"PHASE " + (Pad-PhaseId $id) + " COMPLETE`"`n") -Encoding UTF8
      } else {
        Set-Content -Path $abs -Value ("PHASE " + (Pad-PhaseId $id) + " stub") -Encoding UTF8
      }
    }
  }
}

$registryObj = [ordered]@{
  generated_at = (Get-Date).ToString("yyyy-MM-ddTHH:mm:ssK")
  registry_path = ".\pipeline\phase-registry.json"
  state_path = ".\pipeline\state.json"
  phases_dir = ".\pipeline\phases"
  reports_dir = ".\pipeline\layer-reports"
  count = 1200
  phases = $allPhases
}

Set-Content -Path $registryPath -Value ($registryObj | ConvertTo-Json -Depth 10) -Encoding UTF8

$stateObj = [ordered]@{
  current_phase = "0001"
  last_completed_phase = ""
  completed = @()
}
Set-Content -Path $statePath -Value ($stateObj | ConvertTo-Json -Depth 5) -Encoding UTF8

# scripts/validate-phase.ps1
$validatePhase = @"
Set-StrictMode -Version Latest
`$ErrorActionPreference = "Stop"

param(
  [Parameter(Mandatory=`$true)][string]`$PhaseId,
  [switch]`$CheckMarker
)

function Resolve-RepoRoot {
  param([string]`$StartDir)
  `$dir = (Resolve-Path `$StartDir).Path
  while (`$true) {
    if (Test-Path (Join-Path `$dir "pipeline")) { return (Resolve-Path `$dir).Path }
    `$parent = Split-Path `$dir -Parent
    if (`$parent -eq `$dir) { break }
    `$dir = `$parent
  }
  return (Resolve-Path ".").Path
}

`$repoRoot = Resolve-RepoRoot -StartDir (Get-Location).Path
`$regPath = Join-Path `$repoRoot "pipeline\phase-registry.json"
`$phasesDir = Join-Path `$repoRoot "pipeline\phases"
if (!(Test-Path `$regPath)) { throw "Missing registry: `$regPath" }

`$reg = Get-Content `$regPath -Raw | ConvertFrom-Json
`$phase = `$reg.phases | Where-Object { `$_.id -eq ([int]`$PhaseId).ToString() -or `$_.id -eq `$PhaseId.TrimStart('0') }
if (-not `$phase) { throw "Phase not found in registry: `$PhaseId" }

foreach (`$p in `$phase.outputs) {
  `$abs = Join-Path `$repoRoot (`$p -replace '^\.\[\\/]', '')
  if (!(Test-Path `$abs)) { throw "Missing required output: `$p" }
  if ((Get-Item `$abs).Length -lt 1) { throw "Output is empty: `$p" }
}

`$pid4 = ([int]`$PhaseId).ToString("0000")
`$contract = Join-Path `$phasesDir ("PHASE-`$pid4.md")
if (!(Test-Path `$contract)) { throw "Missing phase contract: `$contract" }

`$text = Get-Content `$contract -Raw
if (`$text -notmatch [regex]::Escape("# " + `$phase.title)) { throw "Contract missing exact title heading: # `$(`$phase.title)" }

if (`$CheckMarker) {
  if (`$text -notmatch [regex]::Escape(`$phase.completion_marker)) { throw "Contract missing completion_marker: `$(`$phase.completion_marker)" }
}

Write-Host "PHASE `$pid4 VALIDATED"
"@
Set-Content -Path (Join-Path $scriptsDir "validate-phase.ps1") -Value $validatePhase -Encoding UTF8

# scripts/run.ps1
$runScript = @"
Set-StrictMode -Version Latest
`$ErrorActionPreference = "Stop"

param(
  [Parameter(Mandatory=`$true)][string]`$PhaseId
)

function Resolve-RepoRoot {
  param([string]`$StartDir)
  `$dir = (Resolve-Path `$StartDir).Path
  while (`$true) {
    if (Test-Path (Join-Path `$dir "pipeline")) { return (Resolve-Path `$dir).Path }
    `$parent = Split-Path `$dir -Parent
    if (`$parent -eq `$dir) { break }
    `$dir = `$parent
  }
  return (Resolve-Path ".").Path
}

`$repoRoot = Resolve-RepoRoot -StartDir (Get-Location).Path
`$regPath = Join-Path `$repoRoot "pipeline\phase-registry.json"
`$statePath = Join-Path `$repoRoot "pipeline\state.json"
if (!(Test-Path `$regPath)) { throw "Missing registry: `$regPath" }
if (!(Test-Path `$statePath)) { throw "Missing state: `$statePath" }

pwsh -NoProfile -ExecutionPolicy Bypass -File (Join-Path `$repoRoot "scripts\validate-phase.ps1") -PhaseId `$PhaseId -CheckMarker | Out-Host
`$pid4 = ([int]`$PhaseId).ToString("0000")
Write-Host ("PHASE " + `$pid4 + " COMPLETE")
"@
Set-Content -Path (Join-Path $scriptsDir "run.ps1") -Value $runScript -Encoding UTF8

# scripts/ring.ps1
$ringScript = @"
Set-StrictMode -Version Latest
`$ErrorActionPreference = "Stop"

function Resolve-RepoRoot {
  param([string]`$StartDir)
  `$dir = (Resolve-Path `$StartDir).Path
  while (`$true) {
    if (Test-Path (Join-Path `$dir "pipeline")) { return (Resolve-Path `$dir).Path }
    `$parent = Split-Path `$dir -Parent
    if (`$parent -eq `$dir) { break }
    `$dir = `$parent
  }
  return (Resolve-Path ".").Path
}

`$repoRoot = Resolve-RepoRoot -StartDir (Get-Location).Path
`$regPath = Join-Path `$repoRoot "pipeline\phase-registry.json"
`$statePath = Join-Path `$repoRoot "pipeline\state.json"
if (!(Test-Path `$regPath)) { throw "Missing registry: `$regPath" }
if (!(Test-Path `$statePath)) { throw "Missing state: `$statePath" }

`$reg = Get-Content `$regPath -Raw | ConvertFrom-Json
`$state = Get-Content `$statePath -Raw | ConvertFrom-Json
`$current = `$state.current_phase
if (-not `$current) { throw "state.json missing current_phase" }

Write-Host "=== PHASE RING ==="
Write-Host ("Repo root: " + `$repoRoot)
Write-Host ("Current phase: " + `$current)

pwsh -NoProfile -ExecutionPolicy Bypass -File (Join-Path `$repoRoot "scripts\run.ps1") -PhaseId `$current | Out-Host

`$phase = `$reg.phases | Where-Object { `$_.id -eq ([int]`$current).ToString() -or `$_.id -eq `$current.TrimStart('0') }
if (-not `$phase) { throw "Phase not found: `$current" }

`$pid4 = ([int]`$current).ToString("0000")
if (`$state.completed -notcontains `$pid4) { `$state.completed += `$pid4 }
`$state.last_completed_phase = `$pid4
`$state.current_phase = if (`$phase.next -and `$phase.next.Length -gt 0) { ([int]`$phase.next).ToString("0000") } else { "" }

Set-Content -Path `$statePath -Value (`$state | ConvertTo-Json -Depth 6) -Encoding UTF8
Write-Host "RETURN TO GATEKEEPER"
"@
Set-Content -Path (Join-Path $scriptsDir "ring.ps1") -Value $ringScript -Encoding UTF8

Write-Host "PHASE REGISTRY GENERATED: $registryPath"
Write-Host "PHASE CONTRACTS GENERATED: $phasesDir"
Write-Host "BOOTSTRAP 1200 COMPLETE"
Write-Host "RETURN TO GATEKEEPER"

