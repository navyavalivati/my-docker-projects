#!/bin/bash

# checking if docker is installed
if ! command -v docker &> /dev/null; then
    echo "Error: Docker is not installed."
    exit 1
fi

# checking if the container is running or exists
if [ "$(docker ps -a -q -f name=simple-web)" ]; then
    echo "Stopping simple-web container..."
    docker stop simple-web-server
    echo "Removing simple-web container..."
    docker rm simple-web-server
    echo "Container stopped and removed."
else
    echo "No container named 'simple-web' found."
fi
