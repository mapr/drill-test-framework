explain plan for select * from (
select  
	extract(month from c_timestamp) 
from 
	alltypes_v  
group by 
	extract(month from c_timestamp) 
order by 
	extract(month from c_timestamp)) t limit 0;
