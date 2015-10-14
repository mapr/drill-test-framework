select length(c_varchar), count(*) from alltypes group by length(c_varchar) order by count(*);
