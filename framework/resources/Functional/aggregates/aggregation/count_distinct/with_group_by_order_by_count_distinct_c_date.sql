select c_date, COUNT(DISTINCT c_integer) from alltypes group by c_date order by c_date, COUNT(DISTINCT c_integer) desc;
