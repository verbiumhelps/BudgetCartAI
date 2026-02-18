# BudgetCartAI — North Star (Phase 0)

## Product constraints (non-negotiable)
- Mobile-first grocery intelligence app: Plan → Shop → Update Pantry → See Savings → Repeat.
- NO chatbot UI. AI appears only as artifacts: recommendations, ranked lists, insights, explanations.
- Tone: calm, trustworthy, subtly warm, lightly vibrant.
- “One primary optimization” rule: exactly one primary CTA visible; secondary insights collapsed.

## Navigation IA (tabs)
Home, Plan, Shop, Pantry, Savings.
Secondary: Settings/Profile, Subscription, Store prefs, Household mgmt.

## Early architecture rules
- Expo + TypeScript (strict)
- expo-router for routing
- Deterministic UI states: loading / empty / error
- Avoid early global state unless needed

## UI rules
- One primary optimization visible at a time.
- Secondary insights collapsed by default.
- Avoid gamification; emphasize clarity and trust.
