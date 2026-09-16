# Exercise 5: Docker Security (AppArmor / Security Options)

## Objective
Harden a Docker container using security options: dropping all Linux capabilities, running as a non-root user, and preventing privilege escalation.

## Business Context
Production containers must follow the principle of least privilege. This exercise demonstrates how to restrict a Flask container's permissions so it cannot escalate privileges or access sensitive files like `/etc/shadow`.

## Architecture & Components
- **Image**: `secure-flask:1.0` — Flask app running as `appuser` (UID 1001)
- **Security Options**: `--security-opt no-new-privileges:true`
- **Capabilities**: `--cap-drop ALL` (with selective `--cap-add NET_BIND_SERVICE`)
- **Verification**: Automated via `test_security.py`

## Files
- `app.py` — Flask app exposing `/` and `/secure-info` endpoints
- `Dockerfile` — Non-root user, minimal base image
- `requirements.txt` — Flask dependency
- `run_secure.sh` — Shell script to run container with security options
- `test_security.py` — Python script verifying security restrictions
- `deploy.sh` / `deploy.ps1` — Deployment scripts
- `output.txt` — Test results showing `appuser` and permission denied

## How to Run

```bash
docker build -t secure-flask:1.0 .

# Run with full security restrictions
docker run -d --name secure-flask-app \
  --security-opt no-new-privileges:true \
  --cap-drop ALL \
  --cap-add NET_BIND_SERVICE \
  -p 5002:5000 secure-flask:1.0

# Verify restrictions
docker exec secure-flask-app whoami         # → appuser
docker exec secure-flask-app cat /etc/shadow  # → Permission denied

# Or run automated test
python3 test_security.py
```

## Screenshots
- `screenshots/01_docker_security_test.png` — Security test output with CapDrop, SecurityOpt
- `screenshots/02_security_restrictions.png` — whoami=appuser, /etc/shadow denied
