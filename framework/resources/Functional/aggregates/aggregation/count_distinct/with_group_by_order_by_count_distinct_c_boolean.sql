select c_boolean, COUNT(DISTINCT c_integer) from alltypes group by c_boolean order by c_boolean, COUNT(DISTINCT c_integer) desc;
