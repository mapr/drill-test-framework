select c_bigint, COUNT(DISTINCT c_integer) from alltypes group by c_bigint order by c_bigint, COUNT(DISTINCT c_integer) desc;
