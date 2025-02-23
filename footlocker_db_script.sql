SELECT * FROM retail_data_updated LIMIT 10;

-- Check for missing values
SELECT *
FROM retail_data_updated
WHERE order_id IS NULL
	OR product_id IS NULL
    OR sales_amount IS NULL
    OR quantity IS NULL;

-- No missing values --

-- Aggregate sales by region
SELECT region, SUM(sales_amount) AS total_sales
FROM retail_data_updated
GROUP BY region
ORDER BY total_sales DESC;

-- North region had the most total sales with almost $763,000, followed by West region with almost $720,000. Then East and South as last with less than $700,000 --

-- Identify top-selling products
SELECT product_id, COUNT(*) AS total_orders, SUM(sales_amount) AS total_sales
FROM retail_data_updated
GROUP BY product_id
ORDER BY total_orders DESC
LIMIT 10;

-- Product_id 1016 and 1086 both had 19 total orders followed by product id 1106 and 1007 with 18 total orders --

-- Analyze sales trends over time
SELECT DATE_FORMAT(order_date, '%Y-%m-01') AS month,
       SUM(sales_amount) AS monthly_sales
FROM retail_data_updated
GROUP BY month
ORDER BY month;

-- Based on the results, it shows that we had $562,000 in monthly sales for the month of January then dropped down to $485,000 in February --

-- Analyze customer demographics
SELECT customer_gender, AVG(customer_age) AS avg_age, SUM(sales_amount) AS total_sales
FROM retail_data_updated
GROUP BY customer_gender;

-- The female demographics with the highest total sales of $989,000 followed by male demographics with $935,000, then non-binary with $920,000 --

-- Identify overstocked products (products with low sales but high inventory
SELECT product_id, SUM(quantity) AS total_quantity, SUM(sales_amount) AS total_sales
FROM retail_data_updated
GROUP BY product_id
HAVING SUM(sales_amount) < 10000 AND SUM(quantity) > 50;

-- This shows that product_id 1030 is overstocked while not making enough money --


SELECT * 
INTO OUTFILE 'D:\\Python\\Data Analysis Projects\\Foot Locker Data-Driven Insights\\retail_data.csv'
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
FROM retail_data;



