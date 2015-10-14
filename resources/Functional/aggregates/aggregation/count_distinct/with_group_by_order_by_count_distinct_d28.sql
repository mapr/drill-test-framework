select d28, COUNT(DISTINCT c_integer) from alltypes group by d28 order by d28, COUNT(DISTINCT c_integer) desc;
