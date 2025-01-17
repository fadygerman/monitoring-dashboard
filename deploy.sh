#!/bin/bash

# Build and run the containers
docker-compose up --build -d

# Print the URL of the app
echo "Frontend is running at: http://localhost:3000"
echo "Backend is running at: http://localhost:8000"
