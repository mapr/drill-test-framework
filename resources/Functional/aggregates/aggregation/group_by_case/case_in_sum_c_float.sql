select count(distinct a1) from ( select SUM(case when c_float is null then 0 else 1 end) from alltypes_with_nulls group by c_date order by SUM(case when c_float is null then 0 else 1 end)) as dt(a1);
