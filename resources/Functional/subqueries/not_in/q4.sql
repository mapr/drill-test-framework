-- multuple not in clauses, distinct aggregate
-- added simple filter in subquery
select * from j2 where c_bigint not in ( select cast(c_integer as bigint) from j6 where c_boolean is true ) and c_date not in ( select distinct c_date from j6);
