import hashlib
import secrets
from flask import Blueprint, request, jsonify
from db import query_one, execute

auth_bp = Blueprint("auth", __name__)


def _hash_password(password: str) -> str:
    return hashlib.sha256(password.encode("utf-8")).hexdigest()


@auth_bp.post("/signup")
def signup():
    data = request.get_json() or {}
    first_name = (data.get("first_name") or "").strip()
    last_name = (data.get("last_name") or "").strip()
    email = (data.get("email") or "").strip().lower()
    password = data.get("password") or ""

    if not all([first_name, last_name, email, password]):
        return jsonify({"success": False, "error": "All fields are required"}), 400

    exists = query_one("SELECT user_id FROM users WHERE email = ?", (email,))
    if exists:
        return jsonify({"success": False, "error": "Email already exists"}), 409

    hashed = _hash_password(password)
    user_id = execute(
        """
        INSERT INTO users (first_name, last_name, email, password_hash)
        VALUES (?, ?, ?, ?)
        """,
        (first_name, last_name, email, hashed),
    )

    token = secrets.token_hex(24)
    execute(
        """
        INSERT INTO sessions (user_id, token)
        VALUES (?, ?)
        """,
        (int(user_id), token),
    )

    return jsonify({"success": True, "token": token, "user_id": int(user_id)}), 201


@auth_bp.post("/login")
def login():
    data = request.get_json() or {}
    email = (data.get("email") or "").strip().lower()
    password = data.get("password") or ""

    if not email or not password:
        return jsonify({"success": False, "error": "Email and password are required"}), 400

    user = query_one(
        "SELECT user_id, password_hash FROM users WHERE email = ?",
        (email,),
    )
    if not user or user["password_hash"] != _hash_password(password):
        return jsonify({"success": False, "error": "Invalid credentials"}), 401

    token = secrets.token_hex(24)
    execute(
        "INSERT INTO sessions (user_id, token) VALUES (?, ?)",
        (user["user_id"], token),
    )

    return jsonify({"success": True, "token": token, "user_id": user["user_id"]})
