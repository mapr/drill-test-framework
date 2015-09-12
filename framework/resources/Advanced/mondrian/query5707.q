select time_by_day.month_of_year as c0 from time_by_day as time_by_day where (time_by_day.quarter = 'Q3' and time_by_day.the_year = 1998) group by time_by_day.month_of_year order by time_by_day.month_of_year ASC NULLS LAST;
