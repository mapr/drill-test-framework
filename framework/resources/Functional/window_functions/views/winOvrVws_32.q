CREATE OR REPLACE VIEW vwOnParq_32 (col_int, col_bigint, col_char_2, col_vchar_52, col_tmstmp, col_dt, col_booln, col_dbl, col_tm) AS SELECT col_int, col_bigint, col_char_2, col_vchar_52, col_tmstmp, col_dt, col_booln, col_dbl, col_tm from `forViewCrn.parquet`;
SELECT col_tm, cume_dist() over(ORDER BY col_tm) from vwOnParq_32;
DROP VIEW vwOnParq_32;
