# Docker Hub Exploration
A beginner project to explore Docker Hub by running an interactive Ubuntu shell.

## Purpose
This prooject demonstrates pulling an image from Docker Hub and running an interactive container. 

## Setup:
**Start the Container**:
```bash
./start.sh
```

## Notes:
- docker pull ubuntu command pulls the latest ubuntu image from the Docker Hub.
- docker run -it --name ubuntu-explore ubuntu bash
- Details:
-   run: Creates and starts a container.
-   -i: Interactive mode (keeps STDIN open).
-   -t: Allocates a pseudo-TTY (terminal).
-   --name ubuntu-explore: Names the container.
-   ubuntu: Image to use.
-   bash: Runs bash as the command.

- type exit in bash. this will exit from the interactive terminal. Then use docker rm ubuntu-explore command to remove the container.<br>
You can even use -f to forcefully stop container from another terminal.(forcefully stop container without exiting).