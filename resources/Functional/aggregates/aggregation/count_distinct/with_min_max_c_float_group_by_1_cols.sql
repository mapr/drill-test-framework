select count(distinct c_float), max(c_float), min(c_float) from alltypes_with_nulls group by  c_date order by  c_date;
