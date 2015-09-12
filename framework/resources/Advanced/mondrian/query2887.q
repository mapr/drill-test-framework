select `position`.pay_type as c0 from employee as employee, `position` as `position` where employee.position_id = `position`.position_id and UPPER(`position`.pay_type) = UPPER('Hourly') group by `position`.pay_type order by `position`.pay_type ASC NULLS LAST;
