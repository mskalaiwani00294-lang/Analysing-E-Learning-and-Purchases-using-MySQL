# 📊 Analysing E-Learning and Purchases using MySQL

> A complete SQL project using MySQL to analyze learner purchases, sales performance, course popularity, and category-level business insights.

---

## 📌 Project Overview

This project focuses on designing and managing a relational MySQL database for an online learning platform.

The analysis helps understand learner purchasing behavior, sales trends, course performance, learner spending, and popular course categories.

---

## 🎯 Objectives

- Design a relational database using MySQL
- Analyze learner purchasing behavior
- Analyze sales and revenue
- Identify popular courses and categories
- Analyze learner spending patterns
- Apply SQL joins and aggregate functions
- Use subqueries and correlated subqueries
- Apply CTE, CASE expressions, NULL handling, and views

---

## 🗂️ Database Structure

The project contains three main tables:

### 👤 Learners

- `learner_id` – Primary Key
- `full_name` – Learner name
- `country` – Country of residence

### 📚 Courses

- `course_id` – Primary Key
- `course_name` – Course title
- `category` – Course category
- `unit_price` – Course price

### 🛒 Purchases

- `purchase_id` – Primary Key
- `learner_id` – Foreign Key
- `course_id` – Foreign Key
- `quantity` – Number of courses purchased
- `purchase_date` – Date of purchase

---

## 🔗 SQL JOIN Analysis

The project uses:

- INNER JOIN
- LEFT JOIN
- RIGHT JOIN

The analysis displays:

- Learner name
- Course name
- Category
- Quantity
- Total amount
- Purchase date

Currency values are formatted to two decimal places and results are sorted by the highest total amount.

---

## 📊 Analytical Queries

### Q1 – Learner Spending

Display each learner's total spending along with their country.

### Q2 – Top 3 Courses

Find the top 3 most purchased courses based on quantity.

### Q3 – Category Performance

Calculate total revenue and number of unique learners for each category.

### Q4 – Multiple Categories

Identify learners who purchased courses from more than one category.

### Q5 – Never Purchased Courses

Identify courses that have never been purchased.

---

## 🔍 Subqueries & Correlated Subqueries

### Q6 – Above Average Spending

Find learners whose total spending is above the average learner spending.

### Q7 – Course Price Comparison

Find courses whose price is higher than any course in the Beginner category.

### Q8 – Country-Level Spending

Find learners whose spending is higher than the average spending in their country.

---

## 🧩 Advanced SQL Analysis

### Q9 – CTE

Calculate total spending per learner and display learners whose spending is above 10,000.

### Q10 – CASE Expression

Classify learners based on their total spending:

- Above 15,000 – High Value
- 8,000–15,000 – Medium Value
- Below 8,000 – Low Value

### Q11 – NULL Handling

Display all courses and replace NULL purchase counts with 0 using `IFNULL()` or `COALESCE()`.

### Q12 – View

Create the view:

`category_performance_view`

The view displays:

- Category
- Total revenue
- Number of purchases
- Average revenue per purchase

---

## 🛠️ Technologies Used

- MySQL
- SQL
- MySQL Workbench

---

## 📚 SQL Concepts Used

- CREATE DATABASE
- CREATE TABLE
- PRIMARY KEY
- FOREIGN KEY
- INSERT
- SELECT
- INNER JOIN
- LEFT JOIN
- RIGHT JOIN
- GROUP BY
- ORDER BY
- Aggregate Functions
- Subqueries
- Correlated Subqueries
- CTE
- CASE Expression
- IFNULL / COALESCE
- CREATE VIEW

---

## 📈 Key Insights

The analysis helps identify:

- Learner spending behavior
- Sales and revenue trends
- Best-performing courses
- Popular course categories
- High-value learners
- Courses with no purchases
- Category-level performance

---

## 👩‍💻 Author

**Kalaivani**

> Data Analytics / SQL Project  
> Tool: MySQL Workbench
