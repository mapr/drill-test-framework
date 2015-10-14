select 
	calc1, 
	max(a1), 
	min(b1), 
	count(c1) 
from 	(
	select 	a1+10 as calc1, 
		a1, 
		b1, 
		c1 
	from 
		`drill-1977.json` 

	union all 
	
	select 	a1+100 as calc1, 
		a1, 
		b1, 
		c1 
	from 
		`drill-1977.json`
	) 
group by calc1;
