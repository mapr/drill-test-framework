CREATE OR REPLACE VIEW vwOnParq_24 (col_int, col_bigint, col_char_2, col_vchar_52, col_tmstmp, col_dt, col_booln, col_dbl, col_tm) AS SELECT col_int, col_bigint, col_char_2, col_vchar_52, col_tmstmp, col_dt, col_booln, col_dbl, col_tm from `forViewCrn.parquet`;
SELECT col_int, rank() over(ORDER BY col_int ASc) from vwOnParq_24 ORDER BY 1;
DROP VIEW vwOnParq_24;
