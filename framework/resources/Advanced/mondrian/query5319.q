select count(*) as c0 from (select distinct time_by_day.quarter as c0, time_by_day.the_year as c1 from time_by_day as time_by_day) as init;
