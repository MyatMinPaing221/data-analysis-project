# RetailPulse — Multi-Category Retail Sales Analysis (Power BI)

An end-to-end Power BI dashboard analyzing 120,000 retail transactions (2024–2025) across 8 product categories, 5 regions, and 3 sales channels — built to answer real business questions for a retail operations team.

![Dashboard Preview](screenshots/executive_summary.png)

## 🎯 Business Questions Answered

1. Which sales channel (Online / In-Store / Mobile App) performs best?
2. Does customer segment (VIP / Loyal / New / Returning) actually correlate with higher value?
3. How does discount rate affect average order value?
4. Which region–category combinations are strongest/weakest?
5. Does customer demographic (age, gender) predict category preference?
6. What's the year-over-year trend and seasonality pattern?

## 💡 Key Findings

| Finding | Detail |
|---|---|
| **Category is the primary driver** | Beauty (6.4M) outsold Clothing (4.6M) by **37%** — consistent across every region, age group, and gender |
| **Segments are nearly flat** | VIP, Loyal, New, and Returning customers differ by **< 2%** in AOV — segmentation isn't currently translating to differentiated value |
| **Channels are nearly flat** | In-Store, Online, and Mobile App show **< 2%** variance in sales and AOV |
| **Discount has a real cost** | Moving from 0% → 30% discount correlates with a **31% drop** in average order value |
| **YoY growth is flat** | 2024 (22.79M) vs 2025 (22.57M) — a **-1%** change, no major decline or growth |

**Takeaway**: Segment- and channel-specific strategies aren't currently differentiated in this data — Category-level strategy is where the signal is strongest.

## 🛠️ Technical Approach

**Data Modeling**
- Star schema: 1 Fact table (`Fact_Sales`) + 4 Dimension tables (`Dim_Product`, `Dim_Customer`, `Dim_Region`, `Dim_Date`)
- `Dim_Date` built with `CALENDAR()` + `ADDCOLUMNS()`, marked as a proper Date Table for Time Intelligence

**DAX Highlights**
- Core measures: `Total Sales`, `Average Order Value` (via `DIVIDE` for safe division), `Avg Discount %`
- Time Intelligence: `SAMEPERIODLASTYEAR` for YoY comparison
- Custom analysis measure: `Sales Drop %` — compares average order value at minimum vs. maximum discount level dynamically (`MIN()`/`MAX()` rather than hard-coded values)

**Dashboard Design**
- 5 pages: Executive Summary, Customer Segments, Discount Impact, Category Breakdown, Time Trend
- Cross-page synced date slicer (global filter)
- Conditional formatting heatmaps (single-hue gradient, not diverging red/green — avoids misleading "good/bad" color coding)
- Custom theme for visual consistency

## 🐛 A Debugging Note

Built a `Sales Drop %` measure that initially returned **-100%** instead of the expected ~-31%. Root cause: a `CALCULATE()` filter referenced a column that had since been replaced (`discount_pct` → `Discount_Fraction`), and the value type didn't match (`30` vs `0.30`). DAX didn't throw an error — it silently returned `BLANK()`/`0`, producing a plausible-looking but wrong number. Fixed by aligning the filter to the actual column name and value format, and reinforced a habit: **always sanity-check DAX output against a manually expected range, since incorrect filters fail silently.**

## 📁 Repo Contents

```
retailpulse-dashboard/
├── retail_sales_dataset.csv     # source data (120,000 rows)
├── RetailPulse.pbix             # Power BI file
├── screenshots/                 # dashboard page exports
└── README.md
```

## 🔧 Tools Used

Power BI Desktop · Power Query · DAX · Star Schema Data Modeling

---

*Built as a hands-on practice project to strengthen Power BI, DAX, and dashboard design skills.*
