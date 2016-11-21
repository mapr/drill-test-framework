select col_int, col_chr, col_bigint
from tbl_bigint_l t1
where col_int 
IN (
           SELECT col_int
           FROM tbl_bigint_r t2 
           WHERE t1.col_int = t2.col_int OR (t1.col_int IS NULL AND t2.col_int IS NULL)
    );
