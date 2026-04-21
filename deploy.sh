#!/bin/bash

docker pull username/kittygram_backend:latest
docker pull username/kittygram_frontend:latest
docker pull username/kittygram_gateway:latest

docker-compose down
docker-compose up -d

docker-compose exec backend python manage.py migrate

docker-compose exec backend python manage.py collectstatic --noinput
