CREATE OR REPLACE VIEW vwOnParq_29 (col_int, col_bigint, col_char_2, col_vchar_52, col_tmstmp, col_dt, col_booln, col_dbl, col_tm) AS SELECT col_int, col_bigint, col_char_2, col_vchar_52, col_tmstmp, col_dt, col_booln, col_dbl, col_tm from `forViewCrn.parquet`;
SELECT col_dt, dense_rank() over(ORDER BY col_dt) from vwOnParq_29;
DROP VIEW vwOnParq_29;
