explain plan for select * from (select length(c_varchar), count(*) from alltypes_v group by length(c_varchar) order by length(c_varchar)) t limit 0;
