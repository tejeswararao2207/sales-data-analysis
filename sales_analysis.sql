
-- Project: Sales Data Analysis
-- Purpose: Analyze sales, revenue, products, and regions

-- 1. Create the sales table
CREATE TABLE sales (
    order_id INTEGER PRIMARY KEY,
    order_date DATE,
    product VARCHAR(50),
    region VARCHAR(30),
    quantity INTEGER,
    unit_price DECIMAL(10,2)
);

-- 2. Insert sample sales records
INSERT INTO sales
(order_id, order_date, product, region, quantity, unit_price)
VALUES
(1001, '2026-01-05', 'Laptop', 'East', 2, 800.00),
(1002, '2026-01-06', 'Mouse', 'West', 5, 20.00),
(1003, '2026-01-08', 'Keyboard', 'East', 3, 50.00),
(1004, '2026-02-02', 'Monitor', 'South', 2, 200.00),
(1005, '2026-02-10', 'Laptop', 'West', 1, 800.00),
(1006, '2026-02-15', 'Mouse', 'North', 10, 20.00),
(1007, '2026-03-01', 'Monitor', 'East', 4, 200.00),
(1008, '2026-03-05', 'Keyboard', 'West', 6, 50.00),
(1009, '2026-03-12', 'Laptop', 'South', 2, 800.00),
(1010, '2026-03-20', 'Mouse', 'East', 8, 20.00);

-- 3. View all sales records
SELECT *
FROM sales;

-- 4. Calculate total revenue
SELECT SUM(quantity * unit_price) AS total_revenue
FROM sales;

-- 5. Find revenue by product
SELECT
    product,
    SUM(quantity * unit_price) AS total_revenue
FROM sales
GROUP BY product
ORDER BY total_revenue DESC;

-- 6. Find revenue by region
SELECT
    region,
    SUM(quantity * unit_price) AS total_revenue
FROM sales
GROUP BY region
ORDER BY total_revenue DESC;

-- 7. Find the number of orders and units sold
SELECT
    COUNT(*) AS total_orders,
    SUM(quantity) AS total_units_sold
FROM sales;

-- 8. Analyze monthly revenue
SELECT
    strftime('%Y-%m', order_date) AS sales_month,
    SUM(quantity * unit_price) AS monthly_revenue
FROM sales
GROUP BY strftime('%Y-%m', order_date)
ORDER BY sales_month;
