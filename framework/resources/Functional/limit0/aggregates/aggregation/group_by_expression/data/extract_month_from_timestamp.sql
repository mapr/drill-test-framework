select  
	extract(month from c_timestamp) 
from 
	alltypes_v  
group by 
	extract(month from c_timestamp) 
order by 
	extract(month from c_timestamp);
