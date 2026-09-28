#!/bin/bash
echo "=== Setting up Jenkins ==="
docker run -d \
  --name jenkins \
  -p 8080:8080 \
  -p 50000:50000 \
  jenkins/jenkins:lts

echo "Waiting for Jenkins to start..."
sleep 20

echo "Initial Admin Password:"
docker exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword

echo ""
echo "Access Jenkins at http://localhost:8080"
