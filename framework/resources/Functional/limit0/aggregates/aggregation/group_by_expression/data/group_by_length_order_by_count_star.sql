select length(c_varchar), count(*) from alltypes_v group by length(c_varchar) order by count(*);
