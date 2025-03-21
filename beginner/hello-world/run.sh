#!/bin/bash
echo "-------Running hello-world container--------"
docker run hello-world
echo "--------Listing all containers:----------"
docker ps -a
echo "Note: Use 'docker logs <container-id>' to see output, and 'docker rm <container-id>' to clean up."