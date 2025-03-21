#!/bin/bash

# command to build docker image
echo "Building the Docker image..."
docker build -t my-apache2-image .

# checking is build is successful or not
if [ $? -eq 0 ]; then
    echo "Image built successfully."
else
    echo "Failed to build the image. Exiting."
    exit 1
fi

# command to run the docker container
echo "Starting the Apache2 container..."
docker run -d -p 8080:80 --name my-apache2-container my-apache2-image

# checking if the container started successfully
if [ $? -eq 0 ]; then
    echo "Container started successfully. Access it at http://localhost:8080"
else
    echo "Failed to start the container."
    exit 1
fi