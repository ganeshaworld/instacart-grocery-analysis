WITH product_stats AS (
    SELECT
        p.product_id,
        p.product_name,
        a.aisle,
        d.department,
        COUNT(*)                                    AS total_orders,
        SUM(op.reordered)                           AS total_reorders,
        ROUND(AVG(op.reordered::NUMERIC) * 100, 2) AS reorder_rate_pct
    FROM order_products_prior op
    JOIN products p    ON op.product_id    = p.product_id
    JOIN aisles a      ON p.aisle_id       = a.aisle_id
    JOIN departments d ON p.department_id  = d.department_id
    GROUP BY p.product_id, p.product_name, a.aisle, d.department
),
dept_stats AS (
    SELECT
        department,
        ROUND(AVG(reorder_rate_pct), 2)             AS dept_avg_reorder_rate,
        SUM(total_orders)                           AS dept_total_orders,
        RANK() OVER (ORDER BY AVG(reorder_rate_pct) DESC) AS dept_rank
    FROM product_stats
    GROUP BY department
),
aisle_stats AS (
    SELECT
        department,
        aisle,
        ROUND(AVG(reorder_rate_pct), 2)             AS aisle_avg_reorder_rate,
        SUM(total_orders)                           AS aisle_total_orders,
        RANK() OVER (
            PARTITION BY department
            ORDER BY AVG(reorder_rate_pct) DESC
        )                                           AS aisle_rank_in_dept
    FROM product_stats
    GROUP BY department, aisle
)
SELECT
    d.dept_rank,
    d.department,
    d.dept_avg_reorder_rate,
    d.dept_total_orders,
    a.aisle,
    a.aisle_avg_reorder_rate,
    a.aisle_total_orders,
    a.aisle_rank_in_dept
FROM dept_stats d
JOIN aisle_stats a ON d.department = a.department
ORDER BY d.dept_rank, a.aisle_rank_in_dept
LIMIT 50;