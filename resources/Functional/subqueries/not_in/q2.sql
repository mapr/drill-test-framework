-- projected column in not in subquery is casted
select * from j2 where c_bigint not in ( select cast(c_integer as bigint) from j6) ;
