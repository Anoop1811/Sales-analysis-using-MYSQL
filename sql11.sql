use yisu;

SELECT Order_Date, City, Ship_Mode, Total_Amount FROM anoop_sales
ORDER BY Total_Amount DESC;

SELECT anoop_sales.Order_ID, anoop_sales.Product_Name, anoop_sales.Total_Amount
FROM anoop_sales
ORDER BY Total_Amount DESC
LIMIT 4;

select sum(total_amount) from anoop_sales group by region;

select distinct(Region) as unique_region from anoop_sales;
use yisu;

#1
SELECT *
FROM anoop_sales
WHERE Ship_Mode = 'Economy'
  AND Total_Amount > 25000;
  
  #2
SELECT *
FROM anoop_sales
WHERE Category = 'Technology'
  AND Country = 'Ireland'
  AND Order_Date > '2020-01-01';
  
  #3
SELECT *
FROM anoop_sales
ORDER BY Unit_Profit * Sold_Quantity DESC
LIMIT 10;

#4
SELECT *
FROM anoop_sales
WHERE Customer_Name LIKE 'J%n';

#5
SELECT DISTINCT Product_Name
FROM anoop_sales
WHERE Product_Name LIKE '%Acco%';

#6
SELECT City, SUM(Total_Amount) AS Total_Sales
FROM anoop_sales
GROUP BY City
ORDER BY Total_Sales DESC
LIMIT 5;

#7
SELECT 
    SUM(Total_Amount) AS Total_Revenue,
    AVG(Unit_Cost) AS Average_Unit_Cost,
    COUNT(DISTINCT Order_ID) AS Total_Orders
FROM anoop_sales;

#8
SELECT Category, SUM(Total_Amount) AS Total_Sales
FROM anoop_sales
GROUP BY Category;

#9
SELECT Customer_Name, SUM(Total_Amount) AS Customer_Total
FROM anoop_sales
GROUP BY Customer_Name
HAVING SUM(Total_Amount) > 50000;

#10
SELECT Customer_Name, Total_Sales, Rank
FROM (
    SELECT 
        Customer_Name,
        SUM(Total_Amount) AS Total_Sales,
        DENSE_RANK() OVER (ORDER BY SUM(Total_Amount) DESC) AS Rank
    FROM anoop_sales
    GROUP BY Customer_Name
) ranked_customers
WHERE Rank <= 5;








