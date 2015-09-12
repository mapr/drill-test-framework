select employee.employee_id as c0, sum(salary.salary_paid) as m0 from employee as employee, salary as salary where salary.employee_id = employee.employee_id group by employee.employee_id;
