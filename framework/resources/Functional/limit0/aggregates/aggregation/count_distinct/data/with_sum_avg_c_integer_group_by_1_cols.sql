select count(distinct c_integer), sum(c_integer), round(avg(c_integer)) from alltypes_with_nulls_v group by  c_varchar order by  c_varchar;
