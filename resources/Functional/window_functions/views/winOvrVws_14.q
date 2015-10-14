CREATE OR REPLACE VIEW vwOnParq_14 (col_int, col_bigint, col_char_2, col_vchar_52, col_tmstmp, col_dt, col_booln, col_dbl, col_tm) AS SELECT col_int, col_bigint, col_char_2, col_vchar_52, col_tmstmp, col_dt, col_booln, col_dbl, col_tm from `forViewCrn.parquet`;
SELECT count(*) over(PARTITION BY col_char_2 ORDER BY col_int) cnt, col_char_2 from vwOnParq_14 ORDER BY col_char_2;
DROP VIEW vwOnParq_14;
