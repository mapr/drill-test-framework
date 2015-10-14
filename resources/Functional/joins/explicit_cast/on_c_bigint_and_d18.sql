select count(*) from cast_tbl_1 a, cast_tbl_2 b where CAST(a.c_bigint as DOUBLE PRECISION ) = CAST(b.d18 as DOUBLE PRECISION);
