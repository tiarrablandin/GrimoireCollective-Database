-- Initialization script for Grimoire Collective database
-- This script runs when the database is first created

-- Create extensions if needed
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
CREATE EXTENSION IF NOT EXISTS "pg_trgm";

-- Set timezone
SET timezone = 'UTC';

-- Create a simple health check table
CREATE TABLE IF NOT EXISTS db_health_check (
    id SERIAL PRIMARY KEY,
    last_check TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO db_health_check (last_check) VALUES (CURRENT_TIMESTAMP);
