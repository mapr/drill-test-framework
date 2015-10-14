select count(*) from cast_tbl_1 a, cast_tbl_2 b where a.c_integer = b.c_integer AND a.c_bigint <> CAST(b.c_float as BIGINT);
