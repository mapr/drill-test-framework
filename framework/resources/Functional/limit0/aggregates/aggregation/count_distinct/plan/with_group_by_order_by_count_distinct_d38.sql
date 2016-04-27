explain plan for select * from ( select d38, COUNT(DISTINCT c_integer) from alltypes_v group by d38 order by d38, COUNT(DISTINCT c_integer) desc ) t limit 0;
