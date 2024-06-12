# /my-app/app-v1/app.py
from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello():
    return "Hello, World! Version 1"

@app.route('/health')
def health():
    return "Healthy", 200

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=80)
