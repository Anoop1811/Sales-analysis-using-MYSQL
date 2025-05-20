# Q1: Orders shipped via 'Economy' mode with total amount > ₹25,000
SELECT *
FROM sales_data
WHERE Ship_Mode = 'Economy'
  AND Total_Amount > 25000;

🔹 Q2: Technology sales in Ireland after 2020-01-01
SELECT *
FROM sales_data
WHERE Category = 'Technology'
  AND Country = 'Ireland'
  AND Order_Date > '2020-01-01';

# Q3: Top 10 most profitable sales transactions (descending order)

SELECT *
FROM sales_data
ORDER BY Unit_Profit * Sold_Quantity DESC
LIMIT 10;

#Q4: Customers whose names start with 'J' and end with 'n'
SELECT *
FROM sales_data
WHERE Customer_Name LIKE 'J%n';

# Q5: Product names that contain 'Acco'

SELECT DISTINCT Product_Name
FROM sales_data
WHERE Product_Name LIKE '%Acco%';


# Q6: Top 5 cities with the highest total sales amount
  
SELECT City, SUM(Total_Amount) AS Total_Sales
FROM sales_data
GROUP BY City
ORDER BY Total_Sales DESC
LIMIT 5;

# Q7: Total revenue, average unit cost, and total number of orders

SELECT 
    SUM(Total_Amount) AS Total_Revenue,
    AVG(Unit_Cost) AS Average_Unit_Cost,
    COUNT(DISTINCT Order_ID) AS Total_Orders
FROM sales_data;

# Q8: Total sales per product category

SELECT Category, SUM(Total_Amount) AS Total_Sales
FROM sales_data
GROUP BY Category;

Q9: Customers with orders worth more than ₹50,000

SELECT Customer_Name, SUM(Total_Amount) AS Customer_Total
FROM sales_data
GROUP BY Customer_Name
HAVING SUM(Total_Amount) > 50000;

Q10: Top 5 customers by sales revenue using DENSE_RANK()

SELECT Customer_Name, Total_Sales, Rank
FROM (
    SELECT 
        Customer_Name,
        SUM(Total_Amount) AS Total_Sales,
        DENSE_RANK() OVER (ORDER BY SUM(Total_Amount) DESC) AS Rank
    FROM sales_data
    GROUP BY Customer_Name
) ranked_customers
WHERE Rank <= 5;
