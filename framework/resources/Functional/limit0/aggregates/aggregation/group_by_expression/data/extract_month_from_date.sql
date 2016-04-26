select  
	extract(month from c_date) 
from 
	alltypes_v  
group by 
	extract(month from c_date) 
order by 
	extract(month from c_date);
