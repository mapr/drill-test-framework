select
        cast(c_timestamp as timestamp),
        COUNT(*)
from    alltypes_with_nulls
group by
        c_timestamp
order by
        c_timestamp
	nulls last;
