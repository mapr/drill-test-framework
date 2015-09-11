select c_float, COUNT(DISTINCT c_integer) from alltypes group by c_float order by c_float;
