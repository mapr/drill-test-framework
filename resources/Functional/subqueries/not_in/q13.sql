-- NLJ below UNION ALL
select c_date from j2 where c_bigint not in ( select cast(c_integer as bigint) from j6) 
union all
select c_date from j2 where c_bigint not in ( select cast(c_integer as bigint) from j3) and c_date not in ( select distinct c_date from j1);
