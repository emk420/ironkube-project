from flask import Flask, jsonify
import os

app = Flask(__name__)

INVENTORY = {
    "apple": 50,
    "banana": 30,
    "orange": 20
}

@app.route('/health')
def health():
    return jsonify({"status": "healthy"})

@app.route('/inventory')
def inventory():
    return jsonify(INVENTORY)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=9000)

@app.route('/version')
def version():
    return jsonify({
        "version": "2.0.0",
        "status": "updated"
    })

@app.route('/info')
def info():
    return jsonify({
        "app": "IronKube Inventory API",
        "version": "2.0.0",
        "status": "running",
        "environment": "production"
    })

@app.route('/stats')
def stats():
    total_items = len(INVENTORY)
    total_quantity = sum(INVENTORY.values())
    return jsonify({
        "total_items": total_items,
        "total_quantity": total_quantity,
        "items": INVENTORY
    })
