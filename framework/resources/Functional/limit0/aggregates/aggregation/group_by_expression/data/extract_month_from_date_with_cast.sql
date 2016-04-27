select  
	cast(extract(month from c_date) as bigint) 
from 
	alltypes_v  
group by 
	cast(extract(month from c_date) as bigint) 
order by 
	cast(extract(month from c_date) as bigint);
