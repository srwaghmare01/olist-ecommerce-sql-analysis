-- ============================================
-- Olist Brazilian E-Commerce SQL Analysis
-- Author: Shweta Waghmare
-- GitHub: srwaghmare01
-- Tool: SQLiteOnline.com (SQLite)
-- Dataset: Kaggle — Olist Brazilian E-Commerce
-- ============================================


-- Q1: Total Number of Orders
SELECT COUNT(*) AS total_orders
FROM orders;
-- Result: 99,441


-- Q2: Order Status Breakdown
SELECT 
    order_status,
    COUNT(*) AS number_of_orders
FROM orders
GROUP BY order_status
ORDER BY number_of_orders DESC;
-- Result: 96.4% delivered, 625 canceled, 609 unavailable


-- Q3: Total Revenue
SELECT 
    ROUND(SUM(payment_value), 2) AS total_revenue
FROM payments;
-- Result: R$ 16,008,872.12


-- Q4: Payment Methods Breakdown
SELECT 
    payment_type,
    COUNT(*) AS number_of_payments,
    ROUND(SUM(payment_value), 2) AS total_revenue
FROM payments
GROUP BY payment_type
ORDER BY number_of_payments DESC;
-- Result: Credit card dominates at 74% of payments
-- Data Quality Issue: 3 orders with not_defined payment type and R$0 revenue


-- Q5: Average Order Value
SELECT 
round(avg(payment_value),2) 
as avg_value
from payments;
-- Result: R$ 154.10


-- Q6: Highest and Lowest Order Value
SELECT 
    ROUND(MAX(payment_value), 2) AS highest_order_value,
    ROUND(MIN(payment_value), 2) AS lowest_order_value
FROM payments;
-- Result: Highest R$13,664.08 | Lowest R$0.00
-- Data Quality Issue: R$0 minimum links to undefined payment issue in Q4


-- Q7: Orders Placed Each Year
SELECT 
    strftime('%Y', order_purchase_t) AS year,
    COUNT(*) AS number_of_orders
FROM orders
GROUP BY year
ORDER BY year ASC;
-- Result: 2016 (329), 2017 (45,101), 2018 (54,011)
-- Note: 2016 and 2018 are incomplete years in the dataset


-- Q8: Top 10 Cities by Number of Customers
SELECT 
    customer_city,
    COUNT(*) AS number_of_customers
FROM customers
GROUP BY customer_city
ORDER BY number_of_customers DESC
LIMIT 10;
-- Result: Sao Paulo (15,540) and Rio de Janeiro (6,882) account for 22% of all customers


-- Q9: Top 10 Best Selling Product Categories
SELECT 
    product_category,
    COUNT(*) AS number_of_products_sold
FROM order_items
JOIN products ON order_items.product_id = products.product_id
GROUP BY product_category
ORDER BY number_of_products_sold DESC
LIMIT 10;
-- Result: cama_mesa_banho (bed/table/bath) leads with 11,115 units sold


-- Q10: Average Review Score
SELECT 
    ROUND(AVG(review_score), 2) AS avg_review_score
FROM reviews;
-- Result: 4.09 out of 5


-- Q11: Review Score Distribution
SELECT review_score,
COUNT(*) AS number_of_reviews
FROM reviews
GROUP BY review_score
ORDER BY review_score DESC;
-- Result: 57,328 five-star reviews
-- Insight: 1-star (11,424) outnumber 2-star (3,151) -- J-curve pattern


-- Q12: Top 10 Sellers by Number of Sales
SELECT sellers.seller_id, COUNT(*) AS number_of_sales
FROM sellers
JOIN order_items ON sellers.seller_id = order_items.seller_id
GROUP BY sellers.seller_id
ORDER BY number_of_sales DESC
LIMIT 10;
-- Result: Top seller made 2,033 sales


-- Q13: Average Delivery Time in Days
SELECT 
    ROUND(AVG(JULIANDAY(order_delivered__6) - 
    JULIANDAY(order_purchase_t)), 1) AS avg_delivery_days
FROM orders
WHERE order_delivered__6 IS NOT NULL;
-- Result: 12.6 days average delivery time
-- Note: IS NOT NULL used to exclude undelivered orders from calculation


-- Q14: Top 10 Product Categories by Revenue
SELECT 
    products.product_category,
    ROUND(SUM(payments.payment_value), 2) AS total_revenue
FROM order_items
JOIN products ON order_items.product_id = products.product_id
JOIN payments ON order_items.order_id = payments.order_id
GROUP BY products.product_category
ORDER BY total_revenue DESC
LIMIT 10;
-- Result: cama_mesa_banho leads with R$1,712,553
-- Insight: Computer accessories rank 3rd in revenue but 5th in units -- higher price per item


-- Q15: Top 10 Customers by Total Spend
SELECT 
    orders.customer_id,
    ROUND(SUM(payments.payment_value), 2) AS total_spent
FROM orders
JOIN payments ON orders.order_id = payments.order_id
JOIN customers ON orders.customer_id = customers.customer_id
GROUP BY orders.customer_id
ORDER BY total_spent DESC
LIMIT 10;
-- Result: Top customer spent R$13,664.08 -- matches highest single order value from Q6
-- Insight: Likely a bulk or business purchase
