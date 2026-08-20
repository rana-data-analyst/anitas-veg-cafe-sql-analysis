# Anita's Veg Cafe — SQL Analysis

## Project Overview

Anita's Veg Cafe is a SQL-based data analysis project focused on understanding customer purchasing behavior, menu performance, and loyalty program activity.

The project analyzes sales data along with menu and loyalty-member information to answer key business questions and generate actionable insights.

## Business Objective

The objective of this project is to help Anita understand:

- Customer spending behavior
- Customer ordering frequency
- Most popular menu items
- Individual customer preferences
- Loyalty member purchasing behavior
- Spending before joining the loyalty program
- Customer loyalty points

## Dataset & Tables

The database contains three tables:

### 1. `sales`

Stores customer-level purchase transactions.

| Column | Description |
|---|---|
| customer_id | Customer identifier |
| order_date | Date of order |
| product_id | Ordered product identifier |

### 2. `menu`

Contains information about the cafe's menu items.

| Column | Description |
|---|---|
| product_id | Product identifier |
| product_name | Name of the dish |
| price | Price of the dish |

### 3. `members`

Contains information about customers who joined the loyalty program.

| Column | Description |
|---|---|
| customer_id | Customer identifier |
| join_date | Loyalty program joining date |

## 🛠️ Tools & Technologies

- PostgreSQL
- SQL
- GitHub

## SQL Concepts Used

This project provides hands-on practice with:

- SELECT & filtering
- JOINs
- GROUP BY & HAVING
- Aggregate functions
- CASE statements
- Window functions
- Date functions
- Subqueries
- Common Table Expressions (CTEs)

##  Business Questions

The analysis answers the following questions:

1. What is the total amount each customer has spent at the cafe?
2. How many distinct days has each customer placed an order?
3. What was the first dish ordered by each customer?
4. Which menu item is the most popular overall?
5. What is the most frequently ordered dish for each customer?
6. After joining the loyalty program, what dish did each member first order?
7. Before joining the loyalty program, what dish did each customer order last?
8. For each member, how many items and how much did they spend before joining?
9. How many loyalty points does each customer earn?
10. How many points did Aarav and Meera have by the end of January?

##  Key Learning Outcomes

Through this project, I practiced applying SQL to a real-world business scenario, including customer analysis, product performance analysis, loyalty-program analysis, joins, aggregations, window functions, and date-based business logic.

##  Project Structure

```text
anitas-veg-cafe-sql-analysis/
│
├── README.md
├── sql/
│   └── anitas_veg_cafe_analysis.sql
│
└── data/
    ├── sales.csv
    ├── menu.csv
    └── members.csv
