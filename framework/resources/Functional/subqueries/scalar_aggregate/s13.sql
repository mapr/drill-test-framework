-- Non correlated
-- Equality
-- AVG expression returns NON NULL result
select * from j1 where c_double = (select avg(c_integer)*1.2 from j2);
