-- Non correlated
-- Equality
-- MIN returns NULL
select * from j7 where c_integer = (select min(c_integer) from j2);
