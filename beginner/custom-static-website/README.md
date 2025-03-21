# Custom Static Website

This project is to build and deploy a custom Docker image with a static website served by Nginx. <br>

Creating a custom Docker image using a `Dockerfile` , replacing Nginx's default content with my own static HTML page. <br>

## Project Structure
- `index.html`: The custom static webpage.
- `Dockerfile`: Defines the custom image.
- `start.sh`: Builds and runs the container.
- `stop.sh`: Stops and removes the container.

## Setup
**Start the Website**:
```bash
./start.sh
```

## Commands usage

- *docker build -t my-website .* Builds a custom image from the Dockerfile. Here . points to current directory. If the dockerfile is in different directory, give the path.
- *docker run -d -p 8080:80 --name my-website-container my-website* Runs a container from the my-website image. 
- *-p 8080:80*: Maps host port 8080 to container port 80.
- *--name my-website-container*: Names the container.
- *my-website*: Image to run.

- We can push to Docker Hub using : *docker push username/my-website*