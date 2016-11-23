CREATE TABLE tbl_neq_jn AS SELECT t1.col_int c1, t1.col_chr c2, t1.col_dt c3, t2.col_int c4, t2.col_chr c5, t2.col_dt c6 FROM typeall_l t1, typeall_r t2 WHERE t1.col_int = t2.col_int OR ( t1.col_int IS NULL AND t2.col_int IS NULL );
select count(*) from tbl_neq_jn;
drop table tbl_neq_jn;
