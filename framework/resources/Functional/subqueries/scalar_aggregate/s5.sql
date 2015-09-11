-- Non correlated
-- Less than
-- MAX returns NON null result
select count(*) from j7 where c_integer < (select max(c_integer) from j3);
