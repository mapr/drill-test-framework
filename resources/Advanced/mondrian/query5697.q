select time_by_day.the_year as c0, the_year || '-12-31' as c1 from time_by_day as time_by_day group by time_by_day.the_year, the_year || '-12-31' order by time_by_day.the_year ASC NULLS LAST;
