# Similarity Scoring v0

## Inputs
- category match
- brand match (optional)
- size/pack compatibility (optional)

## Score (0–1)
- base 0.5 for same category
- +0.2 if similar size/pack
- +0.1 if same brand

## Output
- store substitution candidates sorted by score

