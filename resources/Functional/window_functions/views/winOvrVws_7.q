CREATE OR REPLACE VIEW vwOnParq_7 (col_int, col_bigint, col_char_2, col_vchar_52, col_tmstmp, col_dt, col_booln, col_dbl, col_tm) AS SELECT col_int, col_bigint, col_char_2, col_vchar_52, col_tmstmp, col_dt, col_booln, col_dbl, col_tm from `forViewCrn.parquet`;
SELECT MAX(col_dbl) OVER() max_dbl FROM vwOnParq_7;
DROP VIEW vwOnParq_7;
