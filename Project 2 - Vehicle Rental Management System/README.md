# 🚗 Vehicle Rental Management System — SQL Project

A relational SQL database, built from scratch, for a vehicle rental company that rents out **cars and bikes**. This project covers database design, table creation with integrity constraints, sample data, and 20 SQL queries that answer real business questions — from simple filtering to joins, aggregates, and ranking the top-spending customers.

## 📌 Problem Statement

A vehicle rental company needs a system to track available vehicles, customers, bookings, payment status, and revenue — and to answer questions like:
- Which vehicles are currently available?
- Which vehicle types are most popular?
- Which customers have spent the most?
- What is the company's total and average revenue per booking?

## 🗂️ Repository Contents

| File | Description |
|---|---|
| `Vehicle_Rental_SQL_Assignment.docx` | The original assignment brief (problem statement + 20 questions) |
| `Vehicle_Rental_SQL_Solution.docx` | Full solution write-up — schema design, design-choice explanations, and every query with its purpose, logic, and business insight |
| `database.sql` | Complete, runnable SQL script: database + table creation, sample data (15 vehicles, 15 customers, 20 bookings), and all 20 queries |
| `README.md` | This file |

## 🧱 Database Design

Three tables, related through foreign keys:

- **VEHICLE** — vehicle master data (type, brand, status, rent/day)
- **CUSTOMER** — customer master data
- **BOOKING** — transactional table linking a customer and a vehicle for a rental period

```
CUSTOMER (1) ───< BOOKING >─── (1) VEHICLE
```

Key design choices:
- `PRIMARY KEY` on each table's ID column, `FOREIGN KEY` on `booking.CID` / `booking.VID` for referential integrity.
- `CHECK` constraints on `Vehicle_Type`, `Status`, `Fuel_Type`, and `Payment_Status` to restrict values to a valid set.
- `DECIMAL(10,2)` for all currency columns to avoid floating-point rounding errors.

## 🧪 Query Coverage

| Section | Topics |
|---|---|
| A | Filtering with `WHERE`, `AND`, `BETWEEN` |
| B | `INNER JOIN` across two and three tables, `DISTINCT` |
| C | Aggregate functions — `SUM`, `AVG`, `MAX`, `COUNT` |
| D | `GROUP BY`, `HAVING`, `ORDER BY` |
| E | Final business question — top 3 customers by revenue (`JOIN` + `GROUP BY` + `ORDER BY` + `LIMIT`) |

## ▶️ How to Run

1. Open MySQL (Workbench).
2. Run `database.sql` top to bottom — it creates the database, tables, sample data, and includes all 20 queries ready to execute.

## 🛠️ Tech Used

- **MySQL** for database design and querying
- Core SQL concepts: DDL, DML, constraints, joins, aggregate functions, `GROUP BY` / `HAVING`, ranking with `ORDER BY` + `LIMIT`

---

