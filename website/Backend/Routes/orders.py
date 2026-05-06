from flask import Blueprint, jsonify
from db import query_all, query_one

orders_bp = Blueprint("orders", __name__)


@orders_bp.get("/orders/<int:user_id>")
def get_orders(user_id):
    rows = query_all(
        """
        SELECT t.transaction_id, t.total_amount, t.created_at,
               ps.name AS payment_status,
               pm.name AS payment_method
        FROM transactions t
        LEFT JOIN payment_statuses ps ON t.payment_status_id = ps.payment_status_id
        LEFT JOIN payment_methods pm ON t.payment_method_id = pm.payment_method_id
        WHERE t.user_id = ?
        ORDER BY t.transaction_id DESC
        """,
        (user_id,),
    )
    return jsonify({"success": True, "data": rows})


@orders_bp.get("/invoice/<int:transaction_id>")
def get_invoice(transaction_id):
    tx = query_one(
        """
        SELECT t.transaction_id, t.user_id, t.total_amount, t.created_at,
               ps.name AS payment_status,
               pm.name AS payment_method
        FROM transactions t
        LEFT JOIN payment_statuses ps ON t.payment_status_id = ps.payment_status_id
        LEFT JOIN payment_methods pm ON t.payment_method_id = pm.payment_method_id
        WHERE t.transaction_id = ?
        """,
        (transaction_id,),
    )
    if not tx:
        return jsonify({"success": False, "error": "Transaction not found"}), 404

    items = query_all(
        """
        SELECT ti.product_id, p.name, ti.quantity, ti.unit_price, (ti.quantity * ti.unit_price) AS line_total
        FROM transaction_items ti
        INNER JOIN products p ON ti.product_id = p.product_id
        WHERE ti.transaction_id = ?
        """,
        (transaction_id,),
    )

    tx["items"] = items
    return jsonify({"success": True, "data": tx})
