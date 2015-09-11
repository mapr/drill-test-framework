-- order by in subquery
select count(distinct c_integer), count(distinct c_bigint), count(*) from j1 where c_varchar not in ( select c_varchar from j6 where c_boolean is false union all select c_varchar from j5 where c_boolean is true order by c_varchar);
