-- OR filter in exists subquery
-- exists outside of subquery
-- non correlated
select 
	sum(a1)
from
	t1
where
	exists 	(
		select
			*
		from
			t2
		where
			(a2 = 5 or b2 = 'bbbbb') and
			(a2 <> 1 and b2 <> 'cccc' and c2 > date '2011-01-01')
		)	
;
