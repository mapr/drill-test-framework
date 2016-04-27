explain plan for select * from (
-- Had to comment out avg, running into DRILL-3653
select 
	sum(j1_v.c_integer) over(partition by j1_v.c_date order by j1_v.c_time),
	sum(j1_v.c_integer) over(),
	sum(j1_v.c_integer) over(partition by j1_v.c_bigint, j1_v.c_date, j1_v.c_time),
	--avg(j1_v.c_integer) over(partition by j1_v.c_date order by j1_v.c_time),
	--avg(j1_v.c_integer) over(),
	--avg(j1_v.c_integer) over(partition by j1_v.c_bigint, j1_v.c_date, j1_v.c_time),
	count(j1_v.c_integer) over(partition by j1_v.c_date order by j1_v.c_time),
	count(j1_v.c_integer) over(),
	count(j1_v.c_integer) over(partition by j1_v.c_bigint, j1_v.c_date, j1_v.c_time),
	rank() over(partition by j1_v.c_date order by j1_v.c_date ),
	rank() over(partition by j1_v.c_bigint, j1_v.c_date, j1_v.c_time order by j1_v.c_bigint, j1_v.c_date, j1_v.c_time)
from 
	j1_v, 
	j2_v j2 
where 
	j1_v.c_integer = j2.c_integer 
group by 
	j1_v.c_date, 
	j1_v.c_time, 
	j1_v.c_integer,
	j1_v.c_bigint) t limit 0;
