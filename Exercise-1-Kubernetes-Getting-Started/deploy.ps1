# Exercise 1: Kubernetes Getting Started
kubectl apply -f pod.yaml
kubectl apply -f service.yaml
kubectl wait --for=condition=Ready pod/zepto-storefront --timeout=120s
kubectl get pods -o wide
kubectl get services
Write-Host "Access via: minikube service zepto-storefront-svc"
