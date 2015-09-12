select time_by_day.the_year as c0, count(distinct sales_fact_1997.customer_id) as m0 from time_by_day as time_by_day, sales_fact_1997 as sales_fact_1997, store as store where sales_fact_1997.time_id = time_by_day.time_id and sales_fact_1997.store_id = store.store_id and store.store_name = 'Store 14' group by time_by_day.the_year;
