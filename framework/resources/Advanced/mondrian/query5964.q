select employee_manager.management_role as c0 from employee as employee, employee as employee_manager where employee.supervisor_id = employee_manager.employee_id and UPPER(employee_manager.management_role) = UPPER('Middle Management') group by employee_manager.management_role order by employee_manager.management_role ASC NULLS LAST;
