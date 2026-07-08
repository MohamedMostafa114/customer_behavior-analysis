import Link from "next/link";

export default function HomePage() {
  return (
    <>
      <section className="card">
        <h1 className="page-title">Welcome to our E‑Commerce store</h1>
        <div className="form-group">
          <input
            className="form-input"
            placeholder="Search products"
            aria-label="Search products"
          />
        </div>
        <div className="row">
          <Link className="btn-primary" href="/shop">
            Browse Products
          </Link>
          <Link className="btn-outline" href="/categories">
            View Categories
          </Link>
        </div>
      </section>
      <section className="section">
        <div className="courses-grid">
          <div className="course-card">
            <div className="card-title">Featured Products</div>
            <div className="card-meta">Curated picks powered by analytics.</div>
          </div>
          <div className="course-card">
            <div className="card-title">New Arrivals</div>
            <div className="card-meta">Recently added products from top brands.</div>
          </div>
          <div className="course-card">
            <div className="card-title">Best Sellers</div>
            <div className="card-meta">High‑performing items by revenue and orders.</div>
          </div>
        </div>
      </section>
    </>
  );
}

