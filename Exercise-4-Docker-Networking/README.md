# Exercise 4: Docker Networking

## Objective
Create a custom Docker bridge network and connect multiple containers (Flask API, MySQL, Redis) to demonstrate inter-container communication.

## Business Context
Models a multi-tier student grade tracker application where a Flask API connects to a MySQL database and Redis cache — all isolated on a private bridge network with custom subnetting.

## Architecture & Components
- **grade-network**: Custom bridge network (`172.20.0.0/16`)
- **grade-flask**: Flask REST API (`grade-tracker:1.0`) — IP: 172.20.0.4
- **grade-mysql**: MySQL 8.0 database — IP: 172.20.0.2
- **grade-redis**: Redis 7 Alpine cache — IP: 172.20.0.3

## Files
- `app.py` — Flask Grade Tracker API (routes: `/`, `/grades`, `/health`)
- `Dockerfile` — Python 3.11-slim based container
- `requirements.txt` — Flask dependencies
- `deploy.sh` / `deploy.ps1` — Full network + container setup scripts
- `output.txt` — Live docker network inspect and API curl output

## How to Run

```bash
# Create isolated network
docker network create --driver bridge --subnet 172.20.0.0/16 grade-network

# Start all containers on the same network
docker run -d --name grade-mysql --net=grade-network \
  -e MYSQL_ROOT_PASSWORD=devops123 -e MYSQL_DATABASE=grades_db mysql:8.0
docker run -d --name grade-redis --net=grade-network redis:7-alpine

docker build -t grade-tracker:1.0 .
docker run -d --name grade-flask --net=grade-network -p 5001:5001 grade-tracker:1.0

# Verify
curl http://localhost:5001/grades
docker network inspect grade-network
```

## Screenshots
- `screenshots/01_docker_networking_containers.png` — All 3 containers running
- `screenshots/02_api_and_network_inspect.png` — API response and container IPs
