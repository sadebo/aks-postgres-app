import os
import psycopg2
from flask import Flask, jsonify

app = Flask(__name__)

# Get DATABASE_URL from environment (injected via K8s secret)
DATABASE_URL = os.getenv("DATABASE_URL")

def get_db_connection():
    conn = psycopg2.connect(DATABASE_URL)
    return conn

@app.route("/")
def index():
    return "Hello from Flask + AKS + ArgoCD + Postgres!"

@app.route("/healthz")
def healthz():
    return jsonify(status="ok"), 200

@app.route("/users")
def users():
    try:
        conn = get_db_connection()
        cur = conn.cursor()
        cur.execute("CREATE TABLE IF NOT EXISTS users (id SERIAL PRIMARY KEY, name TEXT);")
        cur.execute("INSERT INTO users (name) VALUES ('User from Flask!') RETURNING id, name;")
        conn.commit()
        cur.execute("SELECT id, name FROM users;")
        rows = cur.fetchall()
        cur.close()
        conn.close()
        return jsonify(rows)
    except Exception as e:
        return jsonify(error=str(e)), 500

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
