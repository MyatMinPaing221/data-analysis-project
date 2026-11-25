# Game Launch & API Monitoring Analytics Using SQL

## 1. Project Overview

This project analyzes synthetic game launch and API monitoring data using PostgreSQL.

The objective is to evaluate API reliability, identify error patterns, monitor response latency, and discover potential performance issues across multiple games and API endpoints.

## 2. Business Objectives

- Monitor total API requests and errors.
- Calculate overall API error rates.
- Compare monitoring performance across games.
- Identify high-error API endpoints.
- Analyze daily and hourly monitoring trends.
- Identify high-risk monitoring events.
- Provide data-driven operational recommendations.

## 3. Tools & Technologies

- PostgreSQL
- pgAdmin 4
- SQL
- GitHub

## 4. Dataset Description

The project uses synthetic monitoring data generated for educational and portfolio purposes.

### Database Tables

| Table | Description |
|---|---|
| games | Game information and platforms |
| endpoints | API endpoint information |
| monitoring_events | API monitoring records, requests, errors, and latency |

### Dataset Details

- 5 Games
- 5 API Endpoints
- 1,200 Monitoring Events
- Monitoring period: October 1–30, 2026

## 5. SQL Analysis

### 5.1 Overall Monitoring KPIs

Calculated:
- Total monitoring records
- Total API requests
- Total API errors
- Overall error rate
- Average latency

### 5.2 Game Performance Analysis

Compared API performance across games using:
- Total requests
- Total errors
- Error rate
- Average latency

### 5.3 API Endpoint Performance Analysis

Evaluated endpoint reliability and response performance.

### 5.4 Daily Monitoring Trends

Analyzed daily request volume, error rates, and average latency. Identified the five days with the highest error rates.

### 5.5 High-Risk Monitoring Events

Classified monitoring events based on error rate:
- Critical: Error rate >= 5%
- High: Error rate >= 3%

### 5.6 Advanced SQL Analysis

Applied:
- Common Table Expressions (CTEs)
- Window Functions
- DENSE_RANK()
- PARTITION BY

Identified the highest-error endpoint for each game.

### 5.7 Hourly Monitoring Analysis

Analyzed monitoring activity by hour to identify peak request periods and hourly error patterns.

## 6. Key Findings

### Game Performance
- Space Frontier recorded the highest error rate at 2.51%.
- Cyber Arena recorded the highest average latency at 411.13 ms.
- Dragon Valley recorded the lowest error rate at 2.20% and the lowest average latency at 378.06 ms.

### Other Findings
Additional findings from endpoint, daily, high-risk, advanced SQL, and hourly analyses will be documented after reviewing their results.

## 7. Business Recommendations

1. Investigate games and API endpoints with comparatively high error rates.
2. Monitor API response latency to identify potential performance bottlenecks.
3. Establish alerts for abnormal increases in error rates.
4. Prioritize investigation of high-risk monitoring events.
5. Analyze peak traffic periods to support infrastructure capacity planning.

## 8. Conclusion

This project demonstrates the use of PostgreSQL to analyze game launch and API monitoring data.

It showcases practical SQL skills, including data aggregation, joins, conditional logic, trend analysis, CTEs, and window functions.

The analysis provides insights that can support API reliability monitoring and operational decision-making.

## 9. Disclaimer

This project uses synthetic data generated for educational and portfolio purposes. It does not contain confidential company, client, or production monitoring information.