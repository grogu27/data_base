#!/bin/bash
set -e

echo "=== PostgreSQL Initialization ==="
echo "Creating pagila database..."

# Создаем базу данных pagila
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE DATABASE pagila;
    GRANT ALL PRIVILEGES ON DATABASE pagila TO $POSTGRES_USER;
EOSQL

echo "=== Checking data checksums ==="
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" -c "SHOW data_checksums;"

echo "=== Installing Pagila demo database ==="
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "pagila" -f /docker-entrypoint-initdb.d/pagila-schema.sql

echo "=== Initialization complete ==="