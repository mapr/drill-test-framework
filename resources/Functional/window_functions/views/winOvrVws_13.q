CREATE OR REPLACE VIEW vwOnParq_13 (col_int, col_bigint, col_char_2, col_vchar_52, col_tmstmp, col_dt, col_booln, col_dbl, col_tm) AS SELECT col_int, col_bigint, col_char_2, col_vchar_52, col_tmstmp, col_dt, col_booln, col_dbl, col_tm from `forViewCrn.parquet`;
SELECT AVG(col_dbl) OVER(PARTITION BY col_char_2 ORDER BY col_int) average FROM vwOnParq_13;
DROP VIEW vwOnParq_13;
