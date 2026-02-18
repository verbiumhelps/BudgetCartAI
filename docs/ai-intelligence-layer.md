# AI Intelligence Layer (Deterministic)

This phase adds \/src/ai/recommendations.ts\ — a rules-first, testable module:
- \ecommendUseSoon\: pantry expiry nudges
- \estPriceDelta\: deterministic savings delta calculator
- \ecommendSubstitute\: standard substitute recommendation shape

No model calls, no chatbot UI, and no speculative ML. This is a stable interface for future upgrades.

