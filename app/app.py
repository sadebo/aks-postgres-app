from flask import Flask
import psycopg2, os

app = Flask(__name__)

@app.route("/")
def hello():
    conn = psycopg2.connect(
        dbname=os.getenv("DB_NAME"),
        user=os.getenv("DB_USER"),
        password=os.getenv("DB_PASSWORD"),
        host=os.getenv("DB_HOST")
    )
    cur = conn.cursor()
    cur.execute("SELECT 'Hello from Postgres!'")
    msg = cur.fetchone()[0]
    cur.close()
    conn.close()
    return msg
