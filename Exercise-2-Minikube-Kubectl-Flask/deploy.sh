#!/bin/bash
set -e
echo "=== Exercise 2: Flask on Minikube ==="
eval $(minikube docker-env)
docker build -t flask-k8s:1.0 .
kubectl apply -f flask-deployment.yaml
kubectl wait --for=condition=Available deployment/flask-k8s-app --timeout=120s
kubectl get deployments
kubectl get pods -o wide
kubectl get services
echo ""
echo "Port-forward: kubectl port-forward svc/flask-k8s-svc 15001:15000"
