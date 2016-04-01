-- Inner join
-- With count distinct in both having clause and projection list, columns from different tables
-- And one more distinct aggregate from different tables in the having clause
-- Distributed plan

alter session set `planner.slice_target` = 1;

explain plan for select * from (
select
	100,
	count(*) + 1000,
	count(distinct a.c_boolean)
from
	alltypes_v a,
	alltypes_v b
where
	a.c_timestamp = b.c_timestamp
having
	( count(distinct b.c_date) > 50 or
	sum(distinct b.c_integer) > 0 ) and
	sum(distinct a.c_float) >= 1000000.00) t limit 0;

alter session set `planner.slice_target` = 100000;
