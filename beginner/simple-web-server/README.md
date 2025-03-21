# Simple Web Server
A beginner project to run an Nginx web server in a  Docker container, demonstrating basic container management with shell scripts.

## Prerequisties

- **Docker**: Installed and running (verify with `docker --version`).
- **Port 8080**: Should be free on our host machine.

## Project Structure
- `start.sh`: Starts the Nginx container.
- `stop.sh`: Stops and removes the container.

## Setup
**Start the web-server**:
```bash
./start.sh
```
- Pulls the Nginx image, ensures no conflicts, and starts the container.
- Visit http://localhost:8080 to see the Nginx welcome page. <br>

**Stop the Web Server**:
```bash
./stop.sh
```
