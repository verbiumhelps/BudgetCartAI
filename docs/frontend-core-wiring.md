# Frontend Core Wiring

This phase adds deterministic, dependency-free state modules under \/src/state\:
- \udget.ts\: weekly budget, spend-to-date, projected savings calculation
- \pantry.ts\: pantry list helpers (use-soon sort)

Screens can import these modules to render budget + pantry signals without introducing a global state library yet.

