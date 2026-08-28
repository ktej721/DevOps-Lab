# Exercise 2: Minikube + Flask Deployment

## Objective
Build a custom Flask application Docker image and deploy it to Minikube using Kubernetes Deployment and Service manifests.

## Business Context
Demonstrates how to containerize a Python web service and deploy it on a local Kubernetes cluster — a fundamental DevOps workflow for microservice deployment.

## Architecture & Components
- **App**: Flask REST API returning JSON with pod name, version, and timestamp
- **Deployment**: `flask-k8s-app` with 1 replica and readiness probe
- **Service**: `flask-k8s-svc` NodePort on 30100 → container port 15000

## Files
- `app.py` — Flask application source
- `Dockerfile` — Container image definition (python:3.11-slim base)
- `requirements.txt` — Python dependencies
- `flask-deployment.yaml` — Kubernetes Deployment + Service manifest
- `deploy.sh` / `deploy.ps1` — Deployment scripts
- `output.txt` — Live execution output

## How to Run

```bash
# Build image inside minikube's Docker
eval $(minikube docker-env)
docker build -t flask-k8s:1.0 .

# Deploy to Kubernetes
kubectl apply -f flask-deployment.yaml
kubectl get deployments
kubectl get pods -o wide

# Test
kubectl port-forward svc/flask-k8s-svc 15001:15000
curl http://localhost:15001/
```

## Screenshots
- `screenshots/01_flask_deployment_and_pods.png` — Deployment and pods running
- `screenshots/02_flask_service_curl.png` — Live API response with pod name
