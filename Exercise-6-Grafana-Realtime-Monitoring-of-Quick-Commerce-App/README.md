# Exercise 6: Real-Time Operations Monitoring and Alerting (ZAPPTTO)

## Objective
You are a DevOps engineer in ZAPPTTO managing a fast-paced delivery service that needs real-time insights into operational efficiency and delivery performance.

## Approach
Using Python and Prometheus, create a pipeline that simulates delivery metrics, visualizes them on dashboards and sets up automated alerts.

## Files
- `delivery_metrics.py` — Simulates and exposes delivery metrics on port 8000
- `prometheus.yml` — Prometheus scrape config targeting `172.17.0.1:8000`
- `alert_rules.yml` — Alert rules for high pending deliveries and high avg delivery time
- `Jenkinsfile` — Jenkins pipeline to run the metrics server and Prometheus/Grafana
- `requirements.txt` — `prometheus-client` dependency

## Metrics Exposed
| Metric | Type |
|---|---|
| `total_deliveries` | Gauge |
| `pending_deliveries` | Gauge |
| `on_the_way_deliveries` | Gauge |
| `average_delivery_time` | Summary |

## How to Run
```bash
pip3 install prometheus-client
python3 delivery_metrics.py &
curl http://localhost:8000/metrics

# Run Prometheus
docker run -d --name prometheus --network=host \
  -v ./prometheus.yml:/etc/prometheus/prometheus.yml \
  -v ./alert_rules.yml:/etc/prometheus/alert_rules.yml \
  prom/prometheus

# Run Grafana
docker run -d --name grafana -p 3000:3000 grafana/grafana
```

## Screenshots
- `screenshots/01_prometheus_metrics_live.png` — Live metrics with `total_deliveries`, `pending_deliveries`, `on_the_way_deliveries`
- `screenshots/02_prometheus_grafana_stack.png` — Prometheus and Grafana containers running
