explain plan for select * from ( select c_float, COUNT(DISTINCT c_integer) from alltypes_v group by c_float order by c_float, COUNT(DISTINCT c_integer) desc ) t limit 0;
