USE footlocker_db;

CREATE TABLE retail_data (
    order_id INT PRIMARY KEY,
    product_id INT,
    category VARCHAR(50),
    region VARCHAR(50),
    sales_amount DECIMAL(10,2),
    quantity INT,
    customer_age INT,
    customer_gender VARCHAR(20),
    order_date DATE
);

-- Save the results to a csv file -- 
SELECT * 
INTO OUTFILE 'C:\Users\mhmja\Downloads\retail_data.csv'
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
FROM retail_data;