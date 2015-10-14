-- Non correlated
-- Less than or equal
-- MAX returns NON null result
select count(*) from j7 where c_integer <= (select max(c_integer) from j2);
