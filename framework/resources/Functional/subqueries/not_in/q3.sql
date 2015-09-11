-- multuple not in clauses, distinct aggregate
select * from j2 where c_bigint not in ( select cast(c_integer as bigint) from j6 ) and c_date not in ( select distinct c_date from j6); 
