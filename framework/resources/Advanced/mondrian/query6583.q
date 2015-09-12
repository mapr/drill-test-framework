select time_by_day.the_year as c0, customer.customer_id as c1, sum(sales_fact_1997.store_sales) as m0 from time_by_day as time_by_day, sales_fact_1997 as sales_fact_1997, customer as customer where sales_fact_1997.time_id = time_by_day.time_id and time_by_day.the_year = 1997 and sales_fact_1997.customer_id = customer.customer_id and customer.customer_id in (705, 907, 1389, 1738, 2533, 2869, 3321, 3352, 3540, 5144, 6617, 6754, 6894, 7236, 9019, 9622, 9855, 9858) group by time_by_day.the_year, customer.customer_id;
