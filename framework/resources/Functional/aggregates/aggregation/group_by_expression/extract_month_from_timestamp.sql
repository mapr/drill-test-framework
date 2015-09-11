select  
	extract(month from c_timestamp) 
from 
	alltypes  
group by 
	extract(month from c_timestamp) 
order by 
	extract(month from c_timestamp);
