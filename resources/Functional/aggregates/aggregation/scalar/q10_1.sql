-- Self inner join and scalar aggregate
-- Distributed plan

alter session set `planner.slice_target` = 1;

select
	sum(distinct a.c_integer) as sum_a_c_integer,
	sum(distinct b.c_integer) as sum_b_c_integer,
	avg(distinct a.c_integer) as avg_a_c_integer,
	avg(distinct b.c_integer) as avg_b_c_integer
from
        alltypes a,
	alltypes b
where
	a.c_date = b.c_date
;

alter session set `planner.slice_target` = 100000;

