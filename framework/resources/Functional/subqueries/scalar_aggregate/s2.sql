-- Non correlated
-- Inequality
-- MAX returns NON null result
select count(*) from j1 where c_integer <> (select max(c_bigint) from j2 where c_bigint is not null);
