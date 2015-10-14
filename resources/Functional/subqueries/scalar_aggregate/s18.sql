-- Non correlated
-- Less than or equal
-- AVG returns NON null result
-- Implicit cast: intger to double
select count(distinct c_double) from j7 where c_double <= (select avg(distinct c_integer) from j6);
