-- Non correlated
-- Greater than or equal
-- AVG returns NON null result
-- columns in j1 are optional type
select count(*) from j7 where c_bigint >= (select avg(c_bigint) from j1 where c_date not in ('2014-01-01', '2014-02-01', '2014-03-01', '2014-11-01') );
