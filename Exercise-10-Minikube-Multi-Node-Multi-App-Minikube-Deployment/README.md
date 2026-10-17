# Exercise 10: Multi-Node Minikube — Multi-App Deployment

## Objective
Deploy two independent microservices (Product Catalog and Shopping Cart) across a multi-node Minikube cluster, demonstrating pod distribution, inter-service communication, and node affinity.

## Business Context
Production Kubernetes environments run multi-node clusters for high availability and workload distribution. This exercise simulates a real e-commerce backend: the Product Catalog service lists items, and the Shopping Cart service manages session-based carts — both running across multiple nodes.

## Architecture & Components
- **Multi-node Cluster**: 3-node Minikube (1 control-plane + 2 workers)
- **Product Catalog**: 2 replicas (`product-catalog:1.0`) — port 8080 / NodePort 30300
- **Shopping Cart**: 3 replicas (`shopping-cart:1.0`) — port 8081 / NodePort 30301
- **Scheduling**: Pods distributed across worker nodes automatically

## Services
| Service | Replicas | Port | Description |
|---|---|---|---|
| Product Catalog | 2 | 30300 | GET /products, GET /products/:id |
| Shopping Cart | 3 | 30301 | GET/POST /cart/:session, DELETE /cart/:session/clear |

## Files
- `product_catalog.py` — Product Catalog Flask API
- `shopping_cart.py` — Shopping Cart Flask API with session store
- `Dockerfile.product` / `Dockerfile.cart` — Separate Dockerfiles
- `product-catalog-deploy.yaml` — Deployment + Service for catalog
- `shopping-cart-deploy.yaml` — Deployment + Service for cart
- `deploy.sh` / `deploy.ps1` — Full setup and deployment scripts
- `output.txt` — Live pod distribution across nodes

## How to Run

```bash
# Start multi-node cluster
minikube start --nodes 3 -p devops-lab-multi --driver=docker --cni=bridge

# Build and load images
docker build -t product-catalog:1.0 -f Dockerfile.product .
docker build -t shopping-cart:1.0 -f Dockerfile.cart .
minikube -p devops-lab-multi image load product-catalog:1.0
minikube -p devops-lab-multi image load shopping-cart:1.0

# Deploy both apps
kubectl apply -f product-catalog-deploy.yaml
kubectl apply -f shopping-cart-deploy.yaml

# Verify distribution across nodes
kubectl get pods -o wide
```

## Screenshots
- `screenshots/01_multi_node_pods.png` — Pods distributed across multiple nodes
- `screenshots/02_services_api_test.png` — API responses with node distribution proof
