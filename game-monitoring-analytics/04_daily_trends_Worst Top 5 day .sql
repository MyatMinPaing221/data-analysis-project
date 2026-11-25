--- Q5. How many API requests are received each day?---
--- Q6. What is the daily error rate? ---
--- Q7. Which day has the highest error rate?---
--- Q8. Are there any unusual daily performance pattern?---

SELECT
	DATE(event_timestamp)	AS monitoring_date,
	COUNT(*) AS monitoring_records,
	SUM(total_requests) AS total_requests,
	SUM(error_requests) AS total_errors,

	ROUND(
	100.0 * SUM(error_requests) / NULLIF(SUM(total_requests),0)
	,2
	) AS error_rate_pct,

	ROUND(
		AVG(avg_latency_ms),
		2
	) AS avg_latency_ms
	
FROM monitoring_events

GROUP BY 
	DATE(event_timestamp)
ORDER BY 
	monitoring_date ASC;

SELECT
	DATE(event_timestamp)	AS monitoring_date,
	COUNT(*) AS monitoring_records,
	SUM(total_requests) AS total_requests,
	SUM(error_requests) AS total_errors,

	ROUND(
	100.0 * SUM(error_requests) / NULLIF(SUM(total_requests),0)
	,2
	) AS error_rate_pct,

	ROUND(
		AVG(avg_latency_ms),
		2
	) AS avg_latency_ms
	
FROM monitoring_events

GROUP BY 
	DATE(event_timestamp)
ORDER BY 
	error_rate_pct DESC
	
LIMIT 5;
