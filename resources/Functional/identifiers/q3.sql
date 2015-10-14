-- Different case in subquery and group by
select 	customerid,
	COUNT(CUSTOMERID)
from 
	( select CUSTOMERID from `customer.json` ) 
group by 
	customerid;
