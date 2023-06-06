
/*
  1. First I imported Walmart Sales Excel sheet into MS SQL Server.
  2. Then added the following constraints to the table.
*/

USE WalmartSales

-- Adding primary key constraint on invoice_ID column
ALTER TABLE sales
ADD CONSTRAINT PK_sales PRIMARY KEY (invoice_ID);

-- Altering invoice_ID column
ALTER TABLE sales
ALTER COLUMN invoice_ID VARCHAR(30) NOT NULL;

-- Altering branch column
ALTER TABLE sales
ALTER COLUMN branch VARCHAR(5) NOT NULL;

-- Altering city column
ALTER TABLE sales
ALTER COLUMN city VARCHAR(30) NOT NULL;


-- Altering customer_type column
ALTER TABLE sales
ALTER COLUMN customer_type VARCHAR(30) NOT NULL;


-- Altering gender column
ALTER TABLE sales
ALTER COLUMN gender VARCHAR(10) NOT NULL;

-- Altering product_line column
ALTER TABLE sales
ALTER COLUMN product_line VARCHAR(100) NOT NULL;

-- Altering unit_price column
ALTER TABLE sales
ALTER COLUMN unit_price DECIMAL(10,2) NOT NULL;

-- Altering quantity column
ALTER TABLE sales
ALTER COLUMN quantity INT NOT NULL;

-- Altering VAT column
ALTER TABLE sales
ALTER COLUMN VAT FLOAT NOT NULL;

-- Altering Revenue column
ALTER TABLE sales
ALTER COLUMN Revenue DECIMAL(12,4) NOT NULL;

-- Altering date column
ALTER TABLE sales
ALTER COLUMN date DATETIME NOT NULL;

-- Altering time column
ALTER TABLE sales
ALTER COLUMN time TIME NOT NULL;

-- Altering payment_method column
ALTER TABLE sales
ALTER COLUMN payment_method VARCHAR(15) NOT NULL;

-- Altering cogs column
ALTER TABLE sales
ALTER COLUMN cogs DECIMAL(10,2) NOT NULL;

-- Altering Profit_Margin column
ALTER TABLE sales
ALTER COLUMN Profit_Margin FLOAT NOT NULL;

-- Altering Profit column
ALTER TABLE sales
ALTER COLUMN Profit DECIMAL(12,4) NOT NULL;

-- Altering rating column
ALTER TABLE sales
ALTER COLUMN rating FLOAT NOT NULL;



-- So, let's perform data cleaning 
SELECT *
FROM sales; 

-- Let's add the time_of_day column
SELECT
	time,
	(CASE
		WHEN time BETWEEN '00:00:00' AND '12:00:00' THEN 'Morning'
        WHEN time BETWEEN '12:01:00' AND '16:00:00' THEN 'Afternoon'
        ELSE 'Evening'
    END) AS time_of_day
FROM sales;


ALTER TABLE sales ADD time_of_day VARCHAR(20);


UPDATE sales
SET time_of_day = (
	CASE
		WHEN time BETWEEN '00:00:00' AND '12:00:00' THEN 'Morning'
        WHEN time BETWEEN '12:01:00' AND '16:00:00' THEN 'Afternoon'
        ELSE 'Evening'
    END
);


-- Add day_name column
SELECT
	date,
	FORMAT(date, 'dddd') as day_name
FROM sales;

ALTER TABLE sales ADD day_name VARCHAR(10);

UPDATE sales
SET day_name = FORMAT(date, 'dddd');



-- Add month_name column
SELECT
	date,
	DATENAME(MONTH, date) AS month_name
FROM sales;

ALTER TABLE sales ADD month_name VARCHAR(10);

UPDATE sales
SET month_name = DATENAME(MONTH, date);


-- --------------------------------------------------------------------
-- ---------------------------- Generic ------------------------------
-- --------------------------------------------------------------------
-- How many unique cities does the data have?
SELECT 
	DISTINCT city
FROM sales;

-- How many unique branch does the data have?
SELECT 
	DISTINCT branch 
FROM sales;

-- In which city is each branch?
SELECT
	DISTINCT city, 
	branch
