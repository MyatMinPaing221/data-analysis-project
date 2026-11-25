
-- =========================================
-- GAME MONITORING ANALYTICS
-- DATA INSERTION & VALIDATION
-- =========================================

-- 1. Check Existing Tables

SELECT
    table_name
FROM information_schema.tables
WHERE table_schema = 'public'
    AND table_type = 'BASE TABLE'
ORDER BY table_name;


-- 2. Insert Games

INSERT INTO games (game_id, game_name, platform)
VALUES
    (101, 'Sky Legends', 'Mobile'),
    (102, 'Ocean Quest', 'Web'),
    (103, 'Cyber Arena', 'PC'),
    (104, 'Dragon Valley', 'Mobile'),
    (105, 'Space Frontier', 'Web');


-- 3. Insert API Endpoints

INSERT INTO endpoints
    (endpoint_id, endpoint_name, endpoint_category)
VALUES
    (1, '/launch/init', 'Launch'),
    (2, '/auth/token', 'Authentication'),
    (3, '/webhook/payment', 'Webhook'),
    (4, '/player/profile', 'Player'),
    (5, '/match/start', 'Gameplay');


-- 4. Generate 1,200 Synthetic Monitoring Events

INSERT INTO monitoring_events (
    event_id,
    event_timestamp,
    game_id,
    endpoint_id,
    total_requests,
    error_requests,
    avg_latency_ms,
    event_status
)
SELECT
    n,
    TIMESTAMP '2026-10-01 00:00:00'
        + random() * INTERVAL '30 days',
    101 + floor(random() * 5)::int,
    1 + floor(random() * 5)::int,
    requests,
    errors,
    100 + floor(random() * 600)::int,

    CASE
        WHEN errors * 100.0
             / NULLIF(requests, 0) >= 5
            THEN 'Critical'
        WHEN errors * 100.0
             / NULLIF(requests, 0) >= 2
            THEN 'Degraded'
        ELSE 'Success'
    END

FROM (
    SELECT
        n,
        100 + floor(random() * 400)::int AS requests,
        floor(random() * 15)::int AS errors
    FROM generate_series(1, 1200) AS n
) AS sample_data;


-- 5. Data Quality Check

SELECT
    COUNT(*) AS total_records,
    SUM(total_requests) AS total_requests,
    SUM(error_requests) AS total_errors
FROM monitoring_events;
