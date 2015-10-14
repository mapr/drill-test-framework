select c_date, COUNT(DISTINCT c_integer) from alltypes_with_nulls group by c_date order by c_date;
