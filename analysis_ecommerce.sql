CREATE DATABASE ecommerce_db;
USE ecommerce_db;
CREATE TABLE customers (
    customer_id VARCHAR(50),
    customer_unique_id VARCHAR(50),
    customer_zip_code_prefix INT,
    customer_city VARCHAR(100),
    customer_state VARCHAR(10)
);
SELECT * FROM customers LIMIT 10;

CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id VARCHAR(50),
    order_date DATE,
    order_amount DECIMAL(10,2)
);
INSERT INTO orders (customer_id, order_date, order_amount)
SELECT customer_id, 
       DATE_ADD('2024-01-01', INTERVAL FLOOR(RAND() * 100) DAY),
       ROUND(RAND() * 500 + 50, 2)
FROM customers
LIMIT 1000;

SELECT * 
FROM customers 
WHERE customer_city = 'sao paulo';

SELECT customer_state, COUNT(*) AS total_customers
FROM customers
GROUP BY customer_state
ORDER BY total_customers DESC;

SELECT c.customer_state, AVG(o.order_amount) AS avg_order
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_state
ORDER BY avg_order DESC;

SELECT o.customer_id, SUM(o.order_amount) AS total_spent
FROM orders o
GROUP BY o.customer_id
HAVING total_spent > 1000
ORDER BY total_spent DESC;

SELECT customer_id
FROM orders
GROUP BY customer_id
HAVING COUNT(*) > 3;

CREATE VIEW city_spending AS
SELECT c.customer_city, SUM(o.order_amount) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_city;

CREATE INDEX idx_customer_id ON orders(customer_id);