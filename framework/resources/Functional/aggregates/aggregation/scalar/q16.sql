-- Difference with postgres
-- if I have count(distinct c_integer + c_integer) it overflows in postgres, drill returns correct result
select
	count(distinct c_integer-100 )
from 
	alltypes
having 
	count(distinct c_date) > 0;
