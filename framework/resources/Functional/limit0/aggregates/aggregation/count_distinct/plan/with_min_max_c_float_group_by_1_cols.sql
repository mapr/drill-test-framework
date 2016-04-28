explain plan for select * from ( select count(distinct c_float), max(c_float), min(c_float) from alltypes_with_nulls_v group by  c_date order by  c_date ) t limit 0;
