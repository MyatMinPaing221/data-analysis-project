# NVIDIA GPU Sales — Phase 1 EDA Summary

## Dataset Overview
- 7,000 transactions, 2024-01 ~ 2026-06 (2.5 years)
- 17 columns: 12 GPU models, 2 GPU families (Consumer Gaming / Data Center AI)
- Data quality: 0 duplicates; nulls only in `bundle_addon` (3,841 — legitimate "no addon")

## Key Findings

### 1. Revenue Driver: Price, not Volume
- Data Center AI GPUs = 15.4% of transactions but **58.9% of total revenue**
- Per-unit price gap (~29x) outweighs the volume disadvantage (~3.7x fewer units/txn)
- Confirmed at SQL level: B200 model alone generated $95.9M despite only 1,943 units sold
- Confirmed by correlation: `units_sold` ↔ `revenue_usd` = **-0.17** (weak negative — counter-intuitive but consistent)

### 2. Price Premium Driver: Stock Scarcity
- `price_premium_pct` rises monotonically with scarcity: In Stock (4.1%) → Low Stock (13.9%) → Backordered (27.9%) → Sold Out (45.0%)
- Sample sizes are all robust (669–3,117 rows per group) — high confidence finding
- Boxplot confirms: box position and width both increase toward Sold Out

### 3. Customer Satisfaction is Driven by Premium %, Not Absolute Price
- `avg_street_price_usd` ↔ satisfaction: positive (expensive GPU ≠ unhappy customer)
- `price_premium_pct` ↔ satisfaction: **-0.67** (strong negative — paying above MSRP hurts satisfaction)
- Business implication: customers tolerate high prices but not price gouging relative to MSRP

### 4. Channel Segmentation Mirrors Product Tier
- Cloud Provider / Direct Enterprise channels: low transaction count, high mean revenue ($190K–$249K)
- Retail/Etail: high volume, low mean revenue (~$27K)
- Pattern holds consistently across all 5 regions

### 5. Weak/Inconclusive Findings (documented for transparency)
- Crypto Mining segment shows highest mean premium (18.65%) but low count (179) and large mean-median gap (8.69) → likely outlier-driven, not a reliable pattern (median 9.96% is close to other segments)

### 6. Revenue Trend
- Growth phase: 2024-01 → 2025-09 (steady increase, $0 → $22M/month)
- Plateau/maturity phase: 2025-10 → 2026-02 (volatile, $22M–$28M range)
- Apparent decline: 2026-03 → 2026-06 (caution: last month may be incomplete data)

## Recommended Next Steps (Phase 2/3)
- SQL: build Star Schema (Fact_Sales + Dim_Date/GPU/Region/Channel)
- Power BI: KPI cards for revenue driver, premium-satisfaction relationship, stock-based pricing alert
