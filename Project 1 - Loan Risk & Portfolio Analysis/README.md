# 🏦 Loan Portfolio & Risk Analysis System — SQL Project

A SQL-based loan analytics system, built from scratch, for a financial institution that provides home, personal, car, education and business loans to customers across multiple cities and regions. This project covers database design, a fully-constrained table, sample data, and **80+ SQL queries** — from basic filtering to subqueries, self-joins, CASE-based risk classification, and business KPIs — that turn raw loan records into management-ready insight.

## 📌 Problem Statement

Management needs a database-driven way to analyze the loan portfolio and answer questions like:
- Which customers have active loans, and which are overdue?
- Which loan products and cities generate the highest business?
- How much has been disbursed, and how much is still outstanding?
- Which customers represent higher credit risk?
- What is the loan approval rate, and how is activity trending over time?

## 🗂️ Repository Contents

| File | Description |
|---|---|
| `Loan_SQL_Assignment.docx` | The polished assignment brief — problem statement, table structure, and all 80+ questions (no answers) |
| `Loan_SQL_Solution.docx` | Full solution write-up — schema design with explained constraints, and every query with its objective, logic, and business insight |
| `loan_database.sql` | Complete, runnable SQL script: database + table creation, 20 sample loan records, and all 80+ queries organized by section |
| `README.md` | This file |

## 🧱 Database Design

A single, denormalized **LOANS** table — one row per loan — mirroring how loan data is typically exported from a bank's loan management system for analytics.

Key design choices:
- `PRIMARY KEY` on `Loan_ID`.
- `CHECK` constraints on `Gender`, `Age`, `Annual_Income`, `Loan_Type`, `Loan_Amount`, `Interest_Rate`, `Loan_Status`, `Credit_Score`, and `Payment_Status` to keep categorical and numeric fields valid.
- `DECIMAL` for all currency columns to avoid floating-point rounding errors.
- A CASE-based `Risk_Category` is calculated on the fly from `Credit_Score` (not stored) using this rule:

| Credit Score | Risk Category |
|---|---|
| 750+ | Low Risk |
| 650 – 749 | Medium Risk |
| 550 – 649 | High Risk |
| Below 550 | Very High Risk |

## 🧪 Query Coverage

| Section | Topics | Questions |
|---|---|---|
| A | Basic SQL — `SELECT`, `WHERE` | 1–10 |
| B | Filtering & Sorting — `ORDER BY`, `LIKE`, `IN`, `BETWEEN` | 11–20 |
| C | Aggregate functions — `SUM`, `AVG`, `MAX`, `MIN`, `COUNT` | 21–32 |
| D | `GROUP BY` across loan type, city, state, employment type | 33–42 |
| E | `HAVING` — filtering on aggregated groups | 43–47 |
| F | `CASE` — risk classification | 48–51 |
| G | Business KPIs — approval rate, default count, % overdue | 52–60 |
| H | Date analysis — `YEAR()`, `MONTH()`, `DATEDIFF()` | 61–67 |
| I | Subqueries — comparing rows to an average/max | 68–73 |
| J | Advanced SQL — top-N rankings, self-join | 74–80 |
| K | Final Business Challenge — Loan Risk & Portfolio Report | Portfolio / Customer / Risk / Performance |

## ▶️ How to Run

1. Open MySQL (Workbench).
2. Run `loan_database.sql` top to bottom — it creates the database, table, sample data, and includes all 80+ queries ready to execute.

## 🛠️ Tech Used

- **MySQL** for database design and querying
- Core SQL concepts: DDL, DML, `CHECK` constraints, aggregate functions, `GROUP BY` / `HAVING`, `CASE` expressions, date functions, subqueries, self-joins, and percentage-based KPI formulas

---

