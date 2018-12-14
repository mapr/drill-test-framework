set `exec.return_result_set_for_ddl` = false;
--@test
create table `DRILL_6834_table_no_result_set` as select * from cp.`employee.json` limit 5;
drop table `DRILL_6834_table_no_result_set`;
reset `exec.return_result_set_for_ddl`;