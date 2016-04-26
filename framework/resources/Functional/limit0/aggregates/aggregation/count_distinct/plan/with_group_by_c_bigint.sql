explain plan for select * from ( select c_bigint, COUNT(DISTINCT c_integer) from alltypes_v group by c_bigint order by c_bigint ) t limit 0;
