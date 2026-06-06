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
