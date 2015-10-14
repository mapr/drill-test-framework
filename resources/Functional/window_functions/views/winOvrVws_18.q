CREATE OR REPLACE VIEW vwOnParq_18 (col_int, col_bigint, col_char_2, col_vchar_52, col_tmstmp, col_dt, col_booln, col_dbl, col_tm) AS SELECT col_int, col_bigint, col_char_2, col_vchar_52, col_tmstmp, col_dt, col_booln, col_dbl, col_tm from `forViewCrn.parquet`;
SELECT MAX(col_tmstmp) OVER() FROM vwOnParq_18;
DROP VIEW vwOnParq_18;
