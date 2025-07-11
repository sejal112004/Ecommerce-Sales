# 📊 E-commerce Sales Analysis using SQL

This project explores an e-commerce company's transactional data using SQL. It answers key business questions related to customer behavior, product performance, payment trends, and shipping efficiency through a series of optimized SQL queries.

---

## 📁 Project Structure

📦ecommerce-sales-analysis-sql
├── 📄 README.md
├── 📂 SQL-Files
│ ├── schema.sql # Database and table definitions
│ ├── data.sql # Sample data inserts
│ └── query.sql # SQL queries for analysis

## 📋 Table Overview

| Table Name     | Description |
|----------------|-------------|
| `customers`    | Stores customer profiles with demographic and contact details |
| `products`     | Contains product information including name, category, price, and stock |
| `orders`       | Captures order transactions linked to customers |
| `order_items`  | Lists individual product items within orders with quantity and pricing |
| `payments`     | Tracks payments made for orders with method and date |
| `shipping`     | Stores order delivery details, including status and delivery dates |

---

## 🧠 Key SQL Concepts Used

- **Joins**: `INNER JOIN`, `LEFT JOIN`
- **Aggregates**: `SUM()`, `AVG()`, `COUNT()`
- **Grouping**: `GROUP BY`, `HAVING`
- **Filtering**: `WHERE`, `BETWEEN`, `IN`
- **Date Functions**: `CURDATE()`, `DATEDIFF()`, `MONTH()`
- **Sorting & Limiting**: `ORDER BY`, `LIMIT`
- **Subqueries** & `DISTINCT`

---

## 💡 Sample Query Ideas

- Top-selling products by quantity and revenue
- Monthly and daily sales trends
- Orders not yet delivered
- Most common payment methods
- Customers who have never ordered
- Orders delivered within 5 days
- Products with highest stock remaining
- Sales by category and payment insights

## 🖼️ Sample Output

Example: List the names of customers who made payments over ₹3000.
<img width="320" height="162" alt="image" src="https://github.com/user-attachments/assets/60e3d9a0-cc07-4e2a-99b8-f4b2474b9f50" />

## ▶️ How to Use

1. **Clone the Repository:**
   git clone https://github.com/yourusername/ecommerce-sales-analysis-sql.git
   cd ecommerce-sales-analysis-sql