FROM sales;

-- --------------------------------------------------------------------
-- ---------------------------- Product -------------------------------
-- --------------------------------------------------------------------

-- Find the number of unique product lines in the data
SELECT 
	DISTINCT product_line
FROM sales;


-- Which product lines have the highest sales?
SELECT
	product_line,
	SUM(quantity) as total_qty
FROM sales
GROUP BY product_line
ORDER BY total_qty DESC;

--Which product lines have the lowest sales?
SELECT
	product_line,
	SUM(quantity) as qty
FROM sales
GROUP BY product_line
ORDER BY qty ASC;

-- What is the total revenue by month?
SELECT
	month_name AS month,
	SUM(revenue) AS total_revenue
FROM sales
GROUP BY month_name 
ORDER BY total_revenue DESC;


-- What month had the largest COGS (Cost of Goods Sold)?
SELECT TOP 1
	month_name AS month,
	SUM(cogs) AS total_cogs
FROM sales
GROUP BY month_name 
ORDER BY total_cogs DESC;


-- What product line has the largest revenue?
SELECT TOP 1
	product_line,
	SUM(revenue) as total_revenue
FROM sales
GROUP BY product_line
ORDER BY total_revenue DESC;

-- What is the city and branch with the largest revenue?
SELECT TOP 1
	branch,
	city,
	SUM(revenue) AS total_revenue
FROM sales
GROUP BY city, branch 
ORDER BY total_revenue;

-- What product line had the largest average VAT(Value Added Tax)?
SELECT
	product_line,
	AVG(VAT) as avg_tax
FROM sales
GROUP BY product_line
ORDER BY avg_tax DESC;


-- Let's Fetch each product line and add a column showing "Good" or "Bad" based on average sales - Good if its greater than average sales.
SELECT 
	AVG(quantity) AS avg_qty
FROM sales;

SELECT
	product_line,
	CASE
		WHEN AVG(quantity) > 6 THEN 'Good'
        ELSE 'Bad'
    END AS remark
FROM sales
GROUP BY product_line;


-- Which branch sold more products than average product sold?
SELECT 
	branch, 
    SUM(quantity) AS qnty
FROM sales
GROUP BY branch
HAVING SUM(quantity) > (SELECT AVG(quantity) FROM sales);


-- What is the most common product line by gender?
SELECT
	gender,
    product_line,
    COUNT(gender) AS no_of_gender
FROM sales
GROUP BY gender, product_line
ORDER BY no_of_gender DESC;

-- What is the average rating of each product line?
SELECT
	product_line,
	ROUND(AVG(rating), 3) as avg_rating 
FROM sales
GROUP BY product_line
ORDER BY avg_rating DESC;


-- --------------------------------------------------------------------
-- -------------------------- Customers -------------------------------
-- --------------------------------------------------------------------

-- How many unique customer types does the data have?
SELECT
	DISTINCT customer_type
FROM sales;

-- How many unique payment methods does the data have?
SELECT
	DISTINCT payment_method
FROM sales;


-- What is the most common customer type?
SELECT
	customer_type,
	count(*) as no_of_customers
FROM sales
GROUP BY customer_type
ORDER BY no_of_customers DESC;

-- Which customer type buys the most?
SELECT
	customer_type,
    COUNT(*) as no_of_customers
FROM sales
GROUP BY customer_type;

-- Which gender is buying the most?
SELECT
	gender,
	COUNT(*) as no_of_customers
FROM sales
GROUP BY gender
ORDER BY no_of_customers DESC;


-- What is the gender distribution per branch?

SELECT
	gender,
	COUNT(Gender) as no_of_gender
FROM sales
WHERE branch = 'A'
GROUP BY gender
ORDER BY no_of_gender DESC;


SELECT
	gender,
	COUNT(Gender) as no_of_gender
FROM sales
WHERE branch = 'B'
GROUP BY gender
ORDER BY no_of_gender DESC;


SELECT
	gender,
	COUNT(Gender) as no_of_gender
FROM sales
WHERE branch = 'C'
GROUP BY gender
ORDER BY no_of_gender DESC;

