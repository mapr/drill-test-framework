select count(*) from cast_tbl_1 a, cast_tbl_2 b where CAST(a.c_integer as BIGINT) = b.c_bigint;
