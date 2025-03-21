# Docker To-Do App

This project demonstrates **data management in Docker** through a simple To-Do List application. It features a Node.js Express API connected to a MySQL database, orchestrated with Docker Compose. The focus is on using **volumes** for persistent storage and **bind mounts** for live code updates, showcasing how Docker handles data effectively.

## Project Overview

- **Purpose**: Create a REST API to manage tasks (add and list tasks) while illustrating Docker’s data persistence and management capabilities.
- **Tech Stack**:
  - **Node.js with Express**: Backend API for task management.
  - **MySQL**: Database for storing tasks.
  - **Docker**: Containerization platform.
  - **Docker Compose**: Tool for managing multi-container applications.
- **Data Management**:
  - **Volumes**: MySQL data is stored in a named volume (`mysql-data`) to persist across container restarts or deletions.
  - **Bind Mounts**: The Node.js app uses a bind mount to sync local code changes into the container, ideal for development.

## Setup Instructions

1. **Create the Project Directory**:
   - Manually create a folder named `docker-todo-app` or clone it from a repository if available:
    ```bash
        git clone <repository-url>
        cd docker-todo-app
    ```
    - Install node dependencies
    ```bash
        npm install
    ```
    - Start the Application
    ```bash
        docker-compose up --build
    ```
    The --build flag rebuilds the Node.js app image if changes are detected. <br>
    Wait for logs indicating the app is ready, such as:

    ```text
    app-1  | Database is ready!
    app-1  | Database initialized!
    app-1  | App running on http://localhost:3000
    ```
