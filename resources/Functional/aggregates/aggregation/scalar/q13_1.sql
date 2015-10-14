-- Full outer join and scalar aggregates on both sides
-- Distributed plan

alter session set `planner.slice_target` = 1;

select
	count(*),
	count(distinct a.c_integer),
	count(distinct b.c_integer),
	count(distinct a.c_date),
	count(distinct b.c_date),
	sum(a.c_bigdecimal),
	sum(a.c_integer),
	sum(b.c_bigdecimal),
	sum(b.c_integer),
	avg(a.c_bigdecimal),
	avg(b.c_integer)
from
        alltypes a 
		full outer join
	alltypes b
on 	(a.c_date = b.c_date)
where
        a.c_bigint = 884838034226544640
;

alter session set `planner.slice_target` = 100000;
