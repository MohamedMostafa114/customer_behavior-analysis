from flask import Blueprint, jsonify
from db import query_all, query_one

products_bp = Blueprint("products", __name__)


@products_bp.get("/products")
def get_products():
    rows = query_all(
        """
        SELECT
            p.product_id,
            p.name AS product_name,
            p.description,
            p.rating AS avg_rating,
            p.stock_quantity,
            pr.price
        FROM products p
        INNER JOIN product_prices pr ON p.product_id = pr.product_id
        WHERE pr.end_date IS NULL
        ORDER BY p.product_id ASC
        """
    )
    print(f"/api/products returned {len(rows)} rows")
    return jsonify({"success": True, "data": rows})


@products_bp.get("/products/<int:product_id>")
def get_product(product_id):
    row = query_one(
        """
        SELECT
            p.product_id,
            p.name AS product_name,
            p.description,
            p.rating AS avg_rating,
            p.stock_quantity,
            pr.price
        FROM products p
        INNER JOIN product_prices pr ON p.product_id = pr.product_id
        WHERE p.product_id = ? AND pr.end_date IS NULL
        """,
        (product_id,),
    )

    if not row:
        return jsonify({"success": False, "error": "Product not found"}), 404

    return jsonify({"success": True, "data": row})


@products_bp.get("/categories")
def get_categories():
    rows = query_all("SELECT category_id, name FROM categories ORDER BY name")
    return jsonify({"success": True, "data": rows})
