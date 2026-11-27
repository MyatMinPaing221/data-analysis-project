--- Q2. Which API endpoint has the highest error rate?---
--- Q3. Which endpoint has the highest average latency? ---
--- Q4. Which endpoint should be prioritized for investigation? ---

SELECT
	e.endpoint_name,
	e.endpoint_category,

	SUM(m.total_requests) AS total_requests,
	SUM(m.error_requests) AS total_errors,

	ROUND ( 100.0 * SUM(m.error_requests) / NULLIF(SUM(m.total_requests),0),2
	) AS error_rate_pct,

	ROUND (AVG (m.avg_latency_ms),
	2) AS avg_latency_ms

FROM monitoring_events m

INNER JOIN endpoints e
	ON m.endpoint_id = e.endpoint_id

GROUP BY
	e.endpoint_name,
	e.endpoint_category

ORDER BY error_rate_pct DESC;
