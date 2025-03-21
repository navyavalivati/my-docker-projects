#!/bin/bash

# Check if docker is installed

if ! command -v docker &> /dev/null
then
    echo "Docker could not be found. Please install Docker to run this script."
    exit
fi
echo "Docker is installed. Proceeding with the script..."

# pull ngnix image

echo "Pulling nginx image..."

docker pull nginx:latest

#checking if container named "simple-web-server" is already running
if [ "$(docker ps -q -f name=simple-web-server)" ]; then
    echo "Container named 'simple-web-server' is already running. Stopping and removing it..."
    docker stop simple-web-server
    docker rm simple-web-server
else
    echo "No container named 'simple-web-server' is running."
fi

#run the container 

echo "Running the nginx container..."
docker run -d --name simple-web-server -p 8080:80 nginx:latest

# Verify it's running
if [ "$(docker ps -q -f name=simple-web)" ]; then
    echo "Container started successfully!"
    echo "Visit http://localhost:8080 in your browser."
    echo "To stop, run './stop.sh'."
else
    echo "Failed to start the container. Check Docker logs with 'docker logs simple-web'."
fi