import type { ReactNode, ButtonHTMLAttributes, InputHTMLAttributes } from "react";
import clsx from "clsx";

export function Container({ children, className }: { children: ReactNode; className?: string }) {
  return <div className={clsx("container", className)}>{children}</div>;
}

export function Card({ children, className }: { children: ReactNode; className?: string }) {
  return <div className={clsx("card", className)}>{children}</div>;
}

export function Button({
  variant = "primary",
  className,
  ...props
}: ButtonHTMLAttributes<HTMLButtonElement> & { variant?: "primary" | "outline" }) {
  const base =
    variant === "primary"
      ? "btn-primary"
      : "btn-outline";
  return <button className={clsx(base, className)} {...props} />;
}

export function Input(props: InputHTMLAttributes<HTMLInputElement>) {
  return <input className={clsx("form-input", props.className)} {...props} />;
}

export function Table({
  header,
  children
}: {
  header: ReactNode;
  children: ReactNode;
}) {
  return (
    <div className="admin-table">
      <div className="admin-table-row">{header}</div>
      {children}
    </div>
  );
}

export function Skeleton({ className }: { className?: string }) {
  return (
    <div
      className={clsx(
        "bg-[color:var(--bg3)] animate-pulse rounded-[var(--radius)]",
        className
      )}
    />
  );
}

export function AdminKpiCard({
  label,
  value
}: {
  label: string;
  value: ReactNode;
}) {
  return (
    <div className="admin-stat-card">
      <div>{label}</div>
      <h2>{value}</h2>
    </div>
  );
}

