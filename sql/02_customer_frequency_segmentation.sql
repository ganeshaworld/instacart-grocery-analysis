with user_orders as (
select user_id, count(*) as total_orders
from orders
group by user_id
),
frequency_segments as (
select
	user_id,
	total_orders,
	NTILE(3) over (order by total_orders desc) as frequency_group
from user_orders
)
select
CASE 
    WHEN frequency_group = 1 THEN 'High'
    WHEN frequency_group = 2 THEN 'Medium'
    ELSE 'Low'
END AS segment_name,
count(*) as total_orders,
round(avg(total_orders), 2) as avg_orders
from frequency_segments
group by frequency_group;

