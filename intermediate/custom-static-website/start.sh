#!/bin/bash

#checking if docker is installed
if ! command -v docker &> /dev/null
then
    echo "Docker could not be found. Please install Docker to use this script."
    exit 1
fi

# building custom image
echo "Building the custom image 'my-website'..."
docker build -t my-website .

# check if a container named 'my-website-container' is already running
if [ "$(docker ps -q -f name=my-website-container)" ]; then
    echo "Stopping and removing the existing container 'my-website-container'..."
    docker stop my-website-container
    docker rm my-website-container

fi

#run the container
echo "Running the container 'my-website-container'..."
docker run -d -p 8080:80 --name my-website-container my-website 

#verify if the container is running

if [ "$(docker ps -q -f name=my-website-container)" ]; then
    echo "Container started successfully!"
    echo "Visit http://localhost:8080 to see your static website."
else
    echo "Failed to start the container.Check the logs for more details. with 'docker logs my-website-container'"

fi