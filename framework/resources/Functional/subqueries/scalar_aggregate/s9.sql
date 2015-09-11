-- Non correlated
-- Greater than
-- MIN returns NULL
select * from j2 where c_integer > (select min(c_bigint) from j7 where c_boolean is null);
