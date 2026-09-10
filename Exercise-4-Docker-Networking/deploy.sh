#!/bin/bash
set -e
echo "=== Exercise 4: Docker Networking ==="
docker network create --driver bridge --subnet 172.20.0.0/16 grade-network 2>/dev/null || true
docker build -t grade-tracker:1.0 .
docker stop grade-flask grade-mysql grade-redis 2>/dev/null || true
docker rm grade-flask grade-mysql grade-redis 2>/dev/null || true
docker run -d --name grade-mysql --net=grade-network \
  -e MYSQL_ROOT_PASSWORD=devops123 -e MYSQL_DATABASE=grades_db mysql:8.0
docker run -d --name grade-redis --net=grade-network redis:7-alpine
docker run -d --name grade-flask --net=grade-network -p 5001:5001 grade-tracker:1.0
sleep 5
docker ps --format "table {{.Names}}\t{{.Image}}\t{{.Status}}\t{{.Ports}}" | grep grade
curl -s http://localhost:5001/grades | python3 -m json.tool
docker network inspect grade-network --format '{{range .Containers}}{{.Name}}: {{.IPv4Address}}{{"\n"}}{{end}}'
