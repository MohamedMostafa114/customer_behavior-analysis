from flask import Blueprint, request, jsonify
from db import query_one, query_all, execute

cart_bp = Blueprint("cart", __name__)


def _get_user_id_from_token(token):
    if not token:
        return None
    session = query_one("SELECT user_id FROM sessions WHERE token = ?", (token,))
    return session["user_id"] if session else None


def _get_or_create_cart_session(user_id):
    session = query_one(
        "SELECT TOP 1 cart_session_id FROM cart_sessions WHERE user_id = ? ORDER BY cart_session_id DESC",
        (user_id,),
    )
    if session:
        return session["cart_session_id"]
    return execute("INSERT INTO cart_sessions (user_id) VALUES (?)", (user_id,))


@cart_bp.get("/cart")
def get_cart():
    token = request.headers.get("Authorization", "").replace("Bearer ", "")
    user_id = _get_user_id_from_token(token)
    if not user_id:
        return jsonify({"success": False, "error": "Unauthorized"}), 401

    rows = query_all(
        """
        SELECT
            ci.cart_item_id,
            ci.quantity,
            p.product_id,
            p.name,
            p.rating,
            pr.price,
            (ci.quantity * pr.price) AS line_total
        FROM cart_items ci
        INNER JOIN cart_sessions cs ON ci.cart_session_id = cs.cart_session_id
        INNER JOIN products p ON ci.product_id = p.product_id
        INNER JOIN product_prices pr ON p.product_id = pr.product_id
        WHERE cs.user_id = ? AND pr.end_date IS NULL
        """,
        (user_id,),
    )
    return jsonify({"success": True, "data": rows})


@cart_bp.post("/cart/add")
def add_cart_item():
    data = request.get_json() or {}
    token = request.headers.get("Authorization", "").replace("Bearer ", "")
    user_id = _get_user_id_from_token(token)
    if not user_id:
        return jsonify({"success": False, "error": "Unauthorized"}), 401

    product_id = data.get("product_id")
    quantity = int(data.get("quantity", 1))
    if not product_id or quantity <= 0:
        return jsonify({"success": False, "error": "Invalid product or quantity"}), 400

    cart_session_id = _get_or_create_cart_session(user_id)
    existing = query_one(
        "SELECT cart_item_id, quantity FROM cart_items WHERE cart_session_id = ? AND product_id = ?",
        (cart_session_id, product_id),
    )
    if existing:
        execute(
            "UPDATE cart_items SET quantity = ? WHERE cart_item_id = ?",
            (existing["quantity"] + quantity, existing["cart_item_id"]),
        )
    else:
        execute(
            "INSERT INTO cart_items (cart_session_id, product_id, quantity) VALUES (?, ?, ?)",
            (cart_session_id, product_id, quantity),
        )

    return jsonify({"success": True, "message": "Item added to cart"}), 201


@cart_bp.post("/cart/update")
def update_cart_item():
    data = request.get_json() or {}
    cart_item_id = data.get("cart_item_id")
    quantity = int(data.get("quantity", 0))

    if not cart_item_id or quantity <= 0:
        return jsonify({"success": False, "error": "Quantity must be greater than 0"}), 400

    execute("UPDATE cart_items SET quantity = ? WHERE cart_item_id = ?", (quantity, cart_item_id))
    return jsonify({"success": True, "message": "Cart updated"})


@cart_bp.post("/cart/remove")
def remove_cart_item():
    data = request.get_json() or {}
    cart_item_id = data.get("cart_item_id")
    if not cart_item_id:
        return jsonify({"success": False, "error": "cart_item_id is required"}), 400

    execute("DELETE FROM cart_items WHERE cart_item_id = ?", (cart_item_id,))
    return jsonify({"success": True, "message": "Item removed"})
