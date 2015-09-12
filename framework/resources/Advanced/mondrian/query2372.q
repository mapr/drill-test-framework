select store.store_name as c0, time_by_day.the_year as c1, time_by_day.quarter as c2, sum(sales_fact_1997.store_sales) as m0 from store as store, sales_fact_1997 as sales_fact_1997, time_by_day as time_by_day where sales_fact_1997.store_id = store.store_id and sales_fact_1997.time_id = time_by_day.time_id group by store.store_name, time_by_day.the_year, time_by_day.quarter;
