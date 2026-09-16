#!/bin/bash
set -e
echo "=== Exercise 5: Docker Security ==="
docker build -t secure-flask:1.0 .
docker stop secure-flask-app 2>/dev/null; docker rm secure-flask-app 2>/dev/null; true
docker run -d --name secure-flask-app \
  --security-opt no-new-privileges:true \
  --cap-drop ALL \
  --cap-add NET_BIND_SERVICE \
  -p 5002:5000 secure-flask:1.0
sleep 2
docker inspect secure-flask-app --format 'SecurityOpt={{.HostConfig.SecurityOpt}} CapDrop={{.HostConfig.CapDrop}}'
echo "whoami: $(docker exec secure-flask-app whoami)"
docker exec secure-flask-app cat /etc/shadow 2>&1 || echo "Permission denied (expected)"
