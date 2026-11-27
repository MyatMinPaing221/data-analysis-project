# Game Launch & API Monitoring Analytics Using SQL & Power BI

## 1. Project Overview

This project analyzes synthetic game launch and API monitoring data using PostgreSQL and Microsoft Power BI.

The objective is to evaluate API reliability, identify error patterns, monitor response latency, and discover potential performance issues across multiple games and API endpoints.

The project demonstrates an end-to-end data analytics workflow, from SQL-based data analysis to interactive dashboard development and validation.

## 2. Business Objectives

- Monitor total API requests and error requests.
- Calculate overall API error rates.
- Compare monitoring performance across different games.
- Evaluate API endpoint reliability and response latency.
- Identify daily performance trends and potential anomalies.
- Highlight high-risk monitoring events.
- Present key performance indicators through an interactive Power BI dashboard.

## 3. Tools & Technologies

| Tool | Purpose |
|---|---|
| PostgreSQL | Database management |
| pgAdmin 4 | SQL development and database queries |
| SQL | Data analysis and KPI calculations |
| Microsoft Power BI | Interactive dashboard development |
| DAX | Measures and calculated columns |
| GitHub | Project documentation and version control |

## 4. Dataset Description

The project uses a synthetic monitoring dataset generated using PostgreSQL.

### Database

`Game_Monitoring_analytics`

### Tables

| Table | Description |
|---|---|
| games | Game information |
| endpoints | API endpoint information |
| monitoring_events | API monitoring records |

### Dataset Overview

- Total Games: 5
- Total API Endpoints: 5
- Total Monitoring Events: 1,200
- Date Range: October 1–30, 2026

### Key Data Fields

- `game_id`
- `endpoint_id`
- `event_timestamp`
- `total_requests`
- `error_requests`
- `avg_latency_ms`

## 5. SQL Analysis

PostgreSQL was used to perform the following analyses.

### 5.1 Overall Performance KPIs

- Total API Requests
- Total Error Requests
- Overall Error Rate
- Average Response Latency
- Total Monitoring Events

### 5.2 Game Performance Analysis

- Compare total requests and errors by game.
- Calculate error rates for each game.
- Evaluate average response latency.
- Rank games based on error rates.

### 5.3 Endpoint Performance Analysis

- Compare API requests and errors by endpoint.
- Calculate endpoint error rates.
- Identify endpoints with higher response latency.
- Rank endpoints based on error rates.

### 5.4 Daily Performance Trends

- Analyze daily API requests and errors.
- Monitor daily error rate changes.
- Identify dates with relatively high error rates.

### 5.5 High-Risk Event Analysis

Classify monitoring events based on error rates:

- Critical: Error Rate >= 5%
- High: Error Rate >= 3%
- Normal: Error Rate < 3%

These thresholds are project-specific analytical classifications, not industry standards.

### 5.6 Advanced SQL Analysis

Applied advanced SQL techniques, including:

- Common Table Expressions (CTEs)
- Window Functions
- `RANK()` and `DENSE_RANK()`
- `PARTITION BY`
- Aggregations and joins
- Ranking the highest-error endpoint within each game

### 5.7 Hourly Performance Analysis

- Analyze monitoring activity by hour.
- Compare hourly request volumes and error rates.
- Identify potential periods of increased API activity or errors.

## 6. Power BI Dashboard

An interactive Power BI dashboard was developed to visualize API monitoring performance and support business analysis.

### 6.1 Executive Overview

Provides a high-level summary of overall API monitoring performance.

**Key KPIs:**
- Total Requests
- Total Errors
- Error Rate
- Average Latency
- Total Events

**Visualizations:**
- Error Rate by Game
- Average Latency by Game
- Daily Error Rate Trend
- Total Requests by Game

![Executive Overview](screenshots/GAME%20LAUNCH%20%26%20API%20MONITORING.png)

### 6.2 Game Performance Analysis

Evaluates API monitoring performance across individual games.

**Key Features:**
- Total Errors by Game
- Error Rate by Game
- Average Latency by Game
- Total Requests by Game
- Game Performance Details
- Game Error Ranking
- Game Performance Status

![Game Performance Analysis](screenshots/GAME%20PERFORMANCE%20ANALYSIS.png)

### 6.3 Endpoint Performance Analysis

Evaluates reliability and response performance across API endpoints.

**Key Features:**
- Total Errors by Endpoint
- Error Rate by Endpoint
- Average Latency by Endpoint
- Total Requests by Endpoint
- Endpoint Performance Details
- Endpoint Error Ranking
- Endpoint Performance Status

![Endpoint Performance Analysis](screenshots/ENDPOINT%20PERFORMANCE%20ANALYSIS.png)

### Interactive Features

The dashboard includes:
- Date slicer
- Game slicer
- Endpoint slicer
- Synchronized filters across report pages
- Dynamic KPI calculations
- Conditional formatting for performance status

### Power BI File

[Download Power BI Dashboard (.pbix)](PowerBI%20Analytics/game-monitoring-analytics.pbix)

## 7. Key Findings

Based on the synthetic dataset:

### Game Performance

- **Space Frontier** recorded the highest error rate at 2.51%.
- **Dragon Valley** recorded the lowest error rate at 2.20%.
- Dragon Valley also had the lowest average latency at 378.06 ms.
- **Cyber Arena** recorded the highest average latency at 411.13 ms.

These findings demonstrate how game-level performance comparisons can help identify areas requiring further investigation.

## 8. SQL and Power BI Validation

The Power BI dashboard results were cross-checked against PostgreSQL SQL queries.

| Analysis Area | Validation Status |
|---|---|
| Overall Performance KPIs | PASS |
| Game Performance | PASS |
| Endpoint Performance | PASS |

The results matched across SQL and Power BI for the full dataset with slicers cleared.

## 9. Business Recommendations

Based on the analytical results, the following recommendations can be considered:

1. **Monitor High-Error Games:** Investigate games with relatively higher error rates to identify potential reliability issues.
2. **Review API Endpoints:** Prioritize endpoints with higher error rates or response latency.
3. **Track Daily Trends:** Monitor daily error rate changes to identify unusual performance patterns.
4. **Improve Monitoring Visibility:** Use interactive dashboards to support ongoing performance monitoring.
5. **Investigate High-Risk Events:** Review critical and high-risk events to identify possible causes of API failures.

## 10. Conclusion

This project demonstrates an end-to-end data analytics workflow using PostgreSQL, SQL, and Power BI.

Through SQL analysis and interactive dashboard development, the project provides insights into API reliability, game performance, endpoint performance, and monitoring trends.

It also demonstrates practical skills in data analysis, KPI development, data modeling, DAX, dashboard design, and analytical reporting.

## 11. Disclaimer

This project uses synthetic data generated for educational and portfolio purposes.

All findings and recommendations are based on the generated dataset and do not represent actual production monitoring results.
