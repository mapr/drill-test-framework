alter session set `planner.enable_hashjoin`=false;
CREATE TEMPORARY TABLE temp_tbl1 as SELECT t1.col_int c1, t2.col_int c2 FROM typeall_l t1, typeall_r t2 WHERE t1.col_int = t2.col_int;
SELECT * FROM temp_tbl1;
DROP TABLE temp_tbl1;
alter session set `planner.enable_hashjoin`=true;
