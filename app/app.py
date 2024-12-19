from flask import Flask, jsonify
import psycopg2
import os

app = Flask(_name_)

@app.route("/")
def index():
    return "Welcome to the Flask App!"

@app.route("/health")
def health_check():
    """
    Health endpoint to check database connectivity.
    Returns 200 if the connection is successful, otherwise 500.
    """
    try:
        # Connect to the database using credentials from environment variables
        conn = psycopg2.connect(
            dbname=os.environ["DB_NAME"],
            user=os.environ["DB_USER"],
            password=os.environ["DB_PASSWORD"],
            host=os.environ["DB_HOST"]
        )
        conn.close()
        return jsonify({"status": "healthy", "db_connection": "successful"}), 200
    except Exception as e:
        return jsonify({"status": "unhealthy", "error": str(e)}), 500

if _name_ == "_main_":
    # Bind to 0.0.0.0 to make the app accessible in the container
    app.run(host="0.0.0.0", port=8080)