-- Business question:"

-- "Which products are most frequently purchased together — 
-- and what does this reveal about customer buying behavior?"

SELECT 
    p1.product_name AS product_1,
    p2.product_name AS product_2,
    COUNT(*) AS times_ordered_together
FROM order_products_prior a
JOIN order_products_prior b ON a.order_id = b.order_id
    AND a.product_id < b.product_id
JOIN products p1 ON a.product_id = p1.product_id
JOIN products p2 ON b.product_id = p2.product_id
WHERE a.product_id IN (
    SELECT product_id 
    FROM order_products_prior 
    GROUP BY product_id 
    HAVING COUNT(*) > 10000
)
AND b.product_id IN (
    SELECT product_id 
    FROM order_products_prior 
    GROUP BY product_id 
    HAVING COUNT(*) > 10000
)
GROUP BY p1.product_name, p2.product_name
ORDER BY times_ordered_together DESC
LIMIT 20;