CREATE OR REPLACE VIEW vwOnParq_27 (col_int, col_bigint, col_char_2, col_vchar_52, col_tmstmp, col_dt, col_booln, col_dbl, col_tm) AS SELECT col_int, col_bigint, col_char_2, col_vchar_52, col_tmstmp, col_dt, col_booln, col_dbl, col_tm from `forViewCrn.parquet`;
SELECT col_int, row_number() over(ORDER BY col_int ASc) from vwOnParq_27 ORDER BY 2;
DROP VIEW vwOnParq_27;
