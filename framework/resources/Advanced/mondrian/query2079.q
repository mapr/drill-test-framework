select time_by_day.the_year as c0, time_by_day.quarter as c1, sum(sales_fact_1997.unit_sales) as m0 from time_by_day as time_by_day, sales_fact_1997 as sales_fact_1997 where sales_fact_1997.time_id = time_by_day.time_id and time_by_day.the_year = 1998 and time_by_day.quarter in ('Q1', 'Q2') group by time_by_day.the_year, time_by_day.quarter;
