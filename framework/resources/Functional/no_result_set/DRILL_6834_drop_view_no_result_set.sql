set `exec.return_result_set_for_ddl` = false;
create view `DRILL_6834_drop_view_no_result_set` as select * from cp.`employee.json` limit 5;
--@test
drop view `DRILL_6834_drop_view_no_result_set`;
reset `exec.return_result_set_for_ddl`;