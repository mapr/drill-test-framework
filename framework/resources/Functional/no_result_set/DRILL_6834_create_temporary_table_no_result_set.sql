set `exec.return_result_set_for_ddl` = false;
--@test
create temporary table dfs.tmp.`DRILL_6834_temp_table_no_result_set` as select * from cp.`employee.json` limit 5;
drop table dfs.tmp.`DRILL_6834_temp_table_no_result_set`;
reset `exec.return_result_set_for_ddl`;