--Which departments drive the most orders, reorders, and new customer trials?

SELECT 
    d.department,
    COUNT(*) AS total_orders,
    SUM(CASE WHEN op.reordered = 1 THEN 1 ELSE 0 END) AS total_reorders,
    SUM(CASE WHEN op.reordered = 0 THEN 1 ELSE 0 END) AS new_trials,
    ROUND(AVG(op.reordered::NUMERIC) * 100, 2) AS reorder_rate_pct
FROM order_products_prior op
JOIN products p ON op.product_id = p.product_id
JOIN departments d ON p.department_id = d.department_id
GROUP BY d.department
ORDER BY total_orders DESC;