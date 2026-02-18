# Cross-household Isolation (Critical)

## Goal
Prove a user cannot read/write data from a household they are not a member of.

## Required tests
- household_members: cannot insert for other household unless owner/admin
- households: cannot read households not linked to user
- invites: cannot enumerate other household invites

## Implementation plan
- Use Supabase local + SQL seed + role-based JWT contexts

