select
        count(*)
from
        j1 INNER JOIN j4 ON
        (
         j1.c_date = j4.c_date
 	and j1.c_time = j4.c_time
 	and j1.c_timestamp = j4.c_timestamp
 	and j1.c_boolean = j4.c_boolean
 	and j1.c_varchar = j4.c_varchar
 	and j1.c_float = j4.c_float
 	and j1.c_double = j4.c_double
 	and j1.d9 = j4.d9
 	and j1.d18 = j4.d18
 	and j1.d28 = j4.d28
 	and j1.d38 = j4.d38

        )
where
        j1.c_date IN (select c_date from j2)
	--and exists (select d38 from j3 )
	and cast(j1.c_integer as bigint) <> j4.c_bigint
;
