#!/bin/bash

# checking if the container is running or not
CONTAINER_ID=$(docker ps -q -f name=my-apache2-container)

if [ -n "$CONTAINER_ID" ]; then
    echo "Stopping the Apache2 container..."
    docker stop my-apache2-container

    # checking if the stop command was successful

    if [ $? -eq 0 ]; then
        echo "Container stopped successfully."
    else
        echo "Failed to stop the container."
        exit 1
    fi

    echo "Removing the container..."
    docker rm my-apache2-container

    # checking if container removed successfully or not
    if [ $? -eq 0 ]; then
        echo "Container removed successfully."
    else
        echo "Failed to remove the container."
        exit 1
    fi
else
    echo "No running container named 'my-apache2-container' found."
fi