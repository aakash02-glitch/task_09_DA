-- Creating DataBase
CREATE DATABASE onlinesales;
USE onlinesales;

-- Table Structure 
-- 1. Order Table 
CREATE TABLE Orders (
    OrderID VARCHAR(20) PRIMARY KEY,
    OrderDate DATE,
    CustomerName VARCHAR(100),
    State VARCHAR(100),
    City VARCHAR(100)
);
-- 2. Details Table 
CREATE TABLE Details (
    DetailID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID VARCHAR(20),
    Amount INT,
    Profit INT,
    Quantity INT,
    Category VARCHAR(50),
    SubCategory VARCHAR(50),
    PaymentMode VARCHAR(50),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Using: EXTRACT(YEAR), EXTRACT(MONTH), SUM(amount), COUNT(DISTINCT order_id), GROUP BY, ORDER BY
SELECT
    EXTRACT(YEAR FROM o.OrderDate) AS Year,
    EXTRACT(MONTH FROM o.OrderDate) AS Month,
    SUM(d.Amount) AS TotalRevenue,
    COUNT(DISTINCT o.OrderID) AS TotalOrders
FROM Orders o
JOIN Details d ON o.OrderID = d.OrderID
GROUP BY Year, Month
ORDER BY Year, Month;

-- Filter for a Specific Year
SELECT
    EXTRACT(MONTH FROM o.OrderDate) AS Month,
    SUM(d.Amount) AS TotalRevenue,
    COUNT(DISTINCT o.OrderID) AS TotalOrders
FROM Orders o
JOIN Details d ON o.OrderID = d.OrderID
WHERE EXTRACT(YEAR FROM o.OrderDate) = 2018
GROUP BY Month
ORDER BY Month;

-- Format Output as YYYY-MM
SELECT
    DATE_FORMAT(o.OrderDate, '%Y-%m') AS MonthYear,
    SUM(d.Amount) AS Revenue,
    COUNT(DISTINCT o.OrderID) AS Orders
FROM Orders o
JOIN Details d ON o.OrderID = d.OrderID
GROUP BY MonthYear
ORDER BY MonthYear;

-- Find Top Performing Months
SELECT
    DATE_FORMAT(o.OrderDate, '%Y-%m') AS MonthYear,
    SUM(d.Amount) AS TotalRevenue
FROM Orders o
JOIN Details d ON o.OrderID = d.OrderID
GROUP BY MonthYear
ORDER BY TotalRevenue DESC
LIMIT 5;

-- Profit + Revenue Monthly Trend
SELECT
    DATE_FORMAT(o.OrderDate, '%Y-%m') AS MonthYear,
    SUM(d.Amount) AS Revenue,
    SUM(d.Profit) AS Profit,
    COUNT(DISTINCT o.OrderID) AS Orders
FROM Orders o
JOIN Details d ON o.OrderID = d.OrderID
GROUP BY MonthYear
ORDER BY MonthYear;





