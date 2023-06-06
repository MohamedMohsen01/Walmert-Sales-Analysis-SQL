# Walmart Sales Data Analysis


## Project Description

This SQL project aims to utilize the Walmart Sales data to gain insights into various aspects, including top-performing branches and products, sales trends across different products, and customer behavior. The primary objective is to analyze the data using SQL queries and identify opportunities for improving and optimizing sales strategies.

## Data Dictionary

This dataset contains sales transactions from three different branches of Walmart, respectively located in Mandalay, Yangon and Naypyitaw. The data contains 17 columns and 1000 rows:

| Column                  | Description                             | Data Type      |
| :---------------------- | :-------------------------------------- | :------------- |
| invoice_id              | Invoice of the sales made               | VARCHAR(30)    |
| branch                  | Branch at which sales were made         | VARCHAR(5)     |
| city                    | The location of the branch              | VARCHAR(30)    |
| customer_type           | The type of the customer                | VARCHAR(30)    |
| gender                  | Gender of the customer making purchase  | VARCHAR(10)    |
| product_line            | set of related products                 | VARCHAR(100)   |
| unit_price              | The price of each product               | DECIMAL(10, 2) |
| quantity                | The amount of the product sold          | INT            |
| VAT                     | The amount of tax on the purchase       | FLOAT(6, 4)    |
| Revenue                 | The total cost of the purchase (sales)  | DECIMAL(10, 2) |
| date                    | The date on which the purchase was made | DATETIME       |
| time                    | The time at which the purchase was made | TIME           |
| payment_method          | The total amount paid                   | DECIMAL(10, 2) |
| cogs                    | Cost Of Goods sold                      | DECIMAL(10, 2) |
| Profit                  | Net Income                              | DECIMAL(10, 2) |
| Profit Margin           | percentage of Profit                    | FLOAT(11, 9)   |
| rating                  | Rating                                  | FLOAT(2, 1)    |


## Methodology 

**Data Understanding:**

Familiarized with dataset structure, columns, data types, and data dictionary.
Identified specific business questions or objectives.

**Data Assessment:**

Evaluated data quality and structure for issues like missing values, outliers, and formatting inconsistencies.

**Data Cleaning and Preprocessing:**

Conducted data wrangling tasks to ensure reliable and usable data:
Handled missing data using imputation or deletion.
Removed duplicate records for data integrity.
Standardized data field formats for consistency.
Data Transformation:

Performed meaningful data transformations for analysis:
Aggregated data at different levels (e.g., weekly, yearly, by categories) using aggregation functions like SUM, MIN, MAX, COUNT, AVG.
Data Integration:

Validated cleaned and transformed data for accuracy and integrity.
Merged and joined datasets from multiple sources based on common identifiers or keys to create a unified dataset.

2. **Feature Engineering:** 

 > - Created new variables and features from existing data that provided additional insights, such as:
 > - created a column called `time_of_day` to capture sales patterns in the Morning, Afternoon, and Evening. This information will help determine the peak sales        periods during the day.

 > - created a column named `day_name`to extract the specific day of the week when each transaction occurred (Mon, Tue, Wed, Thur, Fri). This data will aid in understanding the busiest days for each branch.

 > - created a column named `month_name` to extract the month of the year for each transaction (Jan, Feb, Mar). This data will assist in identifying the months with the highest sales and profitability.



## Exploratory Data Analysis (EDA): 
Some of the business questions I've answered based on the data:

### Generic Question
1. How many unique cities does the data have?
2. In which city is each branch?

### Product
1. How many unique product lines does the data have?
2. What is the most common payment method?
3. What is the most selling product line?
4. What is the total revenue by month?
5. What month had the largest COGS?
6. What product line had the largest revenue?
5. What is the city with the largest revenue?
6. What product line had the largest VAT?
7. Fetch each product line and add a column to those product line showing "Good", "Bad". Good if its greater than average sales
8. Which branch sold more products than average product sold?
9. What is the most common product line by gender?
12. What is the average rating of each product line?

### Sales

1. Number of sales made in each time of the day per weekday
2. Which of the customer types brings the most revenue?
3. Which city has the largest tax percent/ VAT (**Value Added Tax**)?
4. Which customer type pays the most in VAT?

### Customer

1. How many unique customer types does the data have?
2. How many unique payment methods does the data have?
3. What is the most common customer type?
4. Which customer type buys the most?
5. What is the gender of most of the customers?
6. What is the gender distribution per branch?
7. Which time of the day do customers give most ratings?
8. Which time of the day do customers give most ratings per branch?
9. Which day fo the week has the best avg ratings?
10. Which day of the week has the best average ratings per branch?

## Analysis Results

**Product Analysis:**

- Utilized SQL to conduct in-depth analysis of product lines to identify top-performing and underperforming segments.
- Identified areas for improvement within each product line.

**Sales Analysis:**

- Leveraged SQL to analyze sales trends, providing insights into product performance and effectiveness of sales strategies.
- Implemented SQL queries to measure the impact of different sales strategies and recommend modifications for increased sales.

**Customer Analysis:**

- Uncovered customer segments and their purchasing patterns.
- Utilized SQL queries to extract actionable insights, enabling targeted marketing efforts and optimizing customer satisfaction.


## Revenue And Profit Calculations

$ COGS = unitsPrice * quantity $

$ VAT = 5\% * COGS $

$VAT$ is added to the $COGS$ and this is what is billed to the customer.

$ total(gross_sales) = VAT + COGS $

$ grossProfit(grossIncome) = total(gross_sales) - COGS $

**Gross Margin** is gross profit expressed in percentage of the total(gross profit/revenue)

$ \text{Gross Margin} = \frac{\text{gross income}}{\text{total revenue}} $

<u>**Example with the first row in our DB:**</u>

**Data given:**

- $ \text{Unite Price} = 45.79 $
- $ \text{Quantity} = 7 $

$ COGS = 45.79 * 7 = 320.53 $

$ \text{VAT} = 5\% * COGS\\= 5\%  320.53 = 16.0265 $

$ total = VAT + COGS\\= 16.0265 + 320.53 = $336.5565$

$ \text{Gross Margin Percentage} = \frac{\text{gross income}}{\text{total revenue}}\\=\frac{16.0265}{336.5565} = 0.047619\\\approx 4.7619\% $

## Code

For the rest of the code, check the [SQL_queries.sql](https://github.com/Princekrampah/WalmartSalesAnalysis/blob/master/SQL_queries.sql) file

```sql
-- Create database
CREATE DATABASE IF NOT EXISTS walmartSales;

-- Create table
CREATE TABLE IF NOT EXISTS sales(
	invoice_id VARCHAR(30) NOT NULL PRIMARY KEY,
    branch VARCHAR(5) NOT NULL,
    city VARCHAR(30) NOT NULL,
    customer_type VARCHAR(30) NOT NULL,
    gender VARCHAR(30) NOT NULL,
    product_line VARCHAR(100) NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    quantity INT NOT NULL,
    tax_pct FLOAT(6,4) NOT NULL,
    total DECIMAL(12, 4) NOT NULL,
    date DATETIME NOT NULL,
    time TIME NOT NULL,
    payment VARCHAR(15) NOT NULL,
    cogs DECIMAL(10,2) NOT NULL,
    gross_margin_pct FLOAT(11,9),
    gross_income DECIMAL(12, 4),
    rating FLOAT(2, 1)
);
```
