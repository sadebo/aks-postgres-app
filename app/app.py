from flask import Flask
import psycopg2
import os

app = Flask(__name__)

def get_db_connection():
    conn = psycopg2.connect(
        dbname=os.getenv("DB_NAME", "appdb"),
        user=os.getenv("DB_USER", "app_user"),
        password=os.getenv("DB_PASSWORD", "SuperSecure123"),
        host=os.getenv("DB_HOST", "demo-cluster.default.svc.cluster.local"),
        port=os.getenv("DB_PORT", "5432")
    )
    return conn

@app.route("/")
def index():
    try:
        conn = get_db_connection()
        cur = conn.cursor()
        cur.execute("SELECT 'Hello from Postgres via Flask!'")
        msg = cur.fetchone()[0]
        cur.close()
        conn.close()
        return msg
    except Exception as e:
        return f"Database connection failed: {e}"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
