-- Check if the database exists before attempting to create it
SELECT 'CREATE DATABASE snipit_db' WHERE NOT EXISTS (SELECT FROM pg_database WHERE datname = 'snipit_db');

-- Connect to database
\c snipit_db;

-- Check if the user exists before attempting to create it
DO $$ BEGIN
    IF NOT EXISTS (SELECT FROM pg_catalog.pg_user WHERE usename = 'snipit') THEN
        CREATE USER snipit WITH PASSWORD 'Sn1p1t';
    END IF;
END $$;

-- Grant all privileges on database to the user
GRANT ALL PRIVILEGES ON DATABASE snipit_db TO snipit;

-- Set the user snipit as the owner of the database
ALTER DATABASE snipit_db OWNER TO snipit;
