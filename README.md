 
# Sql_Retail_Sales_Analysis

## Project Overview
This project is designed to demonstrate SQL skills and techniques typically used by data analysts to explore, clean, and analyze retail sales data. The project involves setting up a retail sales database, performing exploratory data analysis (EDA), and answering specific business questions through SQL queries.

## Objectives
1.Set up a retail sales database: Create and populate a retail sales database with the provided sales data.

2.Data Cleaning: Identify and remove any records with missing or null values.

3.Exploratory Data Analysis (EDA): Perform basic exploratory data analysis to understand the dataset.

4.Business Analysis: Use SQL to answer specific business questions and derive insights from the sales data.

## 1.Database Setup

 - Database Creation: The project starts by creating a database named sql_project_p1.
 - Table Creation: A table named retail_sales is created to store the sales data. The table structure includes columns for transaction ID, sale date, sale time, customer ID, gender, age, product category, quantity sold, price per unit, cost of goods sold (COGS), and total sale amount.

CREATE TABLE sql_project_p1.retail_sales (
    transactions_id INT PRIMARY KEY,
    sale_date DATE,
    sale_time TIME,
    customer_id INT,
    gender VARCHAR(15),
    age INT,
    category VARCHAR(15),
    quantiy INT,
    price_per_unit FLOAT,
    cogs FLOAT,
    total_sale FLOAT
);



