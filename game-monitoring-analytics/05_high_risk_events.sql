SELECT
	m.event_id,
	m.event_timestamp,
	g.game_name,
	e.endpoint_name,
	m.total_requests,
	m.error_requests,
	ROUND(
		100.0 * m.error_requests/NULLIF(m.total_requests,0)
		,2
	) AS error_rate_pct,
	m.avg_latency_ms,
	CASE 
		WHEN 100.0 * m.error_requests / NULLIF(m.total_requests,0) >= 5 THEN 'Critical'
		WHEN 100.0 * m.error_requests / NULLIF(m.total_requests,0) >=3 THEN 'High'
		ELSE 'Normal'
	END AS risk_level
FROM monitoring_events m
INNER JOIN games g
	ON m.game_id = g.game_id
INNER JOIN endpoints e
	ON m.endpoint_id = e.endpoint_id
WHERE
	100.0 * m.error_requests / NULLIF(m.total_requests,0) >= 3
ORDER BY
	error_rate_pct DESC,
	m.avg_latency_ms DESC
LIMIT 50;
