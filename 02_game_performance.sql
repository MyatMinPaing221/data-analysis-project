--- Q1. Which game has the highest error rate? ---

SELECT 
	g.game_name,
	g.platform,

	SUM(m.total_requests) AS total_requests,

	SUM(m.error_requests) AS total_errors,

	ROUND(
	100.0 * SUM(m.error_requests)/ NULLIF(SUM(m.total_requests),0),2
	) AS error_rate_pct,

	ROUND(AVG(m.avg_latency_ms),2) AS avg_latency_ms

FROM monitoring_events m

JOIN games g
	ON m.game_id = g.game_id
GROUP BY 
	g.game_name,
	g.platform
ORDER BY 
	error_rate_pct DESC;