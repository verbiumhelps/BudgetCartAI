# BudgetCartAI - Problem Decomposition Matrix

This matrix breaks grocery spending into atomic, measurable pain points.
Each problem must later map to:
- A system feature
- A measurable metric
- A monetizable advantage

---

## 1. Budget Uncertainty

**Pain:** Shoppers do not know if they are staying within weekly budget while shopping.

- No real-time feedback during shopping
- No projection before checkout
- No clear "over/under" signal

**Measurable Signal:**
- % of carts exceeding budget
- Variance between planned vs actual spend

---

## 2. Duplicate Purchases

**Pain:** Buying items already in pantry.

- No pantry visibility in-store
- No cross-reference between cart and pantry

**Measurable Signal:**
- Items purchased within X days of prior purchase
- Self-reported duplicate frustration

---

## 3. Food Waste

**Pain:** Items expire unused.

- No expiry tracking
- No proactive usage suggestions

**Measurable Signal:**
- Expired pantry events
- Estimated dollar value of waste

---

## 4. Suboptimal Store Selection

**Pain:** Same items cost more at different stores.

- No price comparison awareness
- No optimization by store

**Measurable Signal:**
- Price variance between stores for same canonical item
- Potential savings per list

---

## 5. Inefficient Substitutions

**Pain:** Shoppers miss cheaper equivalent products.

- Brand loyalty inertia
- Lack of normalized canonical matching

**Measurable Signal:**
- Price delta between selected and cheaper equivalent
- Substitution acceptance rate

---

## 6. Cognitive Load

**Pain:** Managing grocery planning is mentally exhausting.

- Multiple apps
- Manual tracking
- Fragmented experience

**Measurable Signal:**
- Weekly loop completion rate
- Drop-off between plan and pantry update

---

## 7. Invisible Savings

**Pain:** Users cannot clearly see long-term impact.

- No accumulation dashboard
- No reinforcement loop

**Measurable Signal:**
- Cumulative savings tracked
- Savings insight views per week

---

# Design Constraint

Each feature added later must explicitly map to at least one defined problem above.
If not, it is scope creep.