# NVIDIA GPU Sales Analytics Dashboard

An end-to-end data analytics portfolio project that transforms raw GPU sales transaction data into a manager-level Power BI dashboard — covering the full pipeline from Python EDA to a star-schema SQL model to an interactive 4-page report.

![Power BI](https://img.shields.io/badge/Power%20BI-Dashboard-F2C811?logo=powerbi&logoColor=black)
![Python](https://img.shields.io/badge/Python-EDA-3776AB?logo=python&logoColor=white)
![SQL](https://img.shields.io/badge/SQL-SQLite-4479A1?logo=sqlite&logoColor=white)
![DAX](https://img.shields.io/badge/DAX-Measures-orange)

---

## 📌 Project Overview

This project simulates a real-world **Sales Manager decision-support dashboard** for a company selling NVIDIA GPUs across both **consumer (RTX series)** and **enterprise/data-center (B200, H200, H100 SXM, A100, L40S)** product lines.

The goal was to answer a set of manager-level business questions using a synthetic dataset of **7,000 transactions** spanning **January 2024 – June 2026**, and to practice the complete analyst workflow: data modeling, DAX measure design, and dashboard storytelling.

---

## 🎯 Business Questions Answered

| # | Question | Dashboard Page |
|---|---|---|
| Q1 | How is overall sales performance trending month over month? | Overview |
| Q2 | Which regions are outperforming or underperforming? | Regional Performance |
| Q3 | Which sales channels drive volume vs. value? | Channel Performance |
| Q4 | Which GPU models are the best sellers vs. lower-volume products? | Product Performance |
| Q5 | Are regions hitting their revenue targets? | Regional Performance |
| Q6 | How does GPU launch year affect revenue contribution? | Product Performance |
| Q7 | Do premium add-ons (support contracts, cooling kits, etc.) affect order value? | Product Performance |

---

## 🛠️ Tech Stack & Workflow

1. **Python (EDA)** — initial data exploration and cleaning of the raw synthetic dataset
2. **SQL (DBeaver / SQLite)** — modeled the data into a **star schema**:
   - `Fact_Sales` (transaction-level fact table)
   - `Dim_GPU`, `Dim_Date`, `Dim_Region`, `Dim_Channel` (dimension tables)
3. **Power BI Desktop** — data modeling, DAX measures, and 4-page interactive report
4. **DAX** — custom measures for revenue, growth, target tracking, and pricing analysis

---

## 📊 Dashboard Pages

### 1. Overview
KPI summary (Total Revenue, Units Sold, AOV, MoM Growth %) with revenue and AOV trend lines across the full 2.5-year period.

![Overview Page](Dashboard%20Screenshots/page1_overview.png)

### 2. Regional Performance
Revenue, AOV, and Units Sold broken down by region, plus a **Target vs. Actual** matrix (target = previous period × 1.10) with conditional-formatted variance.

![Regional Performance Page](Dashboard%20Screenshots/page2_regional.png)

### 3. Channel Performance
Revenue, Units Sold, and AOV by sales channel (Retail/Etail, Cloud Provider, Direct Enterprise, System Integrator/OEM).

![Channel Performance Page](Dashboard%20Screenshots/page3_channel.png)

### 4. Product Performance
- Revenue and Units Sold by GPU model
- Price Premium % vs. MSRP by model
- Revenue by launch year — **Total** vs. **Average per Model** (efficiency view)
- AOV and Revenue by bundle add-on type

![Product Performance Page](Dashboard%20Screenshots/page4_product.png)

> **Note:** Replace the image filenames above with your actual files inside the `Dashboard Screenshots/` folder if they're named differently.

---

## 💡 Key Insight

The data reveals **two distinct business segments operating side by side**:

- **High-Volume Segment** — North America, Retail/Etail channel, consumer RTX GPUs. Drives revenue through transaction volume.
- **High-Value Segment** — Asia-Pacific (ex-China), Direct Enterprise channel, data-center GPUs (B200, H200, H100 SXM). Drives revenue through higher price-per-unit and enterprise add-ons (support contracts, NVLink cluster installs).

This distinction was cross-validated across the Regional, Channel, and Product pages — the same volume-vs-value pattern shows up consistently in all three, which strengthens the finding rather than being a coincidence in one chart.

**Recommendation for the business:** manage these two segments with different strategies — competitive pricing/promotion for the retail/volume segment, and relationship/service-contract focus for the enterprise/value segment.

---

## 🔑 Notable DAX Measures

```dax
Total Revenue = SUM(Fact_Sales[revenue_usd])

Average Order Value (AOV) = 
DIVIDE([Total Revenue], COUNTROWS(Fact_Sales))

Previous Month Revenue = 
CALCULATE([Total Revenue], DATEADD(Dim_Date[sale_date], -1, MONTH))

MoM Growth % = 
DIVIDE([Total Revenue] - [Previous Month Revenue], [Previous Month Revenue])

Target Revenue = [Previous Month Revenue] * 1.10

Revenue Gap % = 
DIVIDE([Total Revenue] - [Target Revenue], [Target Revenue])
```

---

## 📁 Repository Structure

```
nvidia-gpu-sales-analysis/
├── README.md
├── nvidia-gpu-sales-analysis.pbix     ← Power BI dashboard file
├── Dashboard Screenshots/
│   ├── page1_overview.png
│   ├── page2_regional.png
│   ├── page3_channel.png
│   └── page4_product.png
├── EDA(python)/
│   ├── eda.ipynb                      ← Python EDA notebook
│   └── EDA summary.md                 ← EDA findings write-up
└── Star_Scheme (Sql)/
    ├── create_star_schema.sql         ← Star schema DDL
    └── nvidia_gpu_sales.db            ← SQLite database (Fact + Dim tables)
```

---

## 🚀 How to Explore

1. Clone this repo
2. Open `nvidia-gpu-sales-analysis.pbix` in Power BI Desktop
3. Interact with the year slicer and region/channel filters to explore the data
4. To inspect the underlying data model, open `Star_Scheme (Sql)/nvidia_gpu_sales.db` in DBeaver (or any SQLite client) and reference `create_star_schema.sql` for the table definitions
5. See `EDA(python)/eda.ipynb` for the initial data exploration and cleaning steps

