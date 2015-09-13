select count(*) as c0 from (select distinct time_by_day.month_of_year as c0, time_by_day.quarter as c1, time_by_day.the_year as c2 from time_by_day as time_by_day) as init;
