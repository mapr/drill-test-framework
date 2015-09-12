select employee.employee_id as c0, count(salary.employee_id) as m0 from employee as employee, salary as salary where salary.employee_id = employee.employee_id group by employee.employee_id;
