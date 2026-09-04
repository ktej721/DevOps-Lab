#!/bin/bash
set -e
echo "=== Exercise 3: Scaling FlashSale App ==="
docker build -t flashsale:1.0 .
minikube image load flashsale:1.0
kubectl apply -f replicaset-deployment.yaml
kubectl rollout status deployment/flashsale-deployment
kubectl get pods -o wide
echo ""
echo "Scaling to 5 replicas..."
kubectl scale deployment flashsale-deployment --replicas=5
kubectl get pods -o wide
