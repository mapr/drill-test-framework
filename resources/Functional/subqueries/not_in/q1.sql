-- mix of not ins: columns from tables and literals 
select * from j2 where c_bigint not in ( select cast(c_integer as bigint) from j6 ) and c_varchar not in ( 'AAAA', 'BBBB', '0000', '0008 397933 38800', '0000 000000 00000') and c_boolean in ( 'true' ) and c_date not in ( select distinct c_date from j6);
