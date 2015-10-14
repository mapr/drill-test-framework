-- join, group by columns from one table 
-- hash join is enabled

alter session set `planner.enable_mergejoin` = false;
alter session set `planner.enable_hashjoin` = true;

select 	t1.a1, 
	t1.b1, 
	count(distinct t1.c1) as distinct_c1,
       	sum(t1.a1) as sum_a1, 
	count(t1.c1) as count_a1, 
	count(*) as count_star
from 
	t1,
	t2
where
	t1.b1 = t2.b2
group by 
	t1.a1, 
	t1.b1 
order by 
	t1.a1, 
	t1.b1
;

alter session set `planner.enable_mergejoin` = true;
alter session set `planner.enable_hashjoin` = true;
