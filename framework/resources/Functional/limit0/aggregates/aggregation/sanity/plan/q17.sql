explain plan for select * from (
select
	t1.a1,
	count(distinct t1.b1),
	sum(t2.a2)
from
	t1_v t1 inner join t2_v t2 on t1.c1 = t2.c2
group by
	t1.a1) t limit 0;
