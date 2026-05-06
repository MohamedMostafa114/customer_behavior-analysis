from flask import Blueprint, jsonify
from db import query_all, query_one

admin_bp = Blueprint("admin", __name__)


@admin_bp.get("/admin/products")
def admin_products():
    rows = query_all(
        """
        SELECT p.product_id, p.name, p.rating, c.name AS category_name, pr.price
        FROM products p
        INNER JOIN product_prices pr ON p.product_id = pr.product_id AND pr.end_date IS NULL
        LEFT JOIN categories c ON p.category_id = c.category_id
        ORDER BY p.product_id DESC
        """
    )
    return jsonify({"success": True, "data": rows})


@admin_bp.get("/admin/orders")
def admin_orders():
    rows = query_all(
        """
        SELECT t.transaction_id, t.user_id, t.total_amount, t.created_at,
               pm.name AS payment_method, ps.name AS payment_status
        FROM transactions t
        LEFT JOIN payment_methods pm ON t.payment_method_id = pm.payment_method_id
        LEFT JOIN payment_statuses ps ON t.payment_status_id = ps.payment_status_id
        ORDER BY t.transaction_id DESC
        """
    )
    return jsonify({"success": True, "data": rows})


@admin_bp.get("/admin/stats")
def admin_stats():
    users_count = query_one("SELECT COUNT(*) AS total_users FROM users")
    sales = query_one("SELECT ISNULL(SUM(total_amount), 0) AS total_sales FROM transactions")
    orders_count = query_one("SELECT COUNT(*) AS total_orders FROM transactions")

    return jsonify(
        {
            "success": True,
            "data": {
                "total_users": int(users_count["total_users"]),
                "total_sales": float(sales["total_sales"]),
                "total_orders": int(orders_count["total_orders"]),
            },
        }
    )
