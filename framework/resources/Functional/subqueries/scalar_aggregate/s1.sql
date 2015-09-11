-- Non correlated
-- Equality
-- MAX returns NON NULL result
select * from j1 where c_integer = (select max(c_integer) from j2);
