select c_timestamp, COUNT(DISTINCT c_integer) from alltypes group by c_timestamp order by c_timestamp, COUNT(DISTINCT c_integer) desc;
