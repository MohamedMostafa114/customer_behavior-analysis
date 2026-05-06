import os
import pyodbc
from flask import g


def _build_connection_string():
    # Update these env vars to match your SQL Server setup.
    driver = os.getenv("DB_DRIVER", "ODBC Driver 17 for SQL Server")
    server = os.getenv("DB_SERVER", "localhost")
    database = os.getenv("DB_NAME", "customer_behavior")
    username = os.getenv("DB_USER", "")
    password = os.getenv("DB_PASSWORD", "")
    trusted = os.getenv("DB_TRUSTED_CONNECTION", "yes").lower() in {"1", "true", "yes"}

    if trusted:
        return f"DRIVER={{{driver}}};SERVER={server};DATABASE={database};Trusted_Connection=yes;"

    return (
        f"DRIVER={{{driver}}};SERVER={server};DATABASE={database};"
        f"UID={username};PWD={password};"
    )


def get_db():
    if "db_conn" not in g:
        g.db_conn = pyodbc.connect(_build_connection_string())
    return g.db_conn


def close_db(_error=None):
    conn = g.pop("db_conn", None)
    if conn is not None:
        conn.close()


def query_all(sql, params=()):
    conn = get_db()
    cur = conn.cursor()
    cur.execute(sql, params)
    cols = [c[0] for c in cur.description] if cur.description else []
    rows = [dict(zip(cols, row)) for row in cur.fetchall()]
    cur.close()
    return rows


def query_one(sql, params=()):
    rows = query_all(sql, params)
    return rows[0] if rows else None


def execute(sql, params=(), commit=True):
    conn = get_db()
    cur = conn.cursor()
    cur.execute(sql, params)
    if commit:
        conn.commit()
    try:
        cur.execute("SELECT SCOPE_IDENTITY() AS id")
        last_id = cur.fetchone()[0]
    except Exception:
        last_id = None
    cur.close()
    return last_id
