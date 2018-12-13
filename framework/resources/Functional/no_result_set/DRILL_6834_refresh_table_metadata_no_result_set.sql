set `exec.return_result_set_for_ddl` = false;
create table `DRILL_6834_refresh_metadata_table_no_result_set` as select * from cp.`employee.json` limit 5;
refresh table metadata `DRILL_6834_refresh_metadata_table_no_result_set`;
drop table `DRILL_6834_refresh_metadata_table_no_result_set`;
reset `exec.return_result_set_for_ddl`;