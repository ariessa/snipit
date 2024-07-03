# Build and start Docker containers in detached mode
docker compose --env-file .env.prod --file docker-compose.yml up -d
