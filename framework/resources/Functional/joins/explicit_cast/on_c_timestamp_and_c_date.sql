select count(*) from cast_tbl_1 a INNER JOIN cast_tbl_2 b ON (a.c_integer = b.c_integer) where CAST(a.c_timestamp AS DATE) <> b.c_date;
