# Exercise 7: Jenkins CI Automation

## Objective
Set up a Jenkins CI server using Docker and configure it for automated pipeline execution.

## Business Context
Jenkins is the backbone of CI/CD pipelines. This exercise provisions a production-grade Jenkins LTS instance using Docker, with persistent storage, and demonstrates how to bootstrap an automation server for DevOps workflows.

## Architecture & Components
- **Jenkins Image**: `jenkins/jenkins:lts-jdk17` (Long Term Support)
- **Ports**: `8080` (Web UI), `50000` (Agent JNLP)
- **Storage**: Named Docker volume `jenkins_devops_home` for persistence
- **Admin**: Auto-generated initial password via `initialAdminPassword`

## Files
- `setup_jenkins.sh` — Automated Jenkins Docker startup script
- `docker-compose.yml` — Docker Compose alternative for orchestrated startup
- `deploy.sh` / `deploy.ps1` — Deployment scripts
- `output.txt` — Container logs and initial admin password output

## How to Run

```bash
# Option 1: Direct Docker
docker run -d \
  --name jenkins-devops \
  -p 8080:8080 \
  -p 50000:50000 \
  -v jenkins_devops_home:/var/jenkins_home \
  jenkins/jenkins:lts-jdk17

# Wait for startup
sleep 20
docker exec jenkins-devops cat /var/jenkins_home/secrets/initialAdminPassword

# Option 2: Setup script
chmod +x setup_jenkins.sh && ./setup_jenkins.sh

# Option 3: Docker Compose
docker-compose up -d
```

Access Jenkins at: **http://localhost:8080**

## Screenshots
- `screenshots/01_jenkins_setup.png` — Jenkins container running with initial admin password
