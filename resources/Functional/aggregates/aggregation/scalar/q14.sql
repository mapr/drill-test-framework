-- count distinct in having clause
select
	count(distinct c_integer),
	count(distinct c_date)
from 
	alltypes
having 
	count(distinct c_date) > 0;
