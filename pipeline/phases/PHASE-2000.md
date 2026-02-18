# PHASE 2000 — V2 Cycle Bootstrap Guard

## Objective
Initialize v2 cycle and enforce baseline ancestry from v1.

## Requirements

1. Confirm tag `v1.0-phase-ring` exists.
2. Confirm current branch is not `main`.
3. Confirm current HEAD descends from `v1.0-phase-ring`.
4. Initialize `pipeline/cycles/v2.json`.
5. Initialize `pipeline/state.v2.json`.

## Validation Logic (pseudo)

- git rev-parse v1.0-phase-ring
- git merge-base --is-ancestor v1.0-phase-ring HEAD
- if false → fail hard
