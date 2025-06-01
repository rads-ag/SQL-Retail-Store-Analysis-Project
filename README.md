# 📊 SQL Retail Store Analysis Project

Welcome to the **SQL Retail Store Analysis Project**!  
This project uses a relational database schema representing a retail business to practice SQL queries ranging from beginner to advanced levels. The goal is to understand and apply SQL concepts in real-world scenarios using a normalized database schema.

---
## Dataset Link = https://www.kaggle.com/datasets/dillonmyrick/bike-store-sample-database?resource=download
## 🗂️ Dataset Overview

The dataset consists of the following **9 interconnected tables**:

- **Customers**: Customer personal and contact details.
- **Orders**: Order records with dates, status, and associated customers/staff.
- **Order_Items**: Line-item details for each order.
- **Staffs**: Employee records, including management hierarchy.
- **Stores**: Store locations and contact info.
- **Products**: Product catalog with brands and categories.
- **Categories**: Product classification (e.g., electronics, clothing).
- **Brands**: Brand information for products.
- **Stocks**: Quantity of each product in every store.

---

## 🎯 Project Objective

- Practice and reinforce **SQL fundamentals and advanced techniques**.
- Gain experience with **complex joins**, **aggregations**, **subqueries**, and **data relationships**.
- Learn how to extract meaningful **insights from relational data**.

---

## 🔧 Technologies Used

- **SQL** (Standard)
- RDBMS: MySQL / PostgreSQL (Any platform of your choice)
- ERD Visualisation: [Provided in schema image]

---

## 🧠 SQL Questions & Answers (Beginner to Advanced)

> Below are categorized SQL practice questions with clear explanations.

---

### 🟢 Beginner Level

#### **1. List all customers and their corresponding orders**

```sql
SELECT c.customer_id, c.first_name, c.last_name, o.order_id, o.order_date
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id;
