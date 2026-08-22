# Exercise 1: Kubernetes Getting Started

## Objective
Deploy a containerized web application inside Kubernetes and access it via a NodePort service.

## Business Context
Simulating the deployment of a Zepto storefront (using Nginx) on Kubernetes to demonstrate basic pod lifecycle management, service exposure, and container orchestration concepts.

## Architecture & Components
- **Pod**: `zepto-storefront` running official `nginx:latest` image on port 80
- **Service**: `zepto-storefront-svc` exposing the Pod via NodePort 30080
- **Cluster**: Minikube single-node cluster with bridge CNI

## Files
- `pod.yaml` — Kubernetes Pod definition for zepto-storefront
- `service.yaml` — NodePort Service exposing the pod on port 30080
- `deploy.sh` — Linux/macOS deployment script
- `deploy.ps1` — Windows PowerShell deployment script
- `output.txt` — Actual command outputs from execution

## How to Run

### Prerequisites
- Minikube installed and running (`minikube start --driver=docker`)
- kubectl configured

### Option 1: Using Manifests
```bash
kubectl apply -f pod.yaml
kubectl apply -f service.yaml
kubectl get pods -o wide
kubectl get services
```

### Option 2: Using the Deployment Script
```bash
chmod +x deploy.sh
./deploy.sh
```

### Verify
```bash
kubectl describe pod zepto-storefront
minikube service zepto-storefront-svc
```

## Screenshots
- `screenshots/01_minikube_pod_running.png` — Pod Running status with IP
