select 
	count(*),
	case when a.c_integer is null then cast(100.0 as decimal(38,2)) else cast(a.c_integer as decimal(38,2)) end,
	case when a.c_bigint is null then cast(100.0 as decimal(38,2)) else cast(a.c_bigint as decimal(38,2)) end,
	case when a.d9 is null then cast(100.0 as decimal(38,2)) else cast(a.d9 as decimal(38,2)) end
from                                            
	alltypes_v a   left outer join alltypes_v b on (a.c_integer = b.c_integer)                         
		     left outer join alltypes_v c on (b.c_integer = c.c_integer)                 
group by
	case when a.c_integer is null then cast(100.0 as decimal(38,2)) else cast(a.c_integer as decimal(38,2)) end,
	case when a.c_bigint is null then cast(100.0 as decimal(38,2)) else cast(a.c_bigint as decimal(38,2)) end,
	case when a.d9 is null then cast(100.0 as decimal(38,2)) else cast(a.d9 as decimal(38,2)) end
order by
	case when a.c_integer is null then cast(100.0 as decimal(38,2)) else cast(a.c_integer as decimal(38,2)) end,
	case when a.c_bigint is null then cast(100.0 as decimal(38,2)) else cast(a.c_bigint as decimal(38,2)) end,
	case when a.d9 is null then cast(100.0 as decimal(38,2)) else cast(a.d9 as decimal(38,2)) end
	
