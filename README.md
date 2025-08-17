# E-Commerce Sales Analysis (SQL Project)
# Project Overview

This project demonstrates SQL-based analysis of an E-commerce sales database.
The database contains information about customers, products, orders, and order details.
Using SQL queries, I performed business-focused analysis to uncover insights on sales performance, customer behavior, and product trends.

# Database Schema

The project consists of four main tables:

Customers – stores customer details (name, email, location, signup date)

Products – stores product information (name, category, price)

Orders – stores order information (order ID, customer ID, order date)

OrderDetails – stores transaction details (order ID, product ID, quantity)

 # Project Tasks & Queries

Top 5 highest revenue-generating products
→ Identified products contributing most to total revenue.

Customers who spent the most in the last 6 months
→ Ranked customers by total purchase value over recent 6 months.

Monthly sales trend
→ Aggregated sales by month to identify revenue growth trends.

Customer churn analysis
→ Detected customers who did not place any orders in the last 3 months.

Ranking categories by sales (Window Functions)
→ Ranked product categories by their total revenue contribution.

# Input Data

Sample records for customers, products, orders, and order details (manually inserted for demo).

Can be extended with larger datasets from Kaggle or real-world CSVs.

# Output / Insights

Business insights extracted using SQL queries, for example:

Best-performing products and categories.

High-value customers driving revenue.

Monthly revenue trends for growth analysis.

Churned customers for retention strategies.

# Tools & Technologies

Database: PostgreSQL (works in MySQL/SQLite with small syntax changes)

Language: SQL (Joins, Aggregates, Subqueries, CTEs, Window Functions)

IDE/Tools: pgAdmin / DBeaver / MySQL Workbench
