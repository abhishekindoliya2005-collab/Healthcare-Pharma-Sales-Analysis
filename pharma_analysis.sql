-- Healthcare / Pharma Sales Analysis
-- Compatible with MySQL 8+

CREATE DATABASE IF NOT EXISTS pharma_analytics;
USE pharma_analytics;

DROP TABLE IF EXISTS pharma_sales;

CREATE TABLE pharma_sales (
    Order_ID VARCHAR(20) PRIMARY KEY,
    Date DATE,
    Month VARCHAR(7),
    Product_ID VARCHAR(10),
    Product_Name VARCHAR(100),
    Category VARCHAR(50),
    Region VARCHAR(30),
    City VARCHAR(50),
    Sales_Representative VARCHAR(100),
    Doctor_ID VARCHAR(20),
    Quantity INT,
    Unit_Price DECIMAL(10,2),
    Discount DECIMAL(5,2),
    Revenue DECIMAL(12,2),
    Profit DECIMAL(12,2),
    Profit_Margin DECIMAL(8,4)
);

-- Import pharma_sales.csv using your MySQL client / Workbench import wizard.

-- 1. Overall KPIs
SELECT
    SUM(Revenue) AS Total_Revenue,
    SUM(Profit) AS Total_Profit,
    SUM(Quantity) AS Total_Units,
    COUNT(DISTINCT Order_ID) AS Total_Orders,
    ROUND(SUM(Revenue) / COUNT(DISTINCT Order_ID), 2) AS Average_Order_Value
FROM pharma_sales;

-- 2. Revenue by product
SELECT Product_Name, Category,
       ROUND(SUM(Revenue),2) AS Revenue,
       SUM(Quantity) AS Units_Sold,
       ROUND(SUM(Profit),2) AS Profit
FROM pharma_sales
GROUP BY Product_Name, Category
ORDER BY Revenue DESC;

-- 3. Revenue by region
SELECT Region,
       ROUND(SUM(Revenue),2) AS Revenue,
       SUM(Quantity) AS Units_Sold,
       COUNT(DISTINCT Order_ID) AS Orders
FROM pharma_sales
GROUP BY Region
ORDER BY Revenue DESC;

-- 4. Monthly revenue trend
SELECT Month,
       ROUND(SUM(Revenue),2) AS Revenue,
       ROUND(SUM(Profit),2) AS Profit,
       SUM(Quantity) AS Units_Sold
FROM pharma_sales
GROUP BY Month
ORDER BY Month;

-- 5. Top 10 doctors by revenue
SELECT Doctor_ID,
       ROUND(SUM(Revenue),2) AS Revenue,
       COUNT(DISTINCT Order_ID) AS Orders
FROM pharma_sales
GROUP BY Doctor_ID
ORDER BY Revenue DESC
LIMIT 10;

-- 6. Sales representative performance
SELECT Sales_Representative,
       ROUND(SUM(Revenue),2) AS Revenue,
       ROUND(SUM(Profit),2) AS Profit,
       COUNT(DISTINCT Order_ID) AS Orders
FROM pharma_sales
GROUP BY Sales_Representative
ORDER BY Revenue DESC;

-- 7. Category performance
SELECT Category,
       ROUND(SUM(Revenue),2) AS Revenue,
       ROUND(SUM(Profit),2) AS Profit,
       SUM(Quantity) AS Units_Sold
FROM pharma_sales
GROUP BY Category
ORDER BY Revenue DESC;

-- 8. Products with below-average revenue
SELECT Product_Name,
       ROUND(SUM(Revenue),2) AS Revenue
FROM pharma_sales
GROUP BY Product_Name
HAVING SUM(Revenue) < (SELECT AVG(product_revenue)
                       FROM (
                           SELECT SUM(Revenue) AS product_revenue
                           FROM pharma_sales
                           GROUP BY Product_Name
                       ) x)
ORDER BY Revenue;

-- 9. Region and category matrix
SELECT Region, Category,
       ROUND(SUM(Revenue),2) AS Revenue
FROM pharma_sales
GROUP BY Region, Category
ORDER BY Region, Revenue DESC;

-- 10. Monthly growth using LAG
WITH monthly AS (
    SELECT Month, SUM(Revenue) AS Revenue
    FROM pharma_sales
    GROUP BY Month
)
SELECT Month,
       ROUND(Revenue,2) AS Revenue,
       ROUND(LAG(Revenue) OVER (ORDER BY Month),2) AS Previous_Month_Revenue,
       ROUND((Revenue - LAG(Revenue) OVER (ORDER BY Month))
             / NULLIF(LAG(Revenue) OVER (ORDER BY Month),0) * 100, 2) AS MoM_Growth_Pct
FROM monthly
ORDER BY Month;

-- 11. Top 3 products in each region
WITH ranked AS (
    SELECT Region, Product_Name,
           SUM(Revenue) AS Revenue,
           DENSE_RANK() OVER (PARTITION BY Region ORDER BY SUM(Revenue) DESC) AS rnk
    FROM pharma_sales
    GROUP BY Region, Product_Name
)
SELECT Region, Product_Name, ROUND(Revenue,2) AS Revenue, rnk
FROM ranked
WHERE rnk <= 3
ORDER BY Region, rnk;

-- 12. Discount impact
SELECT
    CASE
        WHEN Discount = 0 THEN 'No Discount'
        WHEN Discount <= 0.05 THEN 'Low Discount'
        ELSE 'High Discount'
    END AS Discount_Band,
    ROUND(SUM(Revenue),2) AS Revenue,
    ROUND(AVG(Profit_Margin)*100,2) AS Avg_Profit_Margin_Pct
FROM pharma_sales
GROUP BY Discount_Band
ORDER BY Revenue DESC;

-- 13. Repeat doctors
SELECT Doctor_ID,
       COUNT(DISTINCT Order_ID) AS Orders,
       ROUND(SUM(Revenue),2) AS Revenue
FROM pharma_sales
GROUP BY Doctor_ID
HAVING COUNT(DISTINCT Order_ID) >= 10
ORDER BY Revenue DESC;

-- 14. City performance
SELECT Region, City,
       ROUND(SUM(Revenue),2) AS Revenue,
       SUM(Quantity) AS Units
FROM pharma_sales
GROUP BY Region, City
ORDER BY Revenue DESC;

-- 15. Product profitability
SELECT Product_Name,
       ROUND(SUM(Revenue),2) AS Revenue,
       ROUND(SUM(Profit),2) AS Profit,
       ROUND(SUM(Profit)/NULLIF(SUM(Revenue),0)*100,2) AS Profit_Margin_Pct
FROM pharma_sales
GROUP BY Product_Name
ORDER BY Profit DESC;
