from flask import Flask, request, jsonify
import socket, time, random, os

app = Flask(__name__)
ORDER_COUNT = 0

PRODUCTS = [
    {"id": 1, "name": "MacBook Pro", "price": 1299, "stock": random.randint(5,20)},
    {"id": 2, "name": "AirPods Pro", "price": 249,  "stock": random.randint(10,50)},
    {"id": 3, "name": "iPhone 15",   "price": 999,  "stock": random.randint(3,15)},
    {"id": 4, "name": "iPad Air",    "price": 599,  "stock": random.randint(8,25)},
]

@app.get('/')
def homepage():
    return jsonify({
        "event": "DevOps Flash Sale 2025!",
        "pod": socket.gethostname(),
        "timestamp": time.strftime("%Y-%m-%d %H:%M:%S"),
        "total_orders": ORDER_COUNT
    })

@app.get('/products')
def products():
    return jsonify({"products": PRODUCTS, "served_by": socket.gethostname()})

@app.post('/order')
def place_order():
    global ORDER_COUNT
    data = request.get_json(silent=True) or {}
    product_id = data.get('product_id', random.randint(1,4))
    qty = data.get('quantity', 1)
    ORDER_COUNT += 1
    product = next((p for p in PRODUCTS if p['id'] == product_id), PRODUCTS[0])
    return jsonify({
        "order_id": f"ORD-{ORDER_COUNT:05d}",
        "product": product['name'],
        "quantity": qty,
        "total": product['price'] * qty,
        "served_by_pod": socket.gethostname(),
        "status": "confirmed"
    })

@app.get('/health')
def health():
    return jsonify({"status": "healthy", "pod": socket.gethostname(), "uptime": time.time()})
