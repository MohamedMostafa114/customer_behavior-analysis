from flask import Flask, jsonify
from flask_cors import CORS
from dotenv import load_dotenv
from db import close_db
from routes.auth import auth_bp
from routes.products import products_bp
from routes.cart import cart_bp
from routes.checkout import checkout_bp
from routes.orders import orders_bp
from routes.admin import admin_bp


def create_app():
    load_dotenv()
    app = Flask(__name__)
    CORS(app)

    app.register_blueprint(auth_bp, url_prefix="/api")
    app.register_blueprint(products_bp, url_prefix="/api")
    app.register_blueprint(cart_bp, url_prefix="/api")
    app.register_blueprint(checkout_bp, url_prefix="/api")
    app.register_blueprint(orders_bp, url_prefix="/api")
    app.register_blueprint(admin_bp, url_prefix="/api")

    @app.errorhandler(404)
    def not_found(_):
        return jsonify({"success": False, "error": "Not found"}), 404

    @app.errorhandler(Exception)
    def handle_error(error):
        return jsonify({"success": False, "error": str(error)}), 500

    app.teardown_appcontext(close_db)
    return app


if __name__ == "__main__":
    create_app().run(debug=True, host="0.0.0.0", port=5000)
