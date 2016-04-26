explain plan for select * from (
-- Arithmetic operation with two window functions
-- CAST function on top of windowed aggregate
select 
	c_date,
	c_time,
	c_integer,
	cast(count(*) over (partition by c_date ORDER BY c_time) as varchar(20))  ||  cast(sum(c_integer) OVER (partition by c_bigint order by c_time) as varchar(20)) 
from 
	j6_v 
where 
	c_integer is not null) t limit 0;
