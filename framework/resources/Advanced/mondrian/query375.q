select store.store_sqft as c0, time_by_day.the_year as c1, time_by_day.quarter as c2, time_by_day.month_of_year as c3, customer.education as c4, sum(sales_fact_1997.unit_sales) as m0 from store as store, sales_fact_1997 as sales_fact_1997, time_by_day as time_by_day, customer as customer where sales_fact_1997.store_id = store.store_id and store.store_sqft = 20319 and sales_fact_1997.time_id = time_by_day.time_id and time_by_day.the_year = 1997 and time_by_day.quarter in ('Q2', 'Q3') and time_by_day.month_of_year in (5, 8) and sales_fact_1997.customer_id = customer.customer_id and customer.education = 'High School Degree' group by store.store_sqft, time_by_day.the_year, time_by_day.quarter, time_by_day.month_of_year, customer.education;
