#!/bin/bash
set -e

echo "=== PostgreSQL Initialization ==="
echo "Creating pagila database..."

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE DATABASE pagila;
    GRANT ALL PRIVILEGES ON DATABASE pagila TO $POSTGRES_USER;
EOSQL

echo "=== Checking data checksums ==="
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" -c "SHOW data_checksums;"

echo "=== Initialization complete ==="
EOF

chmod +x init/01-init.sh