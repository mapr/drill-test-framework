CREATE OR REPLACE VIEW vwOnParq_10 (col_int, col_bigint, col_char_2, col_vchar_52, col_tmstmp, col_dt, col_booln, col_dbl, col_tm) AS SELECT col_int, col_bigint, col_char_2, col_vchar_52, col_tmstmp, col_dt, col_booln, col_dbl, col_tm from `forViewCrn.parquet`;
SELECT MIN(col_dbl) OVER(PARTITION BY col_char_2 ORDER BY col_int) min_dbl, col_char_2 FROM vwOnParq_10 ORDER BY 1;
DROP VIEW vwOnParq_10;
