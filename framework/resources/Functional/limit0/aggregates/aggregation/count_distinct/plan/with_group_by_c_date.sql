explain plan for select * from ( select c_date, COUNT(DISTINCT c_integer) from alltypes_v group by c_date order by c_date ) t limit 0;
