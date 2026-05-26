# Instacart Grocery Analysis

Grocery customer behaviour analysis using SQL, Python and Power BI — Instacart dataset

## Key Findings

- Dairy & Eggs department has the highest reorder rate — perishable staples drive forced weekly repurchase cycles
- Frozen/Ice Cream has the lowest reorder rate (40.66%) — impulse and occasion-based purchasing, not habitual buying
- High frequency customers (avg 33.93 orders) drive current revenue. However, 68,736 low-frequency customers (avg 5.15 orders) represent the largest growth opportunity — converting even 20% to medium frequency would significantly impact total order volume
- Orders peak on weekends (Saturday #1 with 600,905 orders). Unlike physical stores, online grocery orders peak 10am-3pm — customers plan ahead during daytime, not after work
- 1.34M orders (39%) show increasing order gaps — early churn signals. Targeted promotions for these customers could significantly reduce attrition.
- Banana appears in 60% of top product pairs — the universal anchor product. This insight drives product placement and recommendation engine strategy.

## Tools Used
- PostgreSQL — data storage and SQL analysis
- Python — EDA and RFM segmentation (upcoming)
- Power BI — dashboard (upcoming)

## Dataset
Instacart Market Basket Analysis — 3.4M orders, 200K users, 50K products
