CREATE OR REPLACE VIEW vwOnParq_8 (col_int, col_bigint, col_char_2, col_vchar_52, col_tmstmp, col_dt, col_booln, col_dbl, col_tm) AS SELECT col_int, col_bigint, col_char_2, col_vchar_52, col_tmstmp, col_dt, col_booln, col_dbl, col_tm from `forViewCrn.parquet`;
SELECT SUM(col_dbl) OVER() sum_dbl FROM vwOnParq_8;
DROP VIEW vwOnParq_8;
