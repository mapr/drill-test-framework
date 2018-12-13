set `exec.return_result_set_for_ddl` = false;
select first_name, last_name from cp.`employee.json` order by employee_id limit 5;
reset `exec.return_result_set_for_ddl`;