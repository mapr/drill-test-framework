explain plan for select * from ( select d18, COUNT(DISTINCT c_integer) from alltypes_v group by d18 order by d18, COUNT(DISTINCT c_integer) desc ) t limit 0;
