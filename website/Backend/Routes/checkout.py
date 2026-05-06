from flask import Blueprint, request, jsonify
from db import query_one, query_all, execute

checkout_bp = Blueprint("checkout", __name__)


def _user_from_token(token):
    if not token:
        return None
    row = query_one("SELECT user_id FROM sessions WHERE token = ?", (token,))
    return row["user_id"] if row else None


@checkout_bp.post("/checkout")
def checkout():
    token = request.headers.get("Authorization", "").replace("Bearer ", "")
    user_id = _user_from_token(token)
    if not user_id:
        return jsonify({"success": False, "error": "Unauthorized"}), 401

    data = request.get_json() or {}
    payment_method_id = data.get("payment_method_id", 1)

    cart_items = query_all(
        """
        SELECT ci.product_id, ci.quantity, pr.price
        FROM cart_items ci
        INNER JOIN cart_sessions cs ON ci.cart_session_id = cs.cart_session_id
        INNER JOIN product_prices pr ON ci.product_id = pr.product_id
        WHERE cs.user_id = ? AND pr.end_date IS NULL
        """,
        (user_id,),
    )
    if not cart_items:
        return jsonify({"success": False, "error": "Cart is empty"}), 400

    total = sum(float(item["price"]) * int(item["quantity"]) for item in cart_items)

    transaction_id = execute(
        """
        INSERT INTO transactions (user_id, payment_method_id, payment_status_id, total_amount)
        VALUES (?, ?, ?, ?)
        """,
        (user_id, payment_method_id, 1, total),
    )

    for item in cart_items:
        execute(
            """
            INSERT INTO transaction_items (transaction_id, product_id, quantity, unit_price)
            VALUES (?, ?, ?, ?)
            """,
            (transaction_id, item["product_id"], item["quantity"], item["price"]),
        )

    execute(
        "DELETE ci FROM cart_items ci INNER JOIN cart_sessions cs ON ci.cart_session_id = cs.cart_session_id WHERE cs.user_id = ?",
        (user_id,),
    )

    return jsonify({"success": True, "transaction_id": int(transaction_id), "total": total}), 201
