# Walmart Sales Data Analysis


## Project Description

This SQL project aims to utilize the Walmart Sales data to gain insights into various aspects, including top-performing branches and products, sales trends across different products, and customer behavior. The primary objective is to analyze the data using SQL queries and identify opportunities for improving and optimizing sales strategies.

## Project Goals

Identify top-performing branches: Utilize SQL queries to analyze sales data and determine the branches that consistently achieve high sales volumes. Identify key factors contributing to their success, such as location, customer demographics, or specific product offerings.

Analyze best-selling products: Explore the data to identify the best-selling products in Walmart stores. Use SQL queries to determine the products with the highest sales volumes or revenues. Analyze factors like product category, price range, or promotional activities to understand the drivers of their success.

Study sales trends: Use SQL queries to analyze historical sales data and uncover trends and patterns associated with different product categories. Identify seasonal variations, sales spikes, or other factors that impact sales performance. Visualize the trends using charts or graphs to aid in understanding and decision-making.

Understand customer behavior: Analyze customer purchase patterns and behaviors by querying the data. Extract insights into customer demographics, purchase frequency, preferred products, or shopping habits. Use SQL queries to segment customers and identify opportunities for targeted marketing and personalized promotions.

Improve sales strategies: Based on the analysis of the Walmart Sales data, propose actionable recommendations for enhancing sales strategies. Utilize SQL queries to identify areas for optimization, such as inventory management, pricing strategies, or promotional campaigns. Provide data-backed insights to help optimize sales and drive business growth.

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


## Approach Used

**Data Understanding**

Familiarize myself with the dataset's structure, including the available columns, data types, and any provided documentation or data dictionary.
Gained an understanding of the specific business questions or objectives that need to be addressed using the dataset.

**Data Cleaning and Preprocessing**
my role in data wrangling and cleaning involved several tasks to ensure the data was in a usable and reliable format. Here are some key steps I took:

##### 1. ## Data Assessment: I assessed the quality and structure of the data to identify any issues or inconsistencies that needed to be addressed. This involved checking for missing values, outliers, inconsistent formatting, or data entry errors.

Data Cleaning: I performed data cleaning operations to address the identified issues. This included tasks such as:

- Handling Missing Values: I employed techniques like imputation or deletion, depending on the nature of the missing data.
- Removing Duplicates: I eliminated any duplicate records or entries to ensure data integrity.
- Standardizing Formats: I standardized the formats of data fields, such as dates, currencies, or units, to ensure consistency.
- Correcting Errors: I resolved data entry errors or inconsistencies by verifying against trusted sources or applying data transformation techniques.
  Data Transformation: I conducted data transformations to derive meaningful insights or facilitate analysis. This involved tasks like:

Aggregating Data: I aggregated data at different levels, such as daily, monthly, or by categories, to enable analysis and reporting.
Creating Derived Variables: I calculated new variables or features based on existing data, which could include ratios, averages, or other derived metrics.
Data Encoding: I encoded categorical variables into numerical representations, such as one-hot encoding or label encoding, to enable statistical analysis.
Data Integration: If working with multiple data sources, I merged or joined datasets based on common identifiers or keys to combine relevant information into a unified dataset.

Data Validation: After cleaning and transforming the data, I validated the results to ensure accuracy and integrity. This involved cross-checking with external sources, performing data quality checks, and validating against expected results.

2. **Feature Engineering:** This will help use generate some new columns from existing ones.

> 1. Add a new column named `time_of_day` to give insight of sales in the Morning, Afternoon and Evening. This will help answer the question on which part of the day most sales are made.

> 2. Add a new column named `day_name` that contains the extracted days of the week on which the given transaction took place (Mon, Tue, Wed, Thur, Fri). This will help answer the question on which week of the day each branch is busiest.

> 3. Add a new column named `month_name` that contains the extracted months of the year on which the given transaction took place (Jan, Feb, Mar). Help determine which month of the year has the most sales and profit.
**Feature Engineering:**

Create new variables or features from existing data that could provide additional insights, such as calculating average order value, customer lifetime value, or conversion rates.
Transform variables as needed, such as converting categorical variables into numerical representations.

2. **Exploratory Data Analysis (EDA):** Exploratory data analysis is done to answer the listed questions and aims of this project.

#### Product Analysis:

- Utilized SQL to conduct in-depth analysis of product lines to identify top-performing and underperforming segments.
- Identified areas for improvement within each product line.

#### Sales Analysis:

- Leveraged SQL to analyze sales trends, providing insights into product performance and effectiveness of sales strategies.
- Implemented SQL queries to measure the impact of different sales strategies and recommend modifications for increased sales.

#### Customer Analysis:

- Uncovered customer segments and their purchasing patterns.
- Utilized SQL queries to extract actionable insights, enabling targeted marketing efforts and optimizing customer satisfaction.

3. **Conclusion:**

## Business Questions To Answer

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
