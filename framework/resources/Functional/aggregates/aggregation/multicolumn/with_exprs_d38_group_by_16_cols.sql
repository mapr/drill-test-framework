select

				
		count(*)			as count_star,
 		sum(a.d38)		as sum_d38,
 		--round(avg(a.d38))	as round_avg_d38,
 		cast(avg(a.d38) as bigint)	as round_avg_d38,
 		--trunc(avg(a.d38))	as trunc_avg_d38,
 		cast(avg(a.d38) as bigint)	as trunc_avg_d38,
 		--sum(case when a.d38 = 0 then 100 else round(a.d38/12) end) as case_in_sum_d38,
 		cast(sum(case when a.d38 = 0 then 100 else round(a.d38/12) end) as bigint) as case_in_sum_d38,
 		--coalesce(sum(case when a.d38 = 0 then 100 else round(a.d38/12) end), 0) as case_in_sum_d38
 		cast(coalesce(sum(case when a.d38 = 0 then 100 else round(a.d38/12) end), 0) as bigint) as case_in_sum_d38
 
from
 		alltypes_with_nulls a
		left outer join alltypes_with_nulls b on (a.c_integer = b.c_integer)
		left outer join alltypes_with_nulls c on (b.c_integer = c.c_integer)
group by
  		a.c_varchar
 		,b.c_varchar
 		,c.c_varchar
 		,a.c_integer
 		,b.c_integer
 		,c.c_integer
 		,a.d9
 		,b.d9
 		,c.d9
 		,a.d18
 		,b.d18
 		,c.d18
 		,a.d28
 		,b.d28
 		,c.d28
 		,a.d38

 order by
  		a.c_varchar
 		,b.c_varchar
 		,c.c_varchar
 		,a.c_integer
 		,b.c_integer
 		,c.c_integer
 		,a.d9
 		,b.d9
 		,c.d9
 		,a.d18
 		,b.d18
 		,c.d18
 		,a.d28
 		,b.d28
 		,c.d28
 		,a.d38
;
