explain plan for select * from ( select c_time, COUNT(DISTINCT c_integer) from alltypes_v group by c_time order by c_time, COUNT(DISTINCT c_integer) desc ) t limit 0;
