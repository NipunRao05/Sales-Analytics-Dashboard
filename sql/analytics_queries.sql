-- Total Revenue
SELECT SUM(net_amount) AS total_revenue FROM sales;

-- Monthly Revenue Trend
SELECT DATE_FORMAT(order_date, "%Y-%m") AS month,
       SUM(net_amount) AS monthly_revenue
FROM sales
GROUP BY month
ORDER BY month;

-- Top 10 Customers
SELECT c.customer_name,
       SUM(s.net_amount) AS revenue
FROM sales s
JOIN customers c USING (customer_id)
GROUP BY s.customer_id
ORDER BY revenue DESC
LIMIT 10;

-- Region-wise Performance
SELECT c.region,
       SUM(s.net_amount) AS revenue
FROM sales s
JOIN customers c USING (customer_id)
GROUP BY c.region
ORDER BY revenue DESC;

-- Product Category Split
SELECT p.category,
       SUM(s.net_amount) AS revenue
FROM sales s
JOIN products p USING (product_id)
GROUP BY p.category
ORDER BY revenue DESC;
