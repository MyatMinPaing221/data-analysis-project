--- OVERALL MONITORING KPIs ---

---Business questions ---

--- 1. TOTAL REQUESTS ?, TOTAL ERRORS ? , ERROR RATE ? , AVERAGE LATENCY ? , MONITORING RECORDS ?---

SELECT
	COUNT (*) AS monitoring_records,
	
	SUM(total_requests) AS total_requests,
	
	SUM(error_requests) AS total_errors,
	
	ROUND(
	100.0 * SUM(error_requests)/ NULLIF(SUM(total_requests),0),2
	) AS error_rate_pct,

	ROUND(AVG(avg_latency_ms),2) AS avg_latency_ms
FROM monitoring_events;