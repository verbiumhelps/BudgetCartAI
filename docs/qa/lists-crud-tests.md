# Grocery Lists CRUD + RLS Tests

## Must pass
- create list (member)
- rename list (member)
- delete list (member)
- add/edit/check/remove item (member)

## Must fail
- access list from non-member household
- modify list in other household

## Notes
- implement as Supabase local E2E once auth + households are fully wired

