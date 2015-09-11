-- exists outside subquery
-- not exists inside subquery
-- non correlated
select 
	a1,
	count(*)
from
	t1
where
	exists (select 
			a2 
		from 
			t2 
		where 	a2 = 5 and 
			not exists (select * from t3 where c3 < cast('2015-01-01' as date))
		)
group by
	a1
order by 
	a1
;
	
