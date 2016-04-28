explain plan for select * from ( select c_timestamp, COUNT(DISTINCT c_integer) from alltypes_v group by c_timestamp order by c_timestamp ) t limit 0;
