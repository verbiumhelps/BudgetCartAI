# BudgetCartAI - Core Domain Model (Conceptual)

This document defines the canonical domain concepts for BudgetCartAI. It is not a database schema.
It is the source-of-truth vocabulary for backend tables, API contracts, frontend state, and AI inputs/outputs.

## Design Principles
- Household-centric: most data is scoped to a household, not a single user.
- Mobile-first: flows optimize for quick, low-friction updates in-store.
- One primary optimization at a time: recommendations are ranked and surfaced one at a time.
- Evidence-first: every savings claim should be attributable to a comparison basis.

## Core Entities

| Entity | Purpose | Key Identifiers | Notes |
|---|---|---|---|
| User | Authenticated person using the app | user_id | Can belong to one or more households |
| Household | Shared context for budgets, pantry, and savings | household_id | Primary scope boundary |
| HouseholdMember | Membership + role within household | household_id + user_id | role: owner/admin/member |
| Store | Retailer location or chain representation | store_id | Start with SoCal chains |
| CanonicalItem | Normalized product concept | canonical_item_id | Links store SKUs to one concept |
| StoreItem | Store-specific SKU and price facts | store_item_id | References canonical_item_id + store_id |
| BudgetPeriod | A weekly budget window | budget_period_id | Typically 7 days; start/end timestamps |
| BudgetPlan | Planned allocations and targets | budget_plan_id | Links to budget_period_id + household_id |
| ShoppingList | Plan of intended purchases | shopping_list_id | Optional grouping by store |
| CartSnapshot | Observed cart contents during shopping | cart_snapshot_id | Captures quantities and prices |
| PantryItem | Item instance or aggregated quantity in pantry | pantry_item_id | Tracks quantity + optional expiry |
| PantryEvent | Mutation event for pantry (add/use/expire) | pantry_event_id | Append-only mutation log |
| Recipe | Recipe metadata and constraints | recipe_id | Uses CanonicalItem ingredients |
| Recommendation | A single recommended action | recommendation_id | Always explainable; ranked |
| SavingsInsight | Savings outcome (projected or realized) | savings_insight_id | Links to basis and evidence |

## Key Relationships
- User -> HouseholdMember -> Household
- Household -> BudgetPeriod -> BudgetPlan
- Household -> PantryItem and PantryEvent
- Store -> StoreItem -> CanonicalItem
- ShoppingList and CartSnapshot reference Store, StoreItem, and/or CanonicalItem
- Recommendation references a trigger context (list/cart/pantry/budget) and produces an action
- SavingsInsight references Recommendation (when applicable) and a comparison basis

## Core Flows (Entity Lifecycles)

### Weekly Budget Loop
1. Create BudgetPeriod for the week
2. Create/Update BudgetPlan (targets and constraints)
3. Plan list (ShoppingList) optionally by store
4. Shop: capture CartSnapshot updates (in-store adjustments)
5. Update pantry via PantryEvent(s) and reconcile PantryItem
6. Produce SavingsInsight(s): projected vs realized

### Pantry Mutation Model
- PantryEvent is the authoritative log (append-only).
- PantryItem is the current derived state (for fast UI).
- Events include: add, consume, adjust, expire, waste, correct.

## Recommendation Contract (Non-Chat UI)
A Recommendation is a single action with explanation:
- context: where it applies (store, list, cart, pantry, budget period)
- action_type: substitute, remove_duplicate, choose_store, defer_purchase, recipe_from_pantry, expiry_alert
- candidates: items considered and their attributes
- rationale: short explanation and basis
- expected_impact: projected savings or waste avoided

## Savings Model (Evidence-First)
- projected_savings: computed before or during shopping based on alternative choices
- realized_savings: computed after shopping using CartSnapshot final vs basis
- basis types: previous purchase price, average recent price, alternative store price, alternative SKU price
- every savings number stores the basis reference and calculation inputs

## Analytics Events (Acquisition-Grade)
- budget_period_started
- plan_created
- cart_updated
- pantry_event_recorded
- recommendation_shown
- recommendation_applied
- savings_insight_viewed

## Non-Goals
- No social feed domain concepts
- No coupon gamification constructs
- No generalized assistant/chat session entity as primary UI

