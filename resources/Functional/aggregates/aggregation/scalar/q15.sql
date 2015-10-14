-- count distinct in having clause
-- count distinct in having clause is not projected
select
	count(distinct c_integer)
from 
	alltypes
having 
	count(distinct c_date) > 0;
