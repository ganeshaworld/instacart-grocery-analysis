select order_dow, order_hour_of_day, count(*) from orders group by order_dow, order_hour_of_day;
