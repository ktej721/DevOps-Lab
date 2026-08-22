#!/bin/bash
set -e
echo "=== Exercise 1: Kubernetes Getting Started ==="
kubectl apply -f pod.yaml
kubectl apply -f service.yaml
echo "Waiting for pod to be ready..."
kubectl wait --for=condition=Ready pod/zepto-storefront --timeout=120s
echo ""
kubectl get pods -o wide
kubectl get services
echo ""
echo "Access via: minikube service zepto-storefront-svc"
