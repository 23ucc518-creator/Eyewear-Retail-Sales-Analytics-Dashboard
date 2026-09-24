-- =====================================================================
-- Orders Data Normalization Script
-- =====================================================================
-- Purpose:
--   The original "orders" table(dataset from kaggle stored in order table) stores repeated text data for city,
--   state, product category, gender, etc. directly in every row.
--   This script normalizes that data into separate lookup tables
--   (locations, products, customers) and creates a clean fact table
--   (orders_normalized) that references those lookup tables via
--   foreign keys instead of repeating text values.
-- =====================================================================


-- ---------------------------------------------------------------------
-- STEP 1: Create the lookup tables (empty, structure only)
-- ---------------------------------------------------------------------
-- These tables will hold unique values for locations, products,
-- and customers, each with their own auto-incrementing ID.

CREATE TABLE locations (
    location_id INT PRIMARY KEY AUTO_INCREMENT,
    city VARCHAR(50),
    state VARCHAR(50)
);

CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_category VARCHAR(30)
);

CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_gender VARCHAR(10),
    customer_age INT
);


-- ---------------------------------------------------------------------
-- STEP 2: Populate the lookup tables with distinct values from "orders"
-- ---------------------------------------------------------------------
-- Pull the unique city/state, product_category, and gender/age
-- combinations straight out of the existing "orders" table.
-- Each lookup table row gets its own auto-generated ID.

INSERT INTO locations (city, state)
SELECT DISTINCT city, state FROM orders;

INSERT INTO products (product_category)
SELECT DISTINCT product_category FROM orders;

INSERT INTO customers (customer_gender, customer_age)
SELECT DISTINCT customer_gender, customer_age FROM orders;


-- ---------------------------------------------------------------------
-- STEP 3: Create the new fact table, referencing those IDs
-- ---------------------------------------------------------------------
-- This table holds the actual order transactions, linking out to
-- locations, products, and customers via foreign keys instead of
-- storing repeated text data directly.

CREATE TABLE orders_normalized (
    order_id VARCHAR(20) PRIMARY KEY,
    order_date DATE,
    location_id INT,
    product_id INT,
    customer_id INT,
    sales_channel VARCHAR(20),
    store_type VARCHAR(30),
    quantity INT,
    unit_price DECIMAL(10,2),
    discount_percent INT,
    net_sales_amount DECIMAL(10,2),
    payment_mode VARCHAR(20),
    FOREIGN KEY (location_id) REFERENCES locations(location_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);


-- ---------------------------------------------------------------------
-- STEP 4: Fill it by JOINing the original "orders" table against the
--         new lookup tables
-- ---------------------------------------------------------------------
-- Match each order back to the correct location_id, product_id, and
-- customer_id using the lookup tables, and insert the result into
-- orders_normalized.
--
-- After this runs:
--   - "orders" (the original flat import) still exists untouched
--   - "locations", "products", "customers", and "orders_normalized"
--     together form a proper multi-table (normalized) structure

INSERT INTO orders_normalized
SELECT
    o.order_id, o.order_date,
    l.location_id, p.product_id, c.customer_id,
    o.sales_channel, o.store_type, o.quantity, o.unit_price,
    o.discount_percent, o.net_sales_amount, o.payment_mode
FROM orders o
JOIN locations l ON o.city = l.city AND o.state = l.state
JOIN products p ON o.product_category = p.product_category
JOIN customers c ON o.customer_gender = c.customer_gender AND o.customer_age = c.customer_age;
