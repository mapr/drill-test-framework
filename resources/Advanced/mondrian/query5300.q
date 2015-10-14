select count(*) as c0 from (select distinct employee.position_title as c0, employee.management_role as c1 from employee as employee) as init;
