-- Aisles
CREATE TABLE aisles (
    aisle_id   INT PRIMARY KEY,
    aisle      VARCHAR(100) NOT NULL
);

-- Departments
CREATE TABLE departments (
    department_id   INT PRIMARY KEY,
    department      VARCHAR(100) NOT NULL
);

-- Products
CREATE TABLE products (
    product_id      INT PRIMARY KEY,
    product_name    VARCHAR(255) NOT NULL,
    aisle_id        INT REFERENCES aisles(aisle_id),
    department_id   INT REFERENCES departments(department_id)
);

-- Orders
CREATE TABLE orders (
    order_id                INT PRIMARY KEY,
    user_id                 INT NOT NULL,
    eval_set                VARCHAR(20),
    order_number            INT,
    order_dow               INT,
    order_hour_of_day       INT,
    days_since_prior_order  FLOAT
);

-- Order products (prior)
CREATE TABLE order_products_prior (
    order_id            INT REFERENCES orders(order_id),
    product_id          INT REFERENCES products(product_id),
    add_to_cart_order   INT,
    reordered           INT
);

-- Order products (train)
CREATE TABLE order_products_train (
    order_id            INT REFERENCES orders(order_id),
    product_id          INT REFERENCES products(product_id),
    add_to_cart_order   INT,
    reordered           INT
);
