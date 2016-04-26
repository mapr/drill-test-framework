explain plan for select * from (
select  
	cast(extract(month from c_timestamp) as bigint) 
from 
	alltypes_v  
group by 
	cast(extract(month from c_timestamp) as bigint) 
order by 
	cast(extract(month from c_timestamp) as bigint)) t limit 0;
