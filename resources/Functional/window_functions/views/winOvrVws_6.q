CREATE OR REPLACE VIEW vwOnParq_6 (col_int, col_bigint, col_char_2, col_vchar_52, col_tmstmp, col_dt, col_booln, col_dbl, col_tm) AS SELECT col_int, col_bigint, col_char_2, col_vchar_52, col_tmstmp, col_dt, col_booln, col_dbl, col_tm from `forViewCrn.parquet`;
SELECT MIN(col_dbl) OVER() min_dbl FROM vwOnParq_6;
DROP VIEW vwOnParq_6;
