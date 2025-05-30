
1.Write a SQL query to retrieve all columns for sales made on '2022-11-05:

select * from sql_project_p1.retail_sales
where sale_date ='2022-11-05';

2.Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022:

SELECT 
    * FROM
    sql_project_p1.retail_sales WHERE
    category = 'clothing'
        AND EXTRACT(YEAR_MONTH FROM sale_date) = '2022-11'
        AND quantiy >= 4;
        
3. Write a SQL query to calculate the total sales (total_sale) for each category.:
select category,sum(total_sale)
from sql_project_p1.retail_sales
group by category;

4. Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.:
select round(avg(age),0)
from sql_project_p1.retail_sales
where category='Beauty';

5. Write a SQL query to find all transactions where the total_sale is greater than 1000.:  
SELECT 
    *
FROM
    sql_project_p1.retail_sales
WHERE
    total_sale > 1000;   

6. Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.:
SELECT 
    category,
    gender,
    COUNT(transactions_id) AS Total_transactions
FROM
    sql_project_p1.retail_sales
GROUP BY gender , category;
   
7. Write a SQL query to calculate the average sale for each month. Find out best selling month in each year:
select 
sale_month,
sale_year,
average_sales
from
(SELECT 
    MONTH(sale_date) AS sale_month,
    year(sale_date) as sale_year,
    ROUND(AVG(total_sale), 0) AS average_sales,
    rank() over (partition by year(sale_date) order by AVG(total_sale) desc) as best_selling
FROM
    sql_project_p1.retail_sales
GROUP BY sale_month,sale_year)as t1
where best_selling='1';
   
--8. Write a SQL query to find the top 5 customers based on the highest total sales.
SELECT 
    customer_id, SUM(total_sale) AS total_sales
FROM
    sql_project_p1.retail_sales
GROUP BY 1
ORDER BY 2 DESC;

9. Write a SQL query to find the number of unique customers who purchased items from each category.
select  count(distinct customer_id),category  
from sql_project_p1.retail_sales
group by category;

10. Write a SQL query to create each shift and number of orders (Example Morning <12, Afternoon Between 12 & 17, Evening >17):
WITH hourly_sale
AS
(
SELECT *,
    CASE
        WHEN EXTRACT(HOUR FROM sale_time) < 12 THEN 'Morning'
        WHEN EXTRACT(HOUR FROM sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
        ELSE 'Evening'
    END as shift
FROM retail_sales
)
SELECT 
    shift,
    COUNT(*) as total_orders    
FROM hourly_sale
GROUP BY shift;

-- END --

