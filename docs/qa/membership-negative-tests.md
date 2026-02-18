# Membership Negative Tests

## Goal
Ensure non-admin/non-owner cannot perform privileged membership actions.

## Must fail (denied)
- member promotes/demotes another member
- member removes another member
- member creates invites
- member edits household name/region

## Must pass
- admin/owner can invite, promote/demote, remove
- members can read household + members list

