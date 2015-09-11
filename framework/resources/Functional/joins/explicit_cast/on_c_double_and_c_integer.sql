select count(*) from cast_tbl_1 a INNER JOIN cast_tbl_2 b ON (a.c_integer = b.c_integer) AND CAST(a.c_double as INTEGER) = CAST(b.c_integer as BIGINT);
