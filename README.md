# DevOps Lab — Kiran Tej (ktej721)

> Practical lab exercises covering Kubernetes, Docker, Jenkins and Grafana.

## Exercises

| # | Exercise | Topics | Date |
|---|---|---|---|
| 1 | [Kubernetes Getting Started](./Exercise-1-Kubernetes-Getting-Started/) | Pod, Service, Minikube, NodePort | Aug 22, 2026 |
| 2 | [Minikube + Flask Deployment](./Exercise-2-Minikube-Kubectl-Flask/) | Deployment, Flask, Readiness Probe | Aug 28, 2026 |
| 3 | [Scaling with ReplicaSets](./Exercise-3-Minikube-Scaling-Flask-App-with-Replicasets/) | ReplicaSet, HPA, Gunicorn | Sep 04, 2026 |
| 4 | [Docker Networking](./Exercise-4-Docker-Networking/) | Bridge Network, MySQL, Redis | Sep 10, 2026 |
| 5 | [Docker Security (AppArmor)](./Exercise-5-Docker-Security-AppArmor/) | AppArmor Profile, Docker SDK | Sep 16, 2026 |
| 6 | [Grafana Monitoring](./Exercise-6-Grafana-Realtime-Monitoring-of-Quick-Commerce-App/) | Prometheus, Grafana, Alert Rules | Sep 22, 2026 |
| 7 | [Jenkins CI Automation](./Exercise-7-Jenkins-CI-Automation/) | Jenkins LTS, Docker Compose | Sep 28, 2026 |
| 8 | [Jenkins Hello World Job](./Exercise-8-Jenkins-Hello-World-Job/) | Freestyle Job, Shell Script | Oct 04, 2026 |
| 9 | [Jenkins Multi-Stage Pipeline](./Exercise-9-Jenkins-Multi-Stage-Pipeline/) | Declarative Pipeline, unittest | Oct 10, 2026 |
| 10 | [Multi-Node Minikube Deployment](./Exercise-10-Minikube-Multi-Node-Multi-App-Minikube-Deployment/) | Multi-Node, Product Catalog, Cart | Oct 17, 2026 |

## Structure
Each exercise folder contains:
- `README.md` — Objective, architecture, how to run
- Source code (`app.py`, `Dockerfile`, YAML manifests, etc.)
- `deploy.sh` / `deploy.ps1` — Deployment scripts
- `output.txt` — Actual command output from execution
- `screenshots/` — Terminal screenshots showing working output
