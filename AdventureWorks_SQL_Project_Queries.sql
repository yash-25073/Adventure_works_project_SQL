create database Adventureworks;
use Adventureworks;
SELECT * from factinternetsales limit 10;
show tables;
use adventureworks;
RENAME TABLE
`adventureworks_master final updated one csv file`
TO FactInternetSales;
select * from factinternetsales limit 10;
DESCRIBE FactInternetSales;
SELECT COUNT(*) AS Total_Rows
FROM FactInternetSales;

#KPI 1: Total Sales
SELECT
ROUND(SUM(SalesAmount),2) AS Total_Sales
FROM FactInternetSales;

#KPI 2: Total Profit
SELECT
ROUND(SUM(Profit),2) AS Total_Profit
FROM FactInternetSales;

#KPI 3: Total Orders
SELECT
COUNT(SalesOrderNumber) AS Total_Orders
FROM FactInternetSales;

#KPI 4: TOTAL CUSTOMERS
SELECT
COUNT(DISTINCT CustomerKey) AS Total_Customers
FROM FactInternetSales;

#Phase 2: Dashboard Queries

#1. Sales by Year

SELECT
Year,
ROUND(SUM(SalesAmount),2) AS TotalSales
FROM FactInternetSales
GROUP BY Year
ORDER BY Year;

#2. Profit by Year

SELECT
Year,
ROUND(SUM(Profit),2) AS TotalProfit
FROM FactInternetSales
GROUP BY Year
ORDER BY Year;

#3. Quarterly Sales

SELECT
Quarter,
ROUND(SUM(SalesAmount),2) AS QuarterlySales
FROM FactInternetSales
GROUP BY Quarter
ORDER BY Quarter;

#4. Monthly Sales

ALTER TABLE FactInternetSales
CHANGE `Month no` MonthNo INT;

SELECT
MonthNo,
MonthName,
ROUND(SUM(SalesAmount),2) AS MonthlySales
FROM FactInternetSales
GROUP BY MonthNo, MonthName
ORDER BY MonthNo;

#5. Top 10 Products

SELECT
ProductName,
ROUND(SUM(SalesAmount),2) AS Sales
FROM FactInternetSales
GROUP BY ProductName
ORDER BY Sales DESC
LIMIT 10;

#6. Top 10 Customers

ALTER TABLE FactInternetSales
CHANGE `customer_name` customerName text;


SELECT
CustomerName,
ROUND(SUM(SalesAmount),2) AS Sales
FROM FactInternetSales
GROUP BY CustomerName
ORDER BY Sales DESC
LIMIT 10;

#9. Average Order Value

SELECT
ROUND(AVG(SalesAmount),2) AS AverageOrderValue
FROM FactInternetSales;


#10. Highest Selling Product

SELECT
ProductName,
ROUND(SUM(SalesAmount),2) AS Sales
FROM FactInternetSales
GROUP BY ProductName
ORDER BY Sales DESC
LIMIT 1;

#11. Highest Spending Customer

SELECT
CustomerName,
ROUND(SUM(SalesAmount),2) AS Sales
FROM FactInternetSales
GROUP BY CustomerName
ORDER BY Sales DESC
LIMIT 1;



#A. Filtering Queries

-- Sales greater than 1000
SELECT *
FROM FactInternetSales
WHERE SalesAmount > 1000;

-- Orders from 2013
SELECT *
FROM FactInternetSales
WHERE Year = 2013;

#B. Aggregate Functions

SELECT
MAX(SalesAmount) AS HighestSale,
MIN(SalesAmount) AS LowestSale,
AVG(SalesAmount) AS AverageSale
FROM FactInternetSales;

#C. HAVING Clause

SELECT
ProductName,
SUM(SalesAmount) AS Sales
FROM FactInternetSales
GROUP BY ProductName
HAVING SUM(SalesAmount) > 100000;

#E. Date Analysis

SELECT
Year,
COUNT(*) AS Orders
FROM FactInternetSales
GROUP BY Year;

#F. Ranking

SELECT
ProductName,
SUM(SalesAmount) AS Sales,
RANK() OVER(ORDER BY SUM(SalesAmount) DESC) AS ProductRank
FROM FactInternetSales
GROUP BY ProductName;

#G. Top 5 Customers

SELECT
CustomerName,
SUM(SalesAmount) AS Sales
FROM FactInternetSales
GROUP BY CustomerName
ORDER BY Sales DESC
LIMIT 5;

#H. Average Profit by Year

SELECT
Year,
AVG(Profit) AS AverageProfit
FROM FactInternetSales
GROUP BY Year;

#I. Total Sales by Month
SELECT
MonthName,
SUM(SalesAmount) AS Sales
FROM FactInternetSales
GROUP BY MonthName;

#J. Total Profit by Quarter

SELECT
Quarter,
SUM(Profit) AS Profit
FROM FactInternetSales
GROUP BY Quarter;
