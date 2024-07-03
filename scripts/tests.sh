#!/bin/bash

CONTAINER_NAME="snipit-app"

# Check if the container is running
if [ -n "$(docker ps -f "name=$CONTAINER_NAME" -f "status=running" -q )" ]; then
    docker exec -it "$CONTAINER_NAME" bash -c "bundle exec rails test"
else
    echo "Error: Container '$CONTAINER_NAME' is not running!"
    echo ""
    echo "Please run 'make up' first."
fi
