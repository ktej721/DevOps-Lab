# Exercise 8: Jenkins Hello World Job

## Objective
Create and execute a Jenkins Freestyle / Pipeline job that runs a shell script, demonstrating end-to-end job creation and console output verification.

## Business Context
The "Hello World" pipeline is the entry point to understanding Jenkins job structure, build triggers, and console output. It verifies Jenkins is properly configured and agents can execute shell commands.

## Architecture & Components
- **Job Type**: Freestyle Job (Shell Build Step) + Pipeline (Declarative)
- **Script**: `hello-devops.sh` — Prints build metadata (date, hostname, workspace, build number)
- **Jenkins**: Running in Docker container

## Files
- `hello-devops.sh` — Hello World shell script with build metadata
- `Jenkinsfile` — Declarative pipeline version of the job
- `deploy.sh` / `deploy.ps1` — Scripts to run hello-devops.sh locally
- `output.txt` — Console output showing successful build

## How to Run

### Locally
```bash
chmod +x hello-devops.sh
./hello-devops.sh
```

### Via Jenkins Pipeline
1. Create new Pipeline job in Jenkins
2. Point to this repository
3. Set Script Path: `Exercise-8-Jenkins-Hello-World-Job/Jenkinsfile`
4. Build Now
5. Check Console Output

## Expected Output
```
===========================================
  Hello from Jenkins! - DevOps Lab Ex8
===========================================
Build Date : 2026-10-25 19:33:05
Hostname   : Kirans-MacBook-Air.local
===========================================
DevOps pipeline is working correctly!
```

## Screenshots
- `screenshots/01_jenkins_hello_world.png` — Script output and Jenkins console SUCCESS
