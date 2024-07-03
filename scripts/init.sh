#!/bin/bash

# Wait for PostgreSQL to start
sleep 10

# Generate init.sql from template
cat <<EOF > /docker-entrypoint-initdb.d/init.sql
-- Create the database if it doesn't exist
DO \$\$
BEGIN
    IF NOT EXISTS (SELECT FROM pg_database WHERE datname = '${POSTGRES_DB}') THEN
        EXECUTE 'CREATE DATABASE ' || quote_ident('${POSTGRES_DB}');
    END IF;
END \$\$;

-- Connect to the database
\c ${POSTGRES_DB};

-- Create the user if it doesn't exist
DO \$\$
BEGIN
    IF NOT EXISTS (SELECT FROM pg_catalog.pg_user WHERE usename = '${POSTGRES_USER}') THEN
        EXECUTE 'CREATE USER ' || quote_ident('${POSTGRES_USER}') || ' WITH PASSWORD ' || quote_literal('${POSTGRES_PASSWORD}');
    END IF;
END \$\$;

-- Grant all privileges on the database to the user
GRANT ALL PRIVILEGES ON DATABASE ${POSTGRES_DB} TO ${POSTGRES_USER};

-- Set the user ${POSTGRES_USER} as the owner of the database
ALTER DATABASE ${POSTGRES_DB} OWNER TO ${POSTGRES_USER};
EOF

chmod +x /docker-entrypoint-initdb.d/init.sql

# Execute init.sql with psql
psql -U postgres -d postgres -v ON_ERROR_STOP=1 -f /docker-entrypoint-initdb.d/init.sql
