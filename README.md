# SQL Time-Based Sales Analysis

## 📌 Project Overview

This project performs a comprehensive time-based analysis of sales data using SQL. The objective is to identify monthly revenue trends, order volume patterns, and peak sales periods using efficient SQL aggregation techniques.

## 🗂 Database Structure

The project uses two related tables:

### **Orders Table**

* OrderID
* OrderDate
* CustomerName
* State
* City

### **Details Table**

* DetailID
* OrderID
* Amount
* Profit
* Quantity
* Category
* SubCategory
* PaymentMode

The tables are connected through **OrderID** using a foreign key relationship.

## 🛠 SQL Techniques Used

* `EXTRACT(YEAR FROM ...)` and `EXTRACT(MONTH FROM ...)` for time-based grouping
* `SUM(Amount)` for monthly revenue
* `COUNT(DISTINCT OrderID)` for order volume
* `GROUP BY Year, Month` to aggregate results
* `ORDER BY` for chronological sorting
* `LIMIT` and `ORDER BY DESC` to identify top-performing months
* `DATE_FORMAT` for readable Month-Year output

## 📈 Analysis Performed

* Monthly revenue and order count analysis
* Year-specific filtering (e.g., 2018)
* Detection of peak sales months
* Trend evaluation to understand customer buying patterns

## 📊 Key Insights

* Clear revenue and order-volume fluctuations across months
* Identification of high-performing months
* Observable seasonality in customer purchase behavior
* Electronics and Furniture frequently appear in top sales periods

## 📁 Files Included

* SQL scripts for database creation
* Table schema
* Aggregation and trend analysis queries
* Peak-month identification query

## 🚀 How to Use

1. Import or create the database schema.
2. Load the Orders and Details tables.
3. Run the SQL queries provided in the scripts folder.
4. Review the output to analyze month-over-month sales performance.

## 📝 Conclusion

This project demonstrates how SQL can be used to extract meaningful time-based insights from sales data. By leveraging aggregation and date-formatted grouping, businesses can identify demand cycles, optimize planning, and make data-driven decisions.