-- Not a big difference, I don't think number of gender has an effect on the sales per branch.

-- Which time of the day do customers give most average ratings?
SELECT
	time_of_day,
	AVG(rating) AS avg_rating
FROM sales
GROUP BY time_of_day
ORDER BY avg_rating DESC;

-- Looks like time of the day does not really affect the rating, its almost same average rating each time of the day.


-- Which time of the day do customers give most ratings per branch?
--Branch A
SELECT
	time_of_day,
	ROUND(AVG(rating), 3) AS avg_rating
FROM sales
WHERE branch = 'A'
GROUP BY time_of_day
ORDER BY avg_rating DESC;

-- Branch B
SELECT
	time_of_day,
	ROUND(AVG(rating), 3) AS avg_rating
FROM sales
WHERE branch = 'B'
GROUP BY time_of_day
ORDER BY avg_rating DESC;

--Branch C
SELECT
	time_of_day,
	ROUND(AVG(rating), 3) AS avg_rating
FROM sales
WHERE branch = 'C'
GROUP BY time_of_day
ORDER BY avg_rating DESC;
-- Branch A and C are doing well in ratings, branch B needs to do a little more to get better ratings.


-- Which days of the week have the best avgerage ratings?
SELECT
	day_name,
	ROUND(AVG(rating), 3) AS avg_rating
FROM sales
GROUP BY day_name 
ORDER BY avg_rating DESC;
-- Monday, Friday and Sunday are the top best days for good ratings, Why?!
--Let's see how many transactions are made on these days?

SELECT day_name, count(Invoice_ID) AS no_of_transactions
FROM sales
WHERE day_name IN ('Monday', 'Friday', 'Sunday')
GROUP BY  day_name
ORDER BY no_of_transactions;

--What is the total transcations in each day of the week?
SELECT 
	day_name,
	COUNT(Invoice_ID) as total_transcations
FROM sales
GROUP BY day_name
ORDER BY total_transcations DESC;

-- How many transactions in each day of the week in branch 'C'?
SELECT 
	day_name,
	COUNT(Invoice_ID) as total_transcations
FROM sales
WHERE branch = 'C'
GROUP BY day_name
ORDER BY total_transcations DESC;


-- How many transactions in each day of the week in branch 'A'?
SELECT 
	day_name,
	COUNT(Invoice_ID) as total_transcations
FROM sales
WHERE branch = 'A'
GROUP BY day_name
ORDER BY total_transcations DESC;

-- How many transactions in each day of the week in branch 'B'?
SELECT 
	day_name,
	COUNT(Invoice_ID) as total_transcations
FROM sales
WHERE branch = 'B'
GROUP BY day_name
ORDER BY total_transcations DESC;

-- --------------------------------------------------------------------
-- ---------------------------- Sales ---------------------------------
-- --------------------------------------------------------------------

-- What is the number of sales made in each time of the day per weekday? 
SELECT
	time_of_day,
	COUNT(*) AS total_transactions
FROM sales
WHERE  day_name = 'Sunday' 
GROUP BY time_of_day 
ORDER BY total_transactions DESC;


SELECT
	time_of_day,
	COUNT(*) AS total_transactions
FROM sales
WHERE  day_name IN  ('Sunday', 'Saturday') 
GROUP BY time_of_day 
ORDER BY total_transactions DESC;
-- Evenings have the most sales, the stores are filled during the evening hours.

-- Which of the customer types brings the most revenue?
SELECT
	customer_type,
	SUM(Revenue) AS total_revenue
FROM sales
GROUP BY customer_type
ORDER BY total_revenue;

-- What is the second highest revenue in sales?
select max(revenue) from sales where revenue not in (select max(revenue) from sales);

-- Which city has the largest tax/VAT percentage?
SELECT
	city,
    ROUND(AVG(VAT), 2) AS avg_tax_pct
FROM sales
GROUP BY city 
ORDER BY avg_tax_pct DESC;

-- Which customer type pays the most in VAT?
SELECT
	customer_type,
	AVG(VAT) AS total_tax
FROM sales
GROUP BY customer_type
ORDER BY total_tax DESC;