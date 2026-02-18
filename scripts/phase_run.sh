#!/usr/bin/env bash
set -euo pipefail

PHASE_ID="${1:-phase_0}"

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

iso_now() { date -u +"%Y-%m-%dT%H:%M:%SZ"; }

run_check() {
  local name="$1"
  local cmd="$2"
  local start end dur rc status details

  start=$(date +%s%3N 2>/dev/null || date +%s000)
  set +e
  eval "$cmd"
  rc=$?
  set -e
  end=$(date +%s%3N 2>/dev/null || date +%s000)
  dur=$((end - start))

  if [ $rc -ne 0 ]; then
    status="fail"
    details="command failed (exit $rc): $cmd"
  else
    status="pass"
    details="ok"
  fi
  CHECKS+=("{\"name\":\"$name\",\"status\":\"$status\",\"details\":\"$details\",\"metrics\":{\"duration_ms\":$dur}}")
}

skip_check() {
  local name="$1"
  local reason="$2"
  CHECKS+=("{\"name\":\"$name\",\"status\":\"skip\",\"details\":\"$reason\",\"metrics\":{}}")
}

# git
if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  BRANCH="$(git rev-parse --abbrev-ref HEAD)"
  COMMIT="$(git rev-parse HEAD)"
  if [ -n "$(git status --porcelain)" ]; then DIRTY=true; else DIRTY=false; fi
else
  BRANCH="no_git"; COMMIT="no_git"; DIRTY=false
fi

# env
NODE_VER="$(node -v 2>/dev/null || echo "missing")"
PM_VER="$(npm -v 2>/dev/null || echo "missing")"
EXPO_VER="$(npx -y expo --version 2>/dev/null || echo "missing")"
EAS_VER="$(npx -y eas --version 2>/dev/null || echo "missing")"

CHECKS=()

echo "=== BudgetCartAI Phase Runner ==="
echo "phase_id=$PHASE_ID"
echo "repo_root=$ROOT_DIR"

run_check "lint" "npm run -s lint"
run_check "typecheck" "npm run -s typecheck"

TEST_SCRIPT="$(node -e "try{const p=require('./package.json'); console.log((p.scripts&&p.scripts.test)||'');}catch(e){console.log('');}")"
if echo "$TEST_SCRIPT" | grep -qi "no tests"; then
  skip_check "unit_tests" "no tests configured in phase_0"
else
  run_check "unit_tests" "npm test --silent"
fi

CHECKS_JSON="["
for i in "${!CHECKS[@]}"; do
  CHECKS_JSON+="${CHECKS[$i]}"
  if [ "$i" -lt "$((${#CHECKS[@]}-1))" ]; then CHECKS_JSON+=","; fi
done
CHECKS_JSON+="]"

echo "===PHASE_REPORT_JSON_BEGIN==="
cat <<JSON
{
  "contract_version": "v1",
  "phase_id": "$PHASE_ID",
  "timestamp_utc": "$(iso_now)",
  "git": { "branch": "$BRANCH", "commit": "$COMMIT", "dirty": $DIRTY },
  "env": { "node": "$NODE_VER", "pm": "npm@$PM_VER", "expo": "$EXPO_VER", "eas": "$EAS_VER" },
  "checks": $CHECKS_JSON,
  "artifacts": [
    { "name": "north_star", "path": "docs/NORTH_STAR.md" },
    { "name": "atomic_units", "path": "docs/ATOMIC_UNITS.md" },
    { "name": "events_plan", "path": "docs/EVENTS.md" },
    { "name": "phase_runner", "path": "scripts/phase_run.sh" }
  ],
  "summary": "Phase 0 validation complete."
}
JSON
echo "===PHASE_REPORT_JSON_END==="
