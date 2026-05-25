SELECT 'aisles'                AS table_name, COUNT(*) AS row_count FROM aisles
UNION ALL
SELECT 'departments',                          COUNT(*) FROM departments
UNION ALL
SELECT 'products',                             COUNT(*) FROM products
UNION ALL
SELECT 'orders',                               COUNT(*) FROM orders
UNION ALL
SELECT 'order_products_prior',                 COUNT(*) FROM order_products_prior
UNION ALL
SELECT 'order_products_train',                 COUNT(*) FROM order_products_train
ORDER BY table_name;