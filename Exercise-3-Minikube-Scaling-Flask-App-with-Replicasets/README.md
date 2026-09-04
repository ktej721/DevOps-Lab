# Exercise 3: Scaling Flask App with ReplicaSets

## Objective
Deploy a Flask application with multiple replicas using Kubernetes Deployments and demonstrate horizontal scaling.

## Business Context
Simulating a flash-sale e-commerce platform (DevOps Flash Sale 2025!) that must handle high traffic. ReplicaSets ensure multiple pod instances serve requests, and scaling demonstrates Kubernetes self-healing and load distribution.

## Architecture & Components
- **App**: FlashSale Flask API with `/`, `/products`, `/order`, `/health` endpoints
- **Deployment**: `flashsale-deployment` starting at 3 replicas, scaled to 5
- **Service**: `flashsale-svc` NodePort 30200
- **Runtime**: Gunicorn WSGI server with 2 workers, 4 threads each

## Files
- `app.py` — FlashSale Flask application
- `Dockerfile` — Gunicorn-based container image
- `requirements.txt` — Flask + Gunicorn dependencies
- `replicaset-deployment.yaml` — Deployment (3 replicas) + Service
- `deploy.sh` / `deploy.ps1` — Deployment scripts
- `output.txt` — Live scale output showing all 5 pod IPs

## How to Run

```bash
# Build and load image
docker build -t flashsale:1.0 .
minikube image load flashsale:1.0

# Deploy 3 replicas
kubectl apply -f replicaset-deployment.yaml
kubectl get pods -o wide

# Scale to 5 replicas
kubectl scale deployment flashsale-deployment --replicas=5
kubectl get pods -o wide

# Test load distribution
kubectl port-forward svc/flashsale-svc 5099:5000
curl http://localhost:5099/products
```

## Screenshots
- `screenshots/01_replicaset_scale_output.png` — 3 replicas running
- `screenshots/02_scale_5_replicas.png` — Scaled to 5, all with unique IPs
