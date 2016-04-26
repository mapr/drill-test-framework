-- Right outer join and scalar aggregates on both sides
-- Distributed plan

alter session set `planner.slice_target` = 1;

explain plan for select * from (
select
	count(*),
	count(distinct a.c_integer),
	count(distinct b.c_integer),
	count(distinct a.c_date),
	count(distinct b.c_date),
	sum(a.c_smalldecimal),
	sum(a.c_integer),
	sum(b.c_smalldecimal),
	sum(b.c_integer),
	avg(a.c_bigdecimal),
	avg(b.c_integer)
from
        alltypes_v a 
		right outer join
	alltypes_v b
on 	(a.c_date = b.c_date)
) t limit 0;

alter session set `planner.slice_target` = 100000;
