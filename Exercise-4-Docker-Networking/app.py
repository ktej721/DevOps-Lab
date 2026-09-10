from flask import Flask, jsonify
import os, socket

app = Flask(__name__)

@app.route('/')
def index():
    return jsonify({
        "service": "Student Grade Tracker",
        "version": "1.0",
        "host": socket.gethostname(),
        "status": "running"
    })

@app.route('/grades', methods=['GET'])
def get_grades():
    return jsonify([
        {"student": "Alice", "subject": "DevOps", "grade": "A"},
        {"student": "Bob",   "subject": "DevOps", "grade": "B+"},
        {"student": "Carol", "subject": "DevOps", "grade": "A-"},
    ])

@app.route('/health')
def health():
    return jsonify({"status": "healthy", "host": socket.gethostname()})

if __name__ == '__main__':
    port = int(os.environ.get('PORT', 5001))
    app.run(host='0.0.0.0', port=port, debug=False)
