#!/bin/bash

if ! command -v docker &> /dev/null; then
    echo "Docker could not be found. Please install Docker to run this script."
    exit 1
fi

#Pulls the ubuntu image from Docker Hub
echo "Pulling ubuntu image..."
docker pull ubuntu:latest

#running an interactive Ubuntu container
echo "Running an interactive Ubuntu container..."

docker run -it --name ubuntu-explore ubuntu bash

# Script ends here because -it keeps the terminal open
#After exiting, the below cleanup instructions are printed.

echo "Exited the container."
echo "To list containers, run 'docker ps -a'."
echo "To clean up, run 'docker rm -f ubuntu-explore'."
echo "To start the container again, run 'docker start -i ubuntu-explore'."
echo "To remove the image, run 'docker rmi ubuntu:latest'."
echo "To remove all stopped containers, run 'docker container prune'."
echo "To remove all unused images, run 'docker image prune'."