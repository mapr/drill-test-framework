explain plan for select * from (
-- Drill 3580
select 
	c_date, 
	c_integer, 
	max(c_integer) over (partition by c_date), 
	max(c_bigint - c_integer) over (partition by c_date) 
from 
	j1_v
) t limit 0;
