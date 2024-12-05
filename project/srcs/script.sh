#!/bin/bash

# echo "lol"
echo "Stopping and removing containers..."
docker-compose down --volumes

echo "Removing Docker volumes..."
docker volume rm $(docker volume ls -q) 2>/dev/null || echo "No volumes to remove"

echo "Removing Docker images..."
docker rmi $(docker images -aq) 2>/dev/null || echo "No images to remove"

echo "Removing stopped containers..."
docker rm $(docker ps -aq) 2>/dev/null || echo "No containers to remove"

echo "Cleaning up MariaDB data directory..."
if [ -d "requirements/mariadb/conf/data/" ]; then
  sudo rm -rf requirements/mariadb/conf/data/*
  echo "Data directory cleaned"
else
  echo "Directory /requirements/mariadb/conf/data/ does not exist"
fi