SELECT count(t2.col_bigint), t2.col_chr 
FROM tbl_bigint_l t1, tbl_bigint_r t2 
WHERE t1.col_bigint = t2.col_bigint OR ( t1.col_bigint IS NULL AND t2.col_bigint IS NULL ) 
group by t2.col_chr 
order by t2.col_chr;
