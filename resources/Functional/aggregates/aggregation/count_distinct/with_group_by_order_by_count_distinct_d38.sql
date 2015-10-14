select d38, COUNT(DISTINCT c_integer) from alltypes group by d38 order by d38, COUNT(DISTINCT c_integer) desc;
