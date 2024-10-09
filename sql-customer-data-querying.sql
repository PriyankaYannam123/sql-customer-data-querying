-- Query 1: Extract total sales per customer
SELECT customer_id, SUM(sales_amount) AS total_sales
FROM customer_sales
GROUP BY customer_id;

-- Query 2: Find customers who have purchased a specific product
SELECT customer_id, product_id, COUNT(*) AS purchase_count
FROM customer_sales
WHERE product_id = 101
GROUP BY customer_id, product_id;

-- Query 3: Aggregate customer behavior by region
SELECT region, AVG(total_sales) AS avg_sales_per_customer
FROM (
    SELECT customer_id, region, SUM(sales_amount) AS total_sales
    FROM customer_sales
    JOIN customer_details ON customer_sales.customer_id = customer_details.customer_id
    GROUP BY customer_id, region
) AS customer_region_sales
GROUP BY region;
