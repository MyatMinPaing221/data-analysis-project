---Q. Which hour has the highest API request volume? ---
---Q. Which hour has the highest error rate? ---
---Q. Which hour has the highest average latency? ---
---Q. Does higher traffic correspond to higher error rates? ---

SELECT
	EXTRACT(HOUR FROM event_timestamp):: int AS hour_of_day,
	SUM(total_requests) AS total_requests,
	SUM(error_requests) AS total_errors,

	ROUND(
		100.0 * SUM(error_requests)/ NULLIF(SUM(total_requests),0),
		2
		) AS error_rate_pct,

		ROUND(AVG(avg_latency_ms),2) AS avg_latency_ms

FROM monitoring_events
GROUP BY EXTRACT(HOUR FROM event_timestamp)

ORDER BY hour_of_day ASC;

--------------------------

SELECT
	EXTRACT(HOUR FROM event_timestamp):: int AS hour_of_day,
	SUM(total_requests) AS total_requests,
	SUM(error_requests) AS total_errors,

	ROUND(
		100.0 * SUM(error_requests)/ NULLIF(SUM(total_requests),0),
		2
		) AS error_rate_pct,

		ROUND(AVG(avg_latency_ms),2) AS avg_latency_ms

FROM monitoring_events
GROUP BY EXTRACT(HOUR FROM event_timestamp)

ORDER BY total_requests DESC

LIMIT 5;
	)