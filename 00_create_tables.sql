
-- Table 1: Games
CREATE TABLE games (
    game_id INT PRIMARY KEY,
    game_name VARCHAR(100) NOT NULL,
    platform VARCHAR(30) NOT NULL
);

-- Table 2: API Endpoints
CREATE TABLE endpoints (
    endpoint_id INT PRIMARY KEY,
    endpoint_name VARCHAR(150) NOT NULL,
    endpoint_category VARCHAR(50) NOT NULL
);

-- Table 3: Monitoring Events
CREATE TABLE monitoring_events (
    event_id INT PRIMARY KEY,
    event_timestamp TIMESTAMP NOT NULL,

    game_id INT REFERENCES games(game_id),
    endpoint_id INT REFERENCES endpoints(endpoint_id),

    total_requests INT NOT NULL,
    error_requests INT NOT NULL,
    avg_latency_ms INT NOT NULL,

    event_status VARCHAR(20) NOT NULL,

    CHECK (total_requests >= 0),
    CHECK (error_requests >= 0),
    CHECK (error_requests <= total_requests),
    CHECK (avg_latency_ms >= 0)
);
