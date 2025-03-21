#!/bin/bash

if !command -v docker &> /dev/null; then
    echo "Docker could not be found. Please install Docker to use this script."
    exit 1
fi 

if [ "$(docker ps -q -f name=my-website-container)" ]; then
    echo "Stopping and removing the existing container 'my-website-container'..."
    docker stop my-website-container
    docker rm my-website-container
else
    echo "No container named 'my-website-container' is running."
fi
