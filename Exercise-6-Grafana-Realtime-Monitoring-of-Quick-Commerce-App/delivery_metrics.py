from prometheus_client import start_http_server, Summary, Gauge
import random
import time

# Define metrics with exact names from exercise spec
total_deliveries = Gauge("total_deliveries", "Total number of deliveries")
pending_deliveries = Gauge("pending_deliveries", "Number of pending deliveries")
on_the_way_deliveries = Gauge("on_the_way_deliveries", "Number of deliveries on the way")
average_delivery_time = Summary("average_delivery_time", "Average delivery time in seconds")

def simulate_metrics():
    while True:
        total = random.randint(100, 200)
        pending = random.randint(5, 20)
        on_the_way = random.randint(10, 50)
        avg_time = random.uniform(10, 60)

        total_deliveries.set(total)
        pending_deliveries.set(pending)
        on_the_way_deliveries.set(on_the_way)
        average_delivery_time.observe(avg_time)

        print(f"total={total} pending={pending} on_the_way={on_the_way} avg_time={avg_time:.2f}s")
        time.sleep(2)

if __name__ == "__main__":
    start_http_server(8000)
    print("Metrics server started on port 8000")
    print("Access metrics at http://localhost:8000/metrics")
    simulate_metrics()
