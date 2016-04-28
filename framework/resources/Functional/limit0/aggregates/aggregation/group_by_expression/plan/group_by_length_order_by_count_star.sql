explain plan for select * from (select length(c_varchar), count(*) from alltypes_v group by length(c_varchar) order by count(*)) t limit 0;
