-- left outer join
-- COALESCE on a join columns: both sides

select
        test.c_integer,
        test.c_bigint,
        test.c_float,
        test.c_double,
        test.d9,
        test.d18,
        test.d28,
        test.d38,
        test.c_date,
        test.c_time,
        test.c_timestamp,
        test.c_boolean,
        test.c_varchar,
        j2.c_integer,
        j2.c_bigint,
        j2.c_float,
        j2.c_double,
        j2.d9,
        j2.d18,
        j2.d28,
        j2.d38,
        j2.c_date,
        j2.c_time,
        j2.c_timestamp,
        j2.c_boolean,
        j2.c_varchar
from  	test 
	right outer join 
	j2
on     (
	COALESCE(test.c_integer, test.c_bigint) = COALESCE(j2.c_integer, j2.c_bigint)
	)
order by
	test.c_integer,
	test.c_bigint,
	test.c_float,
	test.c_double,
	test.d9,
	test.d18,
	test.d28,
	test.d38,
	test.c_date,
	test.c_time,
	test.c_timestamp,
	test.c_boolean,
	test.c_varchar
;
