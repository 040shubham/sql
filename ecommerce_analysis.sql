
-- 1. Create table
CREATE TABLE customers (
    customer_id TEXT PRIMARY KEY,
    customer_unique_id TEXT,
    customer_zip_code_prefix INTEGER,
    customer_city TEXT,
    customer_state TEXT
);

-- 2. Example data insertion (just a few rows)
INSERT INTO customers (customer_id, customer_unique_id, customer_zip_code_prefix, customer_city, customer_state) VALUES
('06b8999e2fba1a1fbc88172c00ba8bc7', '861eff4711a542e4b93843c6dd7febb0', 14409, 'franca', 'SP'),
('18955e83d337fd6b2def6b18a428ac77', '290c77bc529b7ac935b93aa66c333dc3', 9790, 'sao bernardo do campo', 'SP'),
('4e7b3e00288586ebd08712fdd0374a03', '060e732b5b29e8181a18229c7b0b2b5e', 1151, 'sao paulo', 'SP'),
('b2b6027bc5c5109e529d4dc6358b12c3', '259dac757896d24d7702b9acbbff3f3c', 8775, 'mogi das cruzes', 'SP'),
('4f2d8ab171c80ec8364f7c12e35b23ad', '345ecd01c38d18a9036ed96c73b8d066', 13056, 'campinas', 'SP');

-- 3. SELECT example
SELECT * FROM customers WHERE customer_city = 'sao paulo';

-- 4. GROUP BY + aggregate
SELECT customer_state, COUNT(*) AS total_customers
FROM customers
GROUP BY customer_state
ORDER BY total_customers DESC;

-- 5. Subquery: Get cities with more than 1 customer
SELECT customer_city
FROM customers
GROUP BY customer_city
HAVING COUNT(*) > 1;

-- 6. Create a VIEW for customers in SP state
CREATE VIEW sp_customers AS
SELECT * FROM customers WHERE customer_state = 'SP';

-- 7. Index suggestion
CREATE INDEX idx_customer_city ON customers(customer_city);
