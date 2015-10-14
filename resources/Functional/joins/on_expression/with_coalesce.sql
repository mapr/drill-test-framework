select *
from 
	j1
	inner join
	j2
on (COALESCE(j1.c_bigint, -499871720) = j2.c_bigint);
