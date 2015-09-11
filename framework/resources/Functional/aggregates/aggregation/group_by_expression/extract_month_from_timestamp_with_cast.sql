select  
	cast(extract(month from c_timestamp) as bigint) 
from 
	alltypes  
group by 
	cast(extract(month from c_timestamp) as bigint) 
order by 
	cast(extract(month from c_timestamp) as bigint);
