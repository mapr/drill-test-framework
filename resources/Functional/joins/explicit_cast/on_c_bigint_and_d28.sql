select CAST(a.c_bigint as BIGINT), CAST(b.d28 as BIGINT) from cast_tbl_1 a, cast_tbl_2 b where CAST(a.c_bigint as BIGINT) = CAST(b.d28 as BIGINT) order by 1, 2 nulls last limit 3;
