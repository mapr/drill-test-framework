-- Non correlated
-- Inequality
-- AVG expression returns NON NULL result
select count(*) from j1 where c_integer <> (select round(avg(c_double)+100) - avg(c_integer) from j2 where c_bigint is not null);
