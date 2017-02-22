CREATE TEMPORARY TABLE tmp_t1 AS SELECT * FROM typeall_l;
WITH cte_on_tmptbl ( c1, c2, c3 )
AS
(
    SELECT col_int, col_chr, col_vrchr1 FROM tmp_t1 
)
SELECT * FROM cte_on_tmptbl;
DROP TABLE tmp_t1;
