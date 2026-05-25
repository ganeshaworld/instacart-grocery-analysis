-- =============================================
-- Q4: Churn Signal Analysis
-- Instacart Grocery Analysis Project
-- =============================================

-- Query 1: Top 100 churn risk orders
WITH churn_signal AS (
    SELECT 
        user_id, 
        order_number, 
        days_since_prior_order,
        LAG(days_since_prior_order) OVER (
            PARTITION BY user_id 
            ORDER BY order_number
        ) AS prev_order_gap
    FROM orders
)
SELECT 
    user_id,
    order_number,
    days_since_prior_order,
    prev_order_gap,
    days_since_prior_order - prev_order_gap AS gap_increase
FROM churn_signal
WHERE days_since_prior_order > prev_order_gap
AND prev_order_gap IS NOT NULL
ORDER BY gap_increase DESC
LIMIT 100;


-- Query 2: Total churn risk count
WITH churn_signal AS (
    SELECT 
        user_id, 
        order_number, 
        days_since_prior_order,
        LAG(days_since_prior_order) OVER (
            PARTITION BY user_id 
            ORDER BY order_number
        ) AS prev_order_gap
    FROM orders
)
SELECT 
    COUNT(*)                                    AS total_churn_risk_orders,
    ROUND(COUNT(*) * 100.0 / 
        (SELECT COUNT(*) FROM orders), 2)       AS churn_risk_pct
FROM churn_signal
WHERE days_since_prior_order > prev_order_gap
AND prev_order_gap IS NOT NULL;