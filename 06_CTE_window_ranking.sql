WITH endpoint_summary AS (
	SELECT
		m.game_id,
		m.endpoint_id,

		SUM(m.total_requests) AS total_requests,
		SUM(m.error_requests) AS total_errors,

		100.0 * SUM(m.error_requests) / NULLIF(SUM(m.total_requests),0) AS error_rate
	FROM monitoring_events m
	GROUP BY 
		m.game_id,
		m.endpoint_id
),

endpoint_ranking AS (
	SELECT
		game_id,
		endpoint_id,
		total_requests,
		total_errors,
		error_rate,

		DENSE_RANK() OVER(
			PARTITION BY game_id
			ORDER BY error_rate DESC
		) AS endpoint_rank
	FROM endpoint_summary
)

SELECT
	g.game_name,
	e.endpoint_name,

	r.total_requests,
	r.total_errors,

	ROUND(r.error_rate,2) AS error_rate_pct,

	r.endpoint_rank
FROM endpoint_ranking r

JOIN games g
	ON r.game_id = g.game_id

JOIN endpoints e
	ON r.endpoint_id = e.endpoint_id

WHERE r.endpoint_rank = 1

ORDER BY error_rate_pct DESC;