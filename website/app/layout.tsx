import type { ReactNode } from "react";
import "../styles/globals.css";

export const metadata = {
  title: "DataFlow Shop",
  description: "Customer Behavior Analytics E‑commerce Platform"
};

export default function RootLayout({ children }: { children: ReactNode }) {
  return (
    <html lang="en">
      <body data-page="">
        <nav>
          <div className="nav-logo">
            Data<span>Flow</span> Shop
          </div>
          <div className="nav-links">
            <a className="nav-btn" href="/">
              Home
            </a>
            <a className="nav-btn" href="/shop">
              Products
            </a>
            <a className="nav-cart-btn" href="/cart">
              Cart
            </a>
            <a className="nav-btn" href="/account">
              Account
            </a>
          </div>
        </nav>
        <main className="container">{children}</main>
      </body>
    </html>
  );
}

